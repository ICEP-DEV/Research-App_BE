const nodemailer = require('nodemailer');
const bcrypt = require('bcryptjs');
const User = require('../models/userModel')
const catchAsync = require('../utils/catchAsync')
const jwt = require("jsonwebtoken")
const messagebird = require('messagebird')
const { getMaxListeners } = require('../app');
const { token } = require('morgan');
const cloudinary = require('../config/cloudinary');
const Projects = require('../models/projectModel');
const sequelize = require('../config/db');
const multer = require("multer");

const Chat = require('../models/chatModel');




exports.getAllUsers = catchAsync( async(req, res, next) =>{
    
    const users = await User.findAll({});
   if(!users){
       return next(new Error('Users not found!'))
   }
   else
    return res.send(users);
})

exports.getAllUsersWhere = catchAsync( async(req, res, next)=>
{
    const users = await Projects.findAll({ 
        where: {supervisorId : req.params.id},
        attributes:{
            exclude:["updatedAt", "createdAt",]
        },
        include: [
            {
                model: User,
                attributes:{
                    exclude: ["updatedAt", "createdAt", "password"]
                }
            }
        ]
    
    })
    console.log(req.user);

    if(!users)
    {
        return next(new Error('Document not found'));
    } 
    else
    {
        return res.send(users);
    }
})

exports.getUser = catchAsync( async(req, res, next) =>{

    let options ={ id : req.user.id}

    console.log(req.user)

    if(req.user.userType == 2 || req.user.userType == 3 && req.user.email) options = {email : req.user.email}


    const user = await User.findOne({
        where: options
    })

    if(!user) return next(new Error('Document not found'))

    res.status(200).json({
        status: "success",
        user
    })



})

exports.updateProfile = catchAsync(async (req, res, next) => {
    

    console.log(req.user.id)
   const user = await User.update(req.body,{ where: { id: req.user.id } });

    res.status(200).json({
        status: 'success',
        message: 'Profile successfully updated.'
    })
})

const fileStorage = multer.diskStorage({
    destination: (file,req,cb) =>{
        
        
        
            
         
        cb(null,'./public/images')  
    },
    filename: (req, file, cb) =>{
       // cb(null, file.originalname)
        console.log(file)
        
        
  
        const uniqueSuffix = Date.now() ;
        cb(null, uniqueSuffix + "_" + file.originalname    );

        req.file = file;
    }
    })
    

const fileFilter = (req, file, cb) => {


        if (file.mimetype.includes("image")) {
            cb(null, true);
        } else {

            cb(new Error("File must be an image"), false);
        }

    


};

const upload = multer({ storage: fileStorage, fileFilter: fileFilter });

exports.uploadProfileImage = upload.single('photo')

//exports.uploadDocument =  upload.single('document')
    
exports.makeUserAdmin = catchAsync(async(req, res, next)=>{
    // req.body.userId = req.user.id
    const body = req.body;
    const user = await User.update(body, {where: {id: body.id}});
    if(!user){
        return next(new Error('Oops!Something went wrong'));
    }
    res.status(200).json({
        status: "success",
        message: "User updated successfully",
        user
    });
});

    
   
  
  exports.updateUser =  async(req, res, next) => { 

    req.body.userId = req.user.id;
    req.body.photo = req.file.filename;

    const user = await User.update(req.body,{ where: { id: req.user.id } });

    res.status(200).json({
        status: "success",
        message: "Profile picture successfully uploaded"
        
      });

}


exports.registerUser = catchAsync(async(req, res, next) =>{
    const newUser = await User.create(req.body);
    res.status(200).json({
        status: "success",
        newUser,
        message: "User Succefully Created proceed to login"
    })

})


exports.loginUser = catchAsync(async(req, res, next)=>{
    const loginUser = User.findOne({where:{email: req.body.email, password: req.body.password} })
    if(!loginUser) return next(new Error("User does not exist"));
    res.status(200).json({
        status: "success",
        message: "User Logged in",
        data: loginUser
    });
});



exports.assignStudentSupervisor = catchAsync(async(req, res, next)=>{
    const line = `CALL 	assignStudentSupervisor(${req.body.projectIdreq}, ${req.body.supervisorId})`;//
    console.log(line);
    const response = await sequelize.query(line, {
        nest:true,
        type: sequelize.QueryTypes.EXEC
    });
    res.status(200).json({
        status: "success",
        message: "Change was successfull",
        data: response
    });

})



exports.getAllSupervisors = catchAsync(async(req, res, next)=>{
    const line = `CALL getAllSupervisors(${req.params.disciplineId})`;
    console.log(line);
    const supervisors = await sequelize.query(line, {
        nest:true,
        type: sequelize.QueryTypes.EXEC
    });
    res.status(200).json({
        status: "success",
        results: supervisors.length,
        data: supervisors
    });

})

exports.adminGetNewUsers = catchAsync(async(req, res, next)=>{
    // const line = `
    // SET @${req.params.disciplineId};
    // CALL \`adminGetNewUsers\`(@disciplineId);`;asdfasd
    const line = `CALL adminGetNewUsers(${req.params.disciplineId})`;
    console.log(line);
    const newUsers = await sequelize.query(line, {
        nest:true,
        type: sequelize.QueryTypes.EXEC
    });
    console.log(line);

    // if(!notifications)  return next(new Error('Document does not exist\n' + line));
    
    res.status(200).json({
        status: "success",
        results: newUsers.length,
        data: newUsers
    });
});
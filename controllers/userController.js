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
        cb(null, file.originalname + "-" + uniqueSuffix  );

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
    

    
   
  
  exports.updateUser =  async(req, res, next) => { 

    req.body.userId = req.user.id;
    req.body.photo = req.file.filename;

    const user = await User.update(req.body,{ where: { id: req.user.id } });

    res.status(200).json({
        status: "success",
        message: "Profile picture successfully uploaded"
        
      });

}


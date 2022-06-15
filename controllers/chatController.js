const catchAsync = require('../utils/catchAsync');
const Chat = require('../models/chatModel');
const sequelize = require('../config/db');
const User = require('../models/userModel');
const ChatGroup = require('../models/chatGroupModel');
const multer = require('multer')





exports.viewChats = catchAsync(async (req, res, next) => {
    console.log("hey", req.params)



    const chat = await Chat.findAll({
        where: {
            chatGroupId: req.params.id
        },
        include: [
            {
                model: User,
                attributes: {
                    exclude: ["updatedAt", "createdAt", "password"]
                },
            },
            {
                model: ChatGroup,
                attributes: {
                    exclude: ["updatedAt", "createdAt"]
                },
            },
        ],
    })

    if (!chat) {
        return next(new Error('Oops!something went wrong.'))
    }
    res.status(200).json({
        status: "success",
        message: "Welcome to chat endpoint😎",
        chat
    });
});


exports.sendMessage = catchAsync(async(req,res,next) =>{
    req.body.userId = req.user.id;
    req.body.chatGroupId = req.params.id
   const body = req.body
   // console.log(req.route.path)
if(req.route.path == "/uploadDocument/:id"){
    req.body.text = req.file.filename;
    
}
    const chat = await Chat.create(body)
    res.status(200).json({
        status: "success",
        message: "message successfully sent.",
        chat
    })
})

const fileStorage = multer.diskStorage({
    destination: (file,req,cb)=>{
                //  C:\Users\Programmer\ResearchApp\Research-App_UI\src\assets\userfiles\documents
        cb(null,'C:/Users/Programmer/ResearchApp/Research-App_UI/src/assets/userfiles/documents')  
    },
    filename: (req, file, cb)=>{
        console.log(file)
        const uniqueSuffix = Date.now() ;
        cb(null, uniqueSuffix + "-" + file.originalname);
        req.file = file;
        }
    })
    

const fileFilter = (req, file, cb) => {
    if(file.mimetype.includes("document")){
        cb(null, true);
    } 
    else{
        cb(new Error("File must be a document"), false);
    }
};

const upload = multer({ storage: fileStorage, fileFilter: fileFilter });



exports.uploadDocument =  upload.single('document')




exports.getChatsWhere = catchAsync(async (req, res, next) => {
    //We only need to get the ID of the chatGroup
    console.log("We are withing", req.params);
    const chat = await sequelize.query(`SELECT email, text, chats.createdAt, userType
    FROM users, chats, chatGroups
    WHERE chats.userId = users.id
    AND chats.chatGroupId = chatgroups.id
    AND chatgroups.id = ${req.params.id};`)
})
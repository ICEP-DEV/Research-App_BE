const catchAsync = require('../utils/catchAsync');
const Chat = require('../models/chatModel');
const sequelize = require('../config/db');
const User = require('../models/userModel');
const ChatGroup = require('../models/chatGroupModel');





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
   const body = req.body
   

    const chat = await Chat.create(body)

    res.status(200).json({
        status: "success",
        message: "message successfully sent.",
        chat
    })
})


exports.getChatsWhere = catchAsync(async (req, res, next) => {
    //We only need to get the ID of the chatGroup
    console.log("We are withing", req.params);
    const chat = await sequelize.query(`SELECT email, text, chats.createdAt, userType
    FROM users, chats, chatGroups
    WHERE chats.userId = users.id
    AND chats.chatGroupId = chatgroups.id
    AND chatgroups.id = ${req.params.id};`)
})
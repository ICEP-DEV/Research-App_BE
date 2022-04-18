const catchAsync  = require('../utils/catchAsync');
const Chat = require('../models/chatModel')
const ChatGroup = require('../models/chatGroupModel')

exports.viewChats = catchAsync(async(req,res,next)=> {
    
    const chatGroup = await ChatGroup.findAll({where: {}})
    const chat = await Chat.findAll({where: {chatGroupId : chatGroup.chatGroupId}})
    
    if(!chatGroup||!chat){
        return next(new Error('Oops!something went wrong.'))
    }
    res.status(200).json({
      status: "success",
      message: "Welcome to chat endpoint😎",
      chatGroup,
      chat
    });
});


exports.supervisorChat = catchAsync(async(req,res,next) =>{

    const chat = await Chat.create(req.body,{where:{id: req.params.id}})

    res.status(200).json({
        status : "success",
        message: "Welcome to supervisor endpoint😎",
        chat
    })
})

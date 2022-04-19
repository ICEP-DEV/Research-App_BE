const catchAsync  = require('../utils/catchAsync');
const Chat = require('../models/chatModel')
const ChatGroup = require('../models/chatGroupModel')



exports.viewChats = catchAsync(async(req,res,next)=> {
    console.log(req.user.disciplineId)
     const chatGroup = await ChatGroup.findAll({where: {disciplineId: req.user.disciplineId}});
     
    const chat = await Chat.findAll({where: {chatGroupId : chatGroup[0].id}})
    
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

    

    const chat = await Chat.create(req.body,{where:{userId: req.user.id}})

    res.status(200).json({
        status : "success",
        message: "message successfully sent.",
        chat
    })
})

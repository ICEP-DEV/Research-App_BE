const catchAsync  = require('../utils/catchAsync');
const Chat = require('../models/chatModel')




exports.viewChats = catchAsync(async(req,res,next)=> {
    console.log("hey",req.param)
    
    
     
    const chat = await Chat.findAll({where: {chatGroupId : req.param.id}})
    
    if(!chat){
        return next(new Error('Oops!something went wrong.'))
    }
    res.status(200).json({
      status: "success",
      message: "Welcome to chat endpoint😎",
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

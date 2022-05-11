const catchAsync  = require('../utils/catchAsync');
const Chat = require('../models/chatModel')




exports.viewChats = catchAsync(async(req,res,next)=> {
    console.log("hey",req.query)
    
    
     
    const chat = await Chat.findAll({where: {chatGroupId : req.query.id}})
    
    if(!chat){
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
        status : "success",
        message: "message successfully sent.",
        chat
    })
})

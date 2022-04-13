const catchAsync  = require('../utils/catchAsync');
const chat = require('../models/chatModel')

exports.viewChats = catchAsync(async(req,res,next)=> {


    res.status(200).json({
      status: "success",
      message: "Welcome to chatBox endpoint😎"
    });
});


exports.supervisorChat = catchAsync(async(req,res,next) =>{


    res.status(200).json({
        status : "success",
        message: "Welcome to supervisor endpoint😎"
    })
})

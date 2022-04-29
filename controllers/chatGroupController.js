const catchAsync  = require('../utils/catchAsync');
const ChatGroup = require('../models/chatGroupModel')


exports.viewChatGroups = catchAsync(async(req,res,next)=> {
    console.log(req.user.disciplineId)
     
    const chatGroups = await ChatGroup.findAll({where: {disciplineId: req.user.disciplineId}});
    
    
    if(!chatGroups){
        return next(new Error('Oops!something went wrong.'))
    }
    res.status(200).json({
      status: "success",
      message: "Welcome to chat endpoint😎",
      chatGroups
    });
});

exports.createChatGroup = catchAsync(async(req,res,next)=> {
  console.log(req.user.disciplineId)
   
  const chatGroup = await ChatGroup.create(req.body);
  
  
  
  res.status(200).json({
    status: "success",
    message: "Welcome to chat endpoint😎",
    chatGroup
  });
});


exports.viewChatGroup = catchAsync(async(req,res,next)=> {
  
   
  const chatGroup = await ChatGroup.findAll({where: {id: req.params.id}});
  
  
  if(!chatGroup){
      return next(new Error('Oops!something went wrong.'))
  }

  res.status(200).json({
    status: "success",
    message: "Welcome to chat endpoint😎",
    chatGroup
  });
});

exports.updateChatGroup = catchAsync(async(req,res,next)=> {
  
   
  const chatGroup = await ChatGroup.update({where: {id: req.params.id}});
  
  
  if(!chatGroup){
      return next(new Error('Oops!something went wrong.'))
  }

  res.status(200).json({
    status: "success",
    message: "Welcome to chat endpoint😎",
    chatGroup
  });
});


exports.deleteChatGroup = catchAsync(async(req,res,next)=> {
  
   
  const chatGroup = await ChatGroup.delete({where: {id: req.params.id}});
  
  
  if(!chatGroup){
      return next(new Error('Oops!something went wrong.'))
  }

  res.status(200).json({
    status: "success",
    message: "Welcome to chat endpoint😎",
    chatGroup
  });
});

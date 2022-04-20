const catchAsync  = require('../utils/catchAsync');
const ChatGroup = require('../models/chatGroupModel')


exports.viewChatGroups = catchAsync(async(req,res,next)=> {
    console.log(req.user.disciplineId)
     
    const chatGroup = await ChatGroup.findAll({where: {disciplineId: req.user.disciplineId}});
    
    
    if(!chatGroup){
        return next(new Error('Oops!something went wrong.'))
    }
    res.status(200).json({
      status: "success",
      message: "Welcome to chat endpoint😎",
      chatGroup
    });
});

const catchAsync  = require('../utils/catchAsync');
const Feedback = require("../models/feedBackModel");

exports.sendFeedback = catchAsync(async(req,res,next) =>{
 req.body.userId = req.user.id

 const feedback = await Feedback.create(req.body)

 if(!feedback) return next(new Error("Oops! Something went wrong"))

 res.status(200).json({
     status: "success",
     message: "Feedback successfully sent.",
     feedback
 })


})

exports.getFeedback = catchAsync(async(req,res, next) =>{
    
    const feedback = await Feedback.findAll({where: {goalId: req.params.id}})
    
    if(!feedback) return next(new Error("Document not found"))
    
    res.status(200).json({
        status: "success",
        message: "Welcome to feedback endpoint",
        feedback
    })
})
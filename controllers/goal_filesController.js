const catchAsync = require('../utils/catchAsync');
const GoalFiles = require('../models/goalFilesModel');


exports.getGoalFile = catchAsync(async(req,res, next) =>{

   const goalFile = await GoalFiles.findAll({where:{goalId: req.params.id}})

   if(!goalFile) return next(new Error("Document does not exist."))
    res.status(200).json({

        status: "success",
        message: "Welcome to goal files endpoint😎",
        goalFile

    })
})

exports.uploadGoalFile = catchAsync(async(req,res,next) =>{

req.body.file_name = req.file.filename
req.body.goalId = req.params.goalId

const goalFile = await GoalFiles.create(req.body);

if(!goalFile) return next(new Error("Oops! Something went wrong"));

res.status(200).json({

    status: "succes",
    message: "Goal file successfully uploaded.",
    goalFile
})
})
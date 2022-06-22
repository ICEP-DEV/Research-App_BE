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

    req.body.file_name = req.file.filename;
    //The goal that I have right now is to test if I can work on making sure that the goalId is not a string value but that it is rather a number
    let goalId = req.params.id;
    req.body.goalId = parseInt(goalId);

    console.log(req.body);
    const goalFile = await GoalFiles.create(req.body);

    if(!goalFile) return next(new Error("Oops! Something went wrong"));

    res.status(200).json({

        status: "succes",
        message: "Goal file successfully uploaded.",
        goalFile
    })
})
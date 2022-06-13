
const catchAsync  = require('../utils/catchAsync');
const Goal = require('../models/goalModel');
const ProjectStatus = require('../models/projectStatusModel');
const Feedback = require('../models/feedBackModel');
const User = require('../models/userModel');

exports.createGoal = catchAsync(async(req, res, next) => {
    req.body.userId = req.user.id;
    const goal = await Goal.create(req.body)
    
    

    if(!goal)return next(new Error('Oops! something went wrong.'));
 
    res.status(200).json({
        status: "success",
        message: "Goal successfully created",
        goal
    })

})

exports.viewAllGoals = catchAsync(async (req, res, next) => {

    const goal = await Goal.findAll({where:{userId: req.user.id}})

    if(!goal)return next(new Error('Document does not exist'))

    res.status(200).json({
        status: "success",
        message: "Welcome to goal endpoint😎",
        goal
    })
})

exports.viewAllGoalsWhere = catchAsync(async (req, res, next) => {

    const goal = await Goal.findAll({where:{userId: req.user.id} && {projectId:req.params.id },
    include:[
        { model:ProjectStatus },
        { model:Feedback},
        { model:User, attribues: {
            exclude: ["createdAt","disciplineId", "email", "firstName", "id", "idNumber", "lastName", "password", "photo", "references", "title", "updatedAt", "verified"]
        }},

    ]})

    if(!goal)return next(new Error('Document does not exist'))

    res.status(200).json({
        status: "success",
        message: "Welcome to goal endpoint😎",
        goal
    })
})

exports.viewAllGoalsWhereStudentIsOwner = catchAsync(async (req, res, next) => {

    const goal = await Goal.findAll({where:{userId: req.user.id} && {projectId:req.params.id },
    include:[
        { model:ProjectStatus },
        { model:Feedback,  order: ['id', DESC]},
        { model:User, attribues: {
            exclude: ["createdAt","disciplineId", "email", "firstName", "id", "idNumber", "lastName", "password", "photo", "references", "title", "updatedAt", "verified"]
        }},

    ]})

    if(!goal)return next(new Error('Document does not exist'))

    res.status(200).json({
        status: "success",
        message: "Welcome to goal endpoint😎",
        goal
    })
})

exports.viewGoals = catchAsync(async (req, res, next) => {

    const goal = await Goal.findAll({where: {id: req.params.id} })

    if(!goal)return next(new Error('Document does not exist'))

    res.status(200).json({
        status: "success",
        message: "Welcome to goal endpoint😎",
        goal

    })
})

exports.updateGoal = catchAsync(async (req, res, next) => {
    const goal = await Goal.update(req.body, {where: {id: req.params.id}})
    if(!goal) return next(new Error('Document does not exist'));
    res.status(200).json({
        status: "success",
        message: "goal successfully updated",
        goal
    })
})

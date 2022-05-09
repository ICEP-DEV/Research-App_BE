
const catchAsync  = require('../utils/catchAsync');
const Goal = require('../models/goalModel');

exports.createGoal = catchAsync(async(req, res, next) => {
    const user = req.user.id;
    const goal = await Goal.create(req.body, {where:{userId : req.params.id}})
    const id = goal.userId

    if(!goal)return next(new Error('Document does not exist'));
 
    res.status(200).json({
        status: "success",
        message: "Goal successfully created",
        goal

    })

})

exports.viewAllGoals = catchAsync(async (req, res, next) => {

    const goal = await Goal.findAll({})

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

    const goal = await Goal.patch(req.body, {where: {id: req.params.id}})

    if(!goal) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "goal successfully updated",
        goal
    })


})

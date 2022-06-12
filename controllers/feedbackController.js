const catchAsync  = require('../utils/catchAsync');
const Feedback = require("../models/feedBackModel");
const sequelize = require('../config/db');
const Link = require('../models/linksModel');

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

exports.updateFeedback = catchAsync(async(req, res, next)=>{
    const feedback = await Feedback.update(req.body, {where: {id: req.params.id}});
    if(!feedback) return next(new Error('Document does not exist'));
    res.status(200).json({
        status: "success",
        message: "feedback successfully updated",
        feedback
    });
});

exports.getFeedback = catchAsync(async(req,res, next) =>{
    
    const feedback = await Feedback.findAll({where: {goalId: req.params.id}})
    
    if(!feedback) return next(new Error("Document not found"))
    
    res.status(200).json({
        status: "success",
        message: "Welcome to feedback endpoint",
        feedback
    })
})

exports.getAllStudentProjectNotifications = catchAsync(async(req, res, next)=>{
    
    const line = `SELECT \`project_statuses\`.\`status\`, COUNT(\`feedbacks\`.\`id\`) \`countfeedback\`, \`projects\`.\`id\` AS \`projectId\`
    FROM \`projects\`, \`goals\`, \`feedbacks\`, \`project_statuses\`
    WHERE \`projects\`.\`userId\` = ${req.user.id}
      AND \`projects\`.\`id\` = \`goals\`.\`projectId\`
      AND \`goals\`.\`id\` = \`feedbacks\`.\`goalId\`
      AND \`project_statuses\`.\`id\` = \`feedbacks\`.\`projectStatusId\`
      AND \`feedbacks\`.\`projectStatusId\` = 13
      AND \`projects\`.\`id\` = ${req.params.id}
    GROUP BY \`projects\`.\`id\`, \`project_statuses\`.\`status\``;
    const notifications = await sequelize.query(line, {
        nest:true,
        type: sequelize.QueryTypes.SELECT
    });
    console.log(line);

    // if(!notifications)  return next(new Error('Document does not exist\n' + line));
    
    res.status(200).json({
        status: "success",
        results: notifications.length,
        notifications
    });
});


exports.getAllSupervisorProjectNotifications = catchAsync(async(req, res, next)=>{
    
    const line = `SELECT \`project_statuses\`.\`status\`, COUNT(\`feedbacks\`.\`id\`) \`Total Feedbacks\`, \`projects\`.\`id\` AS \`Project ID\`
    FROM \`projects\`, \`goals\`, \`feedbacks\`, \`project_statuses\`
    WHERE \`projects\`.\`supervisorId\` = ${req.user.id}
      AND \`projects\`.\`id\` = \`goals\`.\`projectId\`
      AND \`goals\`.\`id\` = \`feedbacks\`.\`goalId\`
      AND \`project_statuses\`.\`id\` = \`feedbacks\`.\`projectStatusId\`
      AND \`feedbacks\`.\`projectStatusId\` = 13
      AND \`projects\`.\`id\` = ${req.params.id}
    GROUP BY \`projects\`.\`id\`, \`project_statuses\`.\`status\``;
    const notifications = await sequelize.query(line, {
        nest:true,
        type: sequelize.QueryTypes.SELECT
    });
    console.log(line);
    
    res.status(200).json({
        status: "success",
        results: notifications.length,
        notifications
    });
});



exports.CountFeedbacksForAGivenGoal = catchAsync(async(req, res, next)=>{
    const line = `SELECT \`goals\`.\`id\`, \`project_statuses\`.\`status\`, COUNT(\`feedbacks\`.\`id\`) \`countfeedbacks\`, \`projects\`.\`id\` AS \`projectId\`
    FROM \`projects\`, \`goals\`, \`feedbacks\`, \`project_statuses\`
    WHERE \`projects\`.\`id\` = \`goals\`.\`projectId\`
        AND \`goals\`.\`id\` = \`feedbacks\`.\`goalId\`
        AND \`project_statuses\`.\`id\` = \`feedbacks\`.\`projectStatusId\`
        AND \`feedbacks\`.\`projectStatusId\` = 13
        AND \`goals\`.\`id\` = ${req.params.id}
        AND \`feedbacks\`.\`userId\` <> ${req.user.id}
    GROUP BY \`projects\`.\`id\`, \`project_statuses\`.\`status\`,\`goals\`.\`id\``;


    const notifications = await sequelize.query(line, {
        nest:true,
        type: sequelize.QueryTypes.SELECT
    });
    console.log(line);
    
    res.status(200).json({
        status: "success",
        results: notifications.length,
        notifications
    });
})



//We need to be able to count the total number of notifications from each goal - 
//Firstly select a goal
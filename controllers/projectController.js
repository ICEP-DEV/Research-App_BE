const Project = require("../models/projectModel");
const catchAsync  = require('../utils/catchAsync')

exports.createProject = catchAsync(async(req,res,next)=> {
//     try {
//         const project =  await Project.create(req.body);
//     } catch (err) {
// let errors = {}
// let message = '';
//          if (err.errors) {
//        errors = Object.values(err.errors).map((el) => el.message);
//        message = `Invalid input data : ${errors.join(', ')}`;
//          }

//     return res.status(200).json({
//         status: "fail",
//         message
        
//     })
    // }
    const project =  await Project.create(req.body);
    
    res.status(200).json({
        status: "success",
        project
    })
})

exports.getAllProjects = async(req,res,next)=> {

    const projects = await Project.findAll({});

    res.status(200).json({
        status: "success",
        message: "Hello from get all Project route 😜",
        projects
    })
}

exports.getProject = async(req, res, next) =>{
    
    const project = await Project.findOne({
        where: {id : req.params.id}
    })
    res.status(200).json({
        status: "success",
        project
    })
}

exports.updateProject = async(req, res, next) =>{
    const {body} = req;
    const project = await Project.update(body,
        {
        where: {id : req.params.id}
    })
    res.status(200).json({
        status: "success",
        message: "Project updated",
        project
    })
}


exports.deleteProject = async(req, res, next) =>{

    const project = await Project.destroy(
        {
        where: {id : req.params.id}
    })
    res.status(200).json({
        status: "success",
        message: "Project deleted",
        project
    })
}
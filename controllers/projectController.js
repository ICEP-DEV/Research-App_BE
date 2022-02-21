const Project = require("../models/projectModel");


exports.createProject = (req,res,next)=> {
    res.status(200).json({
        status: "success",
        message: "Hello from create Project route 😜"
    })
}

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
const ProjectStatus = require("../models/projectStatusModel");
const catchAsync  = require('../utils/catchAsync')

exports.createProjectStatus = catchAsync(async(req,res,next)=> {


    const projectStatus =  await ProjectStatus.create(req.body);
    
    res.status(200).json({
        status: "success",
        projectStatus
    })
})

exports.getAllProjectStatuses = async(req,res,next)=> {

    const projectStatuses = await ProjectStatus.findAll({});

    res.status(200).json({
        status: "success",
        message: "Hello from get all Project Status route 😜",
        results: projectStatuses.length,
        projectStatuses
    })
}

exports.getProjectStatus = async(req, res, next) =>{
    
    const projectStatus = await ProjectStatus.findOne({
        where: {id : req.params.id}
    })

    if(!projectStatus) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        projectStatus
    })
}

exports.updateProjectStatus = async(req, res, next) =>{
    const {body} = req;
    
    const projectStatus = await ProjectStatus.update(body,
        {
        where: {id : req.params.id}
    })

    if(!projectStatus[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "Project Status updated",
        projectStatus
    })
}


exports.deleteProjectStatus = async(req, res, next) =>{

    // const faculty=0;
    const projectStatus = await ProjectStatus.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(projectStatus)
    if(!projectStatus) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        message: "Project Status deleted",
        projectStatus
    })
}
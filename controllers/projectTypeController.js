const ProjectType = require("../models/projectTypeModel");
const catchAsync  = require('../utils/catchAsync')

exports.createProjectType = catchAsync(async(req,res,next)=> {


    const projectType =  await ProjectType.create(req.body);
    
    res.status(200).json({
        status: "success",
        projectType
    })
})

exports.getAllProjectTypes = async(req,res,next)=> {

    const projectTypes = await ProjectType.findAll({});

    res.status(200).json({
        status: "success",
        message: "Hello from get all Project route 😜",
        results: projectTypes.length,
        projectTypes
    })
}

exports.getProjectType = async(req, res, next) =>{
    
    const projectType = await ProjectType.findOne({
        where: {id : req.params.id}
    })

    if(!projectType) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        projectType
    })
}

exports.updateProjectType = async(req, res, next) =>{
    const {body} = req;
    
    const projectType = await ProjectType.update(body,
        {
        where: {id : req.params.id}
    })

    if(!projectType[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "Project updated",
        projectType
    })
}


exports.deleteProjectType = async(req, res, next) =>{

    // const faculty=0;
    const projectType = await ProjectType.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(projectType)
    if(!projectType) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        message: "Project deleted",
        projectType
    })
}
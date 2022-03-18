const Faculty = require("../models/facultyModel");
const catchAsync  = require('../utils/catchAsync')

exports.createFaculty = catchAsync(async(req,res,next)=> {


    const faculty =  await Faculty.create(req.body);
    
    res.status(200).json({
        status: "success",
        faculty
    })
})

exports.getAllFaculties = async(req,res,next)=> {

    const faculties = await Faculty.findAll({});

    res.status(200).json({
        status: "success",
        message: "Hello from get all Project route 😜",
        results: faculties.length,
        faculties
    })
}

exports.getFaculty = async(req, res, next) =>{
    
    const faculty = await Faculty.findOne({
        where: {id : req.params.id}
    })

    if(!faculty) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        faculty
    })
}

exports.updateFaculty = async(req, res, next) =>{
    const {body} = req;
    
    const faculty = await Faculty.update(body,
        {
        where: {id : req.params.id}
    })

    if(!faculty[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "Project updated",
        faculty
    })
}


exports.deleteFaculty = async(req, res, next) =>{

    // const faculty=0;
    const faculty = await Faculty.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(faculty)
    if(!faculty) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        message: "Project deleted",
        faculty
    })
}
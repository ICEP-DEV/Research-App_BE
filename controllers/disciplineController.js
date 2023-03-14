const Discipline = require("../models/disciplineModel");
const catchAsync  = require('../utils/catchAsync')

exports.createDiscipline = catchAsync(async(req,res,next)=> {

    const discipline =  await Discipline.create(req.body);
    
    res.status(200).json({
        status: "success",
        discipline
    })
})

exports.getAllDisciplines = async(req,res,next)=> {

    const disciplines = await Discipline.findAll({});

    res.status(200).json({
        status: "success",
        message: "Hello from get all Disciplines route 😜",
        results: disciplines.length,
        disciplines
    })
}

exports.getDiscipline = async(req, res, next) =>{
    
    const discipline = await Discipline.findOne({
        where: {id : req.params.id}
    })

    if(!discipline) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        discipline
    })
}

exports.updateDiscipline = async(req, res, next) =>{
    const {body} = req;
    
    const discipline = await Discipline.update(body,
        {
        where: {id : req.params.id}
    })

    if(!discipline[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "Discipline updated",
        discipline
    })
}

exports.getFacultyDiscipline = async(req, res, next) =>{
    const discipline  = await Discipline.findAll({
        where: {facultyId: req.params.id}
    })

    if(!discipline[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "Disciplines Found",
        discipline
    })
}

exports.deleteDiscipline = async(req, res, next) =>{

    // const projects=0;
    const discipline = await Discipline.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(discipline)
    if(!discipline) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        message: "Discipline deleted",
        discipline
    })
}
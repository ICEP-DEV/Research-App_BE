const Subguide = require("../models/subguidesModel");
const catchAsync  = require('../utils/catchAsync')

exports.createSubguide = catchAsync(async(req,res,next)=> {


    const subguide =  await Subguide.create(req.body);
    
    res.status(200).json({
        status: "success",
        subguide
    })
})

exports.getAllSubguides = async(req,res,next)=> {

    const subguides = await Subguide.findAll({});

    res.status(200).json({
        status: "success",
        message: "Hello from get all Project route 😜",
        results: subguides.length,
        subguides
    })
}

exports.getSubguide = async(req, res, next) =>{
    
    const subguide = await Subguide.findOne({
        where: {id : req.params.id}
    })

    if(!subguide) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        subguide
    })
}

exports.updateSubguide = async(req, res, next) =>{
    const {body} = req;
    
    const subguide = await Subguide.update(body,
        {
        where: {id : req.params.id}
    })

    if(!subguide[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "Project updated",
        subguide
    })
}


exports.deleteSubguide = async(req, res, next) =>{

    // const faculty=0;
    const subguide = await Subguide.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(subguide)
    if(!subguide) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        message: "Project deleted",
        subguide
    })
}
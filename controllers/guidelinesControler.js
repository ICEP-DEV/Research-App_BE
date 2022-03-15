const Guideline = require("../models/guidelinesModel");
const catchAsync  = require('../utils/catchAsync')

exports.createGuideline = catchAsync(async(req,res,next)=> {

    const guideline =  await Guideline.create(req.body);
    
    res.status(200).json({
        status: "success",
        guideline
    })
})

exports.getAllGuidelines = async(req,res,next)=> {

    const guidelines = await Guideline.findAll({});

    res.status(200).json({
        status: "success",
        results: guidelines.length,
        guidelines
    })
}

exports.getGuideline = async(req, res, next) =>{
    
    const guideline = await Guideline.findOne({
        where: {guidelineId : req.params.id}
    })

    if(!guideline) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        guideline
    })
}

exports.updateGuideline = async(req, res, next) =>{
    const {body} = req;
    const guideline = await Guideline.update(body,
        {
        where: {guidelineId : req.params.id}
    })

    if(!guideline[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        guideline
    })
}


exports.deleteGuideline = async(req, res, next) =>{

    // const projects=0;
    const guideline = await Guideline.destroy(
        {
        where: {guidelineId : req.params.id}
    })

    console.log(guideline)
    if(!guideline) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        guideline
    })
}
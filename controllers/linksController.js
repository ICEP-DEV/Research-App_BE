const Link = require("../models/linksModel");
const catchAsync  = require('../utils/catchAsync')
const sequelize = require('../config/db')

exports.createLink = catchAsync(async(req,res,next)=> {

    const link =  await Link.create(req.body);
    
    res.status(200).json({
        status: "success",
        link
    })
})

exports.getAllLinks = async(req,res,next)=> {

    // const guidelines = await Guideline.findAll({});
// const line = `SELECT * FROM disciplines, project_types, guidelines WHERE disciplines.disciplineId = project_types.disciplineId AND project_types.projectTypeId = 3 AND guidelines.projectTypeId = project_types.projectTypeId;  `
const line = `SELECT * FROM links ;  `
   
const links = await sequelize.query(line , {
        nest: true,
        type: sequelize.QueryTypes.SELECT
      });


    res.status(200).json({
        status: "success",
        results: links.length,
        links
    })
}

exports.getLink = async(req, res, next) =>{
    
    const link = await Link.findOne({
        where: {id : req.params.id}
    })

    if(!link) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        link
    })
}

exports.updateLink = async(req, res, next) =>{
    const {body} = req;
    const link = await Link.update(body,
        {
        where: {id : req.params.id}
    })

    if(!link[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        link
    })
}


exports.deleteLink = async(req, res, next) =>{

    // const projects=0;
    const link = await Link.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(link)
    if(!link) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        link
    })
}
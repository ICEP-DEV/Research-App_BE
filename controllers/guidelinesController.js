const Guideline = require("../models/guidelinesModel");
const catchAsync  = require('../utils/catchAsync')
const sequelize = require('../config/db');
const ProjectType = require("../models/projectTypeModel");
const Discipline = require("../models/disciplineModel");
const LinksModel = require("../models/linksModel");
const SubGuides = require("../models/subguidesModel");
const { convertToObject } = require("typescript");


exports.setIDs = (req,res,next)=>{
    req.body.projectTypeId = req.query.projectTypeId

    next();
}
exports.createGuideline = catchAsync(async(req,res,next)=> {


    const guideline =  await Guideline.create(req.body);
    
    res.status(200).json({
        status: "success",
        guideline
    })
})



exports.getAllGuidelines = async(req,res,next)=> {

    console.log(req.body.projectTypeId)
    if(!req.body.projectTypeId) return next(new Error("Body is empty"))

    // const guidelines = await Guideline.findAll({});
// const line = `SELECT * FROM disciplines, project_types, guidelines WHERE disciplines.disciplineId = project_types.disciplineId AND project_types.projectTypeId = 3 AND guidelines.projectTypeId = project_types.projectTypeId;  `
// const line = `SELECT * FROM guidelines , project_types WHERE guidelines.projectTypeId = 1 AND project_types.id = 1; `
   
// const guidelines = await sequelize.query(line , {
//         nest: true,
//         type: sequelize.QueryTypes.SELECT
//       });
    const guidelines = await Guideline.findAll({
        where: {projectTypeId : req.body.projectTypeId},
        include:[
            {
                model: ProjectType,
                // as: 'test',
                where: {id: req.body.projectTypeId},
                attributes: { exclude: ["updatedAt", "createdAt"]},
                include:[{
                    model: Discipline,
                attributes: { exclude: ["updatedAt", "createdAt"]}
                }]

            }
        ]
    })

    res.status(200).json({
        status: "success",
        results: guidelines.length,
        guidelines
    })
}

exports.getGuideline = async(req, res, next) =>{
    
    const guideline = await Guideline.findOne({
        where: {id : req.params.id},
        include:[
            {model:SubGuides},
            {model:LinksModel}
        ]
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
        where: {id : req.params.id}
    })

    if(!guideline[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        guideline
    })
}


exports.deleteGuideline = catchAsync(async(req, res, next) =>{

    // const projects=0;
    const links = await LinksModel.destroy({ where: {guidelineId: req.params.id}});
    const subGuides = await SubGuides.destroy({ where: {guidelineId: req.params.id}})
    const guideline = await Guideline.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(guideline)
    if(!guideline) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        guideline
    })
});


exports.getHtmlDetails = catchAsync(async(req, res, next)=>{
    
    const line = "SELECT CONCAT(CONCAT(`element_types`.`opening_tag`, \" id=\", `user_elements`.`elementId`, \" style=\",`user_elements`.`class`  , \"> \")," + "`user_elements`.`content` , `element_types`.`closing_tag`) AS userHTML , `user_elements`.`class`, CONCAT( \"id-\",`user_elements`.`id`) AS elementId, `user_elements`.`id` " +
    "FROM `user_elements`, `element_types`, `guidelines`" +
    " WHERE `user_elements`.`elementTypeId` = `element_types`.`id` AND `guidelines`.`id` = `user_elements`.`guidelineId` AND `user_elements`.`guidelineId`=" + req.params.id;


    console.log(line);

    const htmlDetails = await sequelize.query(line, {
        nest:false,
        type: sequelize.QueryTypes.SELECT
    });
    

    res.status(200).json({
        status: "success",
        results: htmlDetails.length,
        htmlDetails
    });
});

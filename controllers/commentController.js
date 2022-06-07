const Comment = require("../models/commentModel");
const catchAsync  = require('../utils/catchAsync')
const User = require("../models/userModel");
const Blog = require("../models/blogModel");

exports.createComment = catchAsync(async(req,res,next)=> {

    const comment =  await Comment.create(req.body);
    
    res.status(200).json({
        status: "success",
        comment
    })
})

exports.getAllComments = async(req,res,next)=> {

    const comments = await Comment.findAll({
        include:[
            {
                model: User,
                attributes: { exclude: ["updatedAt", "createdAt", "password"] },
              },
              {
                model: Blog,
                attributes: { exclude: ["updatedAt", "createdAt"] },
              }
        ]
    });

    res.status(200).json({
        status: "success",
        message: "Hello from get all Comment route 😜",
        results: comments.length,
        comments
    })
}

exports.getAllCommentsWhere = async(req,res,next)=> {
    const comments = await Comment.findAll({
        where:{blogId: req.params.blogId},
        include:[
            {
                model: User,
                attributes: { exclude: ["updatedAt", "createdAt", "password"] },
            },
            {
                model: Blog,
                attributes: { exclude: ["updatedAt", "createdAt"] },
            }
        ]
    });

    res.status(200).json({
        status: "success",
        message: "Hello from get all Comment route 😜",
        results: comments.length,
        comments
    })
}

exports.getComment = async(req, res, next) =>{
    
    const comment = await Comment.findOne({
        where: {id : req.params.id}
    })

    if(!comment) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        comment
    })
}

exports.updateComment = async(req, res, next) =>{
    const {body} = req;
    
    const comment = await Comment.update(body,
        {
        where: {id : req.params.id}
    })

    if(!comment[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "Comment updated",
        comment
    })
}


exports.deleteComment = async(req, res, next) =>{

    // const projects=0;
    const comment = await Comment.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(comment)
    if(!comment) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        message: "Comment deleted",
        comment
    })
}
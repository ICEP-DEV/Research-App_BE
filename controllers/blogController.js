const Blog = require("../models/blogModel");
const catchAsync  = require('../utils/catchAsync')

exports.createBlog = catchAsync(async(req,res,next)=> {

    const blog =  await Blog.create(req.body);
    
    res.status(200).json({
        status: "success",
        blog
    })
})

exports.getAllBlogs = async(req,res,next)=> {

    const blogs = await Blog.findAll({});

    res.status(200).json({
        status: "success",
        message: "Hello from get all Blogs route 😜",
        results: blogs.length,
        blogs
    })
}

exports.getBlog = async(req, res, next) =>{
    
    const blog = await Blog.findOne({
        where: {id : req.params.id}
    })

    if(!blog) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        blog
    })
}

exports.updateBlog = async(req, res, next) =>{
    const {body} = req;
    
    const blog = await Blog.update(body,
        {
        where: {id : req.params.id}
    })

    if(!blog[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "Comment updated",
        blog
    })
}


exports.deleteBlog = async(req, res, next) =>{

    // const projects=0;
    const blog = await Blog.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(blog)
    if(!blog) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        message: "Comment deleted",
        blog
    })
}
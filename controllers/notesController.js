
const Note = require("../models/notesModel");
const catchAsync  = require('../utils/catchAsync')

exports.createNote = catchAsync(async(req,res,next)=> {

    const note =  await Note.create(req.body);
    
    res.status(200).json({
        status: "success",
        note
    })
})

exports.getAllNotes = async(req,res,next)=> {

    const notes = await Note.findAll({});

    res.status(200).json({
        status: "success",
        message: "Hello from get all Blogs route 😜",
        results: notes.length,
        notes
    })
}

exports.getNote = async(req, res, next) =>{
    
    const note = await Note.findOne({
        where: {id : req.params.id}
    })

    if(!note) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        note
    })
}

exports.updateNote = async(req, res, next) =>{
    const {body} = req;
    
    const note = await Note.update(body,
        {
        where: {id : req.params.id}
    })

    if(!note[0]) return next(new Error('Document does not exist'));

    res.status(200).json({
        status: "success",
        message: "Comment updated",
        note
    })
}


exports.deleteNote = async(req, res, next) =>{

    // const projects=0;
    const note = await Note.destroy(
        {
        where: {id : req.params.id}
    })

    console.log(note)
    if(!note) return next(new Error('Document does not exist'))
    res.status(200).json({
        status: "success",
        message: "Comment deleted",
        note
    })
}
const catchAsync = require("../utils/catchAsync");
const Events = require('../models/eventsModel');


exports.getEvent = catchAsync(async(req,res,next) =>{

    const events = await Events.findAll({where: {userId: req.user.id}})
    
    if(!events) return next(new Error("Document does not exist"))
    
     res.status(200).json({
         status: "success",
         message: "Welcome to event endpoint😎",
         events
     })
 })

exports.createEvent = catchAsync(async(req,res,next) =>{


    req.body.userId = req.user.id; 


    const events = await Events.create(req.body)

    res.status(200).json({

        status: "success",
        message: "Event request successfully sent",
        events
    })
})

// exports.updateEvent = catchAsync(async(req, res, next) =>{
    
//     const events = await Events.update(req.body, {where : {userId: req.user.id} })
//     if(!events) return next(new Error("Document does not exist"))


//     res.status(200).json({

//         status: "success",
//         message: "Event response successfully sent",
//         events
//     })
// }) 


exports.cancelEvent = catchAsync(async(req,res,next) => {

    const events = await Events.destroy({where: {userId: req.user.id}})
   if(!events) return next(new Error("Document does not exist")) 


    res.status(200).json({

        status: "success",
        message: "Event  successfully cancelled",
        
    })
})
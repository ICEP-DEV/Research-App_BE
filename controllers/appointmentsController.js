const catchAsync = require("../utils/catchAsync");
const Appointment = require('../models/appointmentsModel');

exports.getAppointment = catchAsync(async(req,res,next) =>{

    const appointment = await Appointment.findAll({where: {projectId: req.params.id}})
    
    if(!appointment) return next(new Error("Document does not exist"))
    
     res.status(200).json({
         status: "success",
         message: "Welcome to appointments endpoint😎",
         appointment
     })
 })

exports.createAppointment = catchAsync(async(req,res,next) =>{


    req.body.projectId = req.params.id; 


    const appointment = await Appointment.create(req.body)

    res.status(200).json({

        status: "success",
        message: "Appointment request successfully sent",
        appointment
    })
})

exports.updateAppointment = catchAsync(async(req, res, next) =>{
    
    const appointment = await Appointment.update(req.body, {where : {projectId : req.params.id} })
    if(!appointment) return next(new Error("Document does not exist"))


    res.status(200).json({

        status: "success",
        message: "Appointment response successfully sent",
        appointment
    })
}) 


exports.cancelAppointment = catchAsync(async(req,res,next) => {

    const appointment = await Appointment.destroy({where: {projectId: req.params.id}})
   if(!appointment) return next(new Error("Document does not exist")) 


    res.status(200).json({

        status: "success",
        message: "Appointment  successfully cancelled",
        
    })
})


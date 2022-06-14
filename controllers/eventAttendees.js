const catchAsync = require('../utils/catchAsync');
const EventAttendees = require('../models/eventsModel');

exports.getEventAttendee = catchAsync(async(req,res,next) =>{

    const eventAttendee = await EventAttendees.findAll({where: {event_id: req.params.id}})
    
    if(!eventAttendee) return next(new Error("Document does not exist"))
    
     res.status(200).json({
         status: "success",
         message: "Welcome to event attendees endpoint😎",
         eventAttendee
     })
 })

 exports.createRSVP = catchAsync(async(req,res,next) =>{
    
    req.body.userId = req.user.id
    req.body.event_id = req.params

    const eventAttendee = await EventAttendees.create(req.body)
    
    if(!eventAttendee) return next(new Error("Document does not exist"))
    
     res.status(200).json({
         status: "success",
         message: "RSVP successuflly logged",
         eventAttendee
     })
 })

 exports.updateRSVP = catchAsync(async(req,res,next) =>{

    const eventAttendee = await EventAttendees.update(req.body,{where: {userId: req.user.id} ||{event_id: req.params.id}})
    
    if(!eventAttendee) return next(new Error("Document does not exist"))
    
     res.status(200).json({
         status: "success",
         message: "RSVP successfully updated",
         events
     })
 })
const router = require('express').Router();
const eventAttendeesController = require('../controllers/eventAttendees');
const authContoller = require('../controllers/authController')


router 
  .route("/:id")
  .get(authContoller.checkUser,eventAttendeesController.getEventAttendee)
  .post(authContoller.checkUser,eventAttendeesController.createRSVP)
  .patch(authContoller.checkUser,eventAttendeesController.updateRSVP)


module.exports = router;
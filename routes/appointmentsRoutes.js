const router = require('express').Router();
const authController = require('../controllers/authController')
const appointmentController = require('../controllers/appointmentsController')

// router
// .route("/")
// .get(authController.checkUser);
router
   .route("/:id")
   .get(appointmentController.getAppointment)
   .post(appointmentController.createAppointment)
   .patch(appointmentController.updateAppointment)
   .delete(appointmentController.cancelAppointment);

module.exports = router;
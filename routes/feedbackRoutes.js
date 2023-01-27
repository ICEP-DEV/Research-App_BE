const router = require('express').Router();
const feedbackController = require('../controllers/feedbackController');
const authController = require('../controllers/authController')


router
  .route("/:id")
  .get(authController.checkUser, feedbackController.getFeedback)
  .patch(authController.checkUser, feedbackController.updateFeedback)
  .post(authController.checkUser, feedbackController.sendFeedback);

router
  .route("/studentprojectnotifications/:id")
  .get(authController.checkUser,feedbackController.getAllStudentProjectNotifications);

router
  .route("/CountFeedbacksForAGivenGoal/:id")
  .get(authController.checkUser,feedbackController.CountFeedbacksForAGivenGoal);

router
  .route("/getAllSupervisorProjectNotifications/:id")
  .get(authController.checkUser, feedbackController.getAllSupervisorProjectNotifications);

router
  .route("/supervisorGetAllStudentProjectNotifications/:id/:userId")
  .get(authController.checkUser,feedbackController.supervisorGetAllStudentProjectNotifications);

router
  .route("/getAllAdministrators/:disciplineId")
  .get(authController.checkUser, feedbackController.allAdmins);

module.exports = router;
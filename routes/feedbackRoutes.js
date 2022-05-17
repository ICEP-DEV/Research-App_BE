const router = require('express').Router();
const feedbackController = require('../controllers/feedbackController');
const authController = require('../controllers/authController')


router
  .route("/:id")
  .get(authController.checkUser, feedbackController.getFeedback)
  .post(authController.checkUser, feedbackController.sendFeedback);



module.exports = router;
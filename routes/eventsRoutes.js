const router = require('express').Router();
const authContoller = require('../controllers/authController');
const eventsController = require('../controllers/eventsController');

router
  .route("/")
  .get(authContoller.checkUser,eventsController.getEvent)
  .post(authContoller.checkUser,eventsController.createEvent)
  
  .delete(authContoller.checkUser,eventsController.cancelEvent);

  
module.exports = router;
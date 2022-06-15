const router = require('express').Router();
const goal_filesController = require('../controllers/goal_filesController');
const chatController = require('../controllers/chatController');

router 
   .route("/:id")
   .get(goal_filesController.getGoalFile)
   .post(chatController.uploadDocument, goal_filesController.uploadGoalFile);


module.exports = router;
const router = require('express').Router();
const goalController = require('../controllers/goalController');
const authController = require('../controllers/authController')

router
   .route("/")
   .get(authController.checkUser,goalController.viewAllGoals)   
   .post(authController.checkUser,goalController.createGoal);


router 
   .route("/:id")
   .get(authController.checkUser,goalController.viewGoals)
   .patch(authController.checkUser,goalController.updateGoal)






module.exports = router;
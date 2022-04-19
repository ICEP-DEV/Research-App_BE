const router = require("express").Router();
const chatBoxController = require("../controllers/chatBoxController");
const authController = require('../controllers/authController')


router
   .route("/")
   .get(authController.checkUser, chatBoxController.viewChats)
   .post(authController.checkUser,chatBoxController.supervisorChat)
   


   
   



module.exports = router;

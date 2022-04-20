const router = require("express").Router();
const chatController = require("../controllers/chatController");
const chatGroupController = require("../controllers/chatGroupController");
const authController = require('../controllers/authController')


router
   .route("/")
   .get(authController.checkUser, chatController.viewChats)
   .post(authController.checkUser,chatController.supervisorChat)
   
   router
   .route("/")
   .get(authController.checkUser, chatGroupController.viewChatGroups)
   

   
   



module.exports = router;

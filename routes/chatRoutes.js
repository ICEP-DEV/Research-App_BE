const router = require("express").Router();
const chatController = require("../controllers/chatController");
const chatGroupController = require("../controllers/chatGroupController");
const authController = require('../controllers/authController')


router
   .route("/:id")
   .get(authController.checkUser, chatController.viewChats)
   .post(authController.checkUser,chatController.sendMessage)
   

   



module.exports = router;

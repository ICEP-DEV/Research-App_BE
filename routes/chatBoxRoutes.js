const router = require("express").Router();
const chatBoxController = require("../controllers/chatBoxController");
const authController = require('../controllers/authController')


router
   .route("/")
   .get(authController.checkUser, chatBoxController.viewChats)
   .post(authController.checkUser,chatBoxController.supervisorChat)
   //.get(chatBoxController.generalChat);

router
   .route("/:id")
   



module.exports = router;

const router = require("express").Router();
const chatBoxController = require("../controllers/chatBoxController");
const authController = require('../controllers/authController')


router
   .route("/")
   .get(authController.checkUser, chatBoxController.viewChats)
   
   

router
   .route("/:id")
   .post(chatBoxController.supervisorChat)
   



module.exports = router;

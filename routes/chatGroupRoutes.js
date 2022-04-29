const router = require("express").Router();
const chatGroupController = require("../controllers/chatGroupController");
const authController = require("../controllers/authController");

router
  .route("/")
  .get(authController.checkUser, chatGroupController.viewChatGroups)
  .post(authController.checkUser,chatGroupController.createChatGroup)

  router
  .route("/:id")
  .get(authController.checkUser, chatGroupController.viewChatGroup)
  .delete(authController.checkUser,chatGroupController.deleteChatGroup)
  .patch(authController.checkUser, chatGroupController.updateChatGroup)

module.exports = router;

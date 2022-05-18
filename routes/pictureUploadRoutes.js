const router = require("express").Router();
const userController = require("../controllers/userController")
const authController = require('../controllers/authController')

router.route("/upload").post(authController.checkUser,userController.uploadImage, userController.updateUser);

module.exports = router;
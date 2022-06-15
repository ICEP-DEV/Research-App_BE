//1 REQUIRE PACKAGES
const router = require('express').Router()

//2 REQUIRE CONTROLLERS
const authController = require('../controllers/authController')
const userController = require('../controllers/userController')
const chatController = require('../controllers/chatController')

//3 MIDDLEWARE (if any)
// const checkUser = require('../controllers/authController').checkUser;

//4 ROUTES

router.route('/login').post(authController.login)
router.route('/register').post(authController.signup)
router.route('/forgotPassword').post(authController.forgotPassword)
router.route('/updateProfile').post(authController.checkUser,userController.updateProfile)
router.route('/confirmEmail/:token').get(authController.confirmEmail)
router.route('/resetPassword/:email').get(authController.resetPassword)
router.route('/getAllUsers').get(authController.checkUser,authController.restrict(1), userController.getAllUsers)
router.route('/getUser').get(authController.checkUser, userController.getUser)
router.route('/getAllUsersWhere/:id').get(authController.checkUser, userController.getAllUsersWhere);
router.route("/uploadPicture").post(authController.checkUser,userController.uploadProfileImage,userController.updateUser);




module.exports = router
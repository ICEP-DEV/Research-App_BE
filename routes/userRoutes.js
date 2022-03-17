//1 REQUIRE PACKAGES
const router = require('express').Router()

//2 REQUIRE CONTROLLERS
const authController = require('../controllers/authController')
const userController = require('../controllers/userController')

//3 MIDDLEWARE (if any)
// const checkUser = require('../controllers/authController').checkUser;

//4 ROUTES

router.route('/login').post(authController.login)
router.route('/register').post(authController.signup)
router.route('/forgotPassword').post(authController.forgotPassword)
router.route('/updateProfile').post(authController.checkUser,userController.updateProfile)
router.route('/confirmEmail/:token').get(authController.confirmEmail)
router.route('/resetPassword/:email').get(authController.resetPassword)
//router.route('/getUsers').get(authController.checkUser, authController.testUser)




module.exports = router
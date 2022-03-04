//1 REQUIRE PACKAGES
const router = require('express').Router()

//2 REQUIRE CONTROLLERS
const authController = require('../controllers/authController')

//3 MIDDLEWARE (if any)


//4 ROUTES

router.route('/login').post(authController.login)
router.route('/register').post(authController.signup)
router.route('/forgotPassword').post(authController.forgotPassword)
router.route('/updatePassword').post(authController.updatePassword)


module.exports = router
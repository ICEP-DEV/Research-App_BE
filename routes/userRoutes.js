//1 REQUIRE PACKAGES
const router = require('express').Router()

//2 REQUIRE CONTROLLERS
const authController = require('../controllers/authController')

//3 MIDDLEWARE (if any)


//4 ROUTES

router.route('/login').post(authController.login)


module.exports = router
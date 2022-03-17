const nodemailer = require('nodemailer');
const bcrypt = require('bcryptjs');
const User = require('../models/userModel')
const catchAsync = require('../utils/catchAsync')
const jwt = require("jsonwebtoken")
const messagebird = require('messagebird')
const { getMaxListeners } = require('../app');
const { token } = require('morgan');
const cloudinary = require('../config/cloudinary')



exports.getUsers = catchAsync( async(req, res, next) =>{
    const users = await User.findAll({});
   if(!users){
       return next(new Error('Users not found!'))
   }
   else

    
    return res.send(users);
})

exports.updateProfile = catchAsync(async (req, res, next) => {
    
    const { password, confirmPassword, firstName, lastName } = req.body;
    console.log(req.user.id)
//    // const user = await User.findOne({ where: { id: req.user.id } });
//    console.log(req.body.password)
//     if (password) {

//         if (password !== confirmPassword) {
//             res.send('Passwords do not match')
//         } else {
//             await User.update({ password: password }, { where: { id: req.user.id } })

//         }
//     }

//     if (firstName) {
//         await User.update({ firstName: firstName }, { where: { id: req.user.id } })
//     }

//     if (lastName) {
//         await User.update({ lastName: lastName }, { where: { id: req.user.id } })
//     }

    res.status(200).json({
        status: 'success',
        message: 'Profile successfully updated.'
    })
})

module.exports
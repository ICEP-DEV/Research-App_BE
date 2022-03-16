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
    const user = await User.findOne({ where: { email: req.body.email } });

    if (password || confirmPassword) {

        if (password !== confirmPassword) {
            res.send('Passwords do not match')
        } else {
            await user.update({ password: password }, { where: { email: req.params.email } })

        }
    }

    if (firstName) {
        await user.update({ firstName: firstName }, { where: { email: req.params.email } })
    }

    if (lastName) {
        await user.update({ lastName: lastName }, { where: { email: req.params.email } })
    }

    res.status(200).json({
        status: 'success',
        message: 'Profile successfully updated.'
    })
})

module.exports
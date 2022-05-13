const nodemailer = require('nodemailer');
const bcrypt = require('bcryptjs');
const User = require('../models/userModel')
const catchAsync = require('../utils/catchAsync')
const jwt = require("jsonwebtoken")
const messagebird = require('messagebird')
const { getMaxListeners } = require('../app');
const { token } = require('morgan');
const cloudinary = require('../config/cloudinary')



exports.getAllUsers = catchAsync( async(req, res, next) =>{
    
    const users = await User.findAll({});
   if(!users){
       return next(new Error('Users not found!'))
   }
   else
    return res.send(users);
})

exports.getAllUsersWhere = catchAsync( async(req, res, next)=>
{
    const users = await User.findAll({ where: {references : req.params.id}})
    console.log(req.user);
    if(!users)
    {
        return next(new Error('Document not found'));
    } 
    else
    {
        return res.send(users);
    }
})

exports.getUser = catchAsync( async(req, res, next) =>{

    let options ={ id : req.user.id}

    console.log(req.user)

    if(req.user.userType == 2 || req.user.userType == 3 && req.user.email) options = {email : req.user.email}


    const user = await User.findOne({
        where: options
    })

    if(!user) return next(new Error('Document not found'))

    res.status(200).json({
        status: "success",
        user
    })



})

exports.updateProfile = catchAsync(async (req, res, next) => {
    
//    const { password, confirmPassword, firstName, lastName } = req.body;
    console.log(req.user.id)
   const user = await User.update(req.body,{ where: { id: req.user.id } });

    res.status(200).json({
        status: 'success',
        message: 'Profile successfully updated.'
    })
})

module.exports
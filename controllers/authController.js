const nodemailer = require('nodemailer');
const bcrypt = require('bcryptjs');
const User = require('../models/userModel')
const catchAsync = require('../utils/catchAsync')
const jwt = require("jsonwebtoken")
const messagebird = require('messagebird')
const { getMaxListeners } = require('../app');
const { token } = require('morgan');



const signToken = user => {

    return jwt.sign({ id: user.id, userType: user.userType, email: user.email },
        'Stack',
        { expiresIn: "1d", });

}


exports.confirmEmail = catchAsync(async (req, res, next) => {

    try {

        const userID = jwt.verify(req.params.token, 'Stack');
        const user = await User.findOne({ where: { id: userID.id } })
        await user.update({ verified: true }, { where: { id: userID } })

    } catch (e) {
        res.send('error')
    }
    res.status(200).json({
        status: 'success',
        message: 'Email confirmed!'
    })

})

exports.login = catchAsync(async (req, res, next) => {

    const user = await User.findOne({
        where: { email: req.body.email }
    });

    if (!user) {
        return next(new Error('User does not exist'));
    } else {
        if (!(bcrypt.compare(req.body.password, user.password))) {
            return res.send("Incorrect password");
        } else {

            if (user.verified == false) {
                return res.send('Use the link in your email to verify your account');

            }
        }

    }

    

    res.status(200).json({
        status: 'success',
        message: 'Welcome to login endpoint'
    })
})

exports.signup = catchAsync(async (req, res, next) => {


    //code goes here....

    req.body.password = await bcrypt.hash(req.body.password, 8);
    const user = await User.create(req.body)

    

    const token = signToken(user)


    const transporter = nodemailer.createTransport({
        service: 'Gmail',
        auth: {
            user: 'researcherdna952@gmail.com',
            pass: '@icepdevs2022'
        }
    })


    const mailOptions = {
        from: 'Admin',
        to: user.email,
        subject: 'Confrimation Email',

        html: ` <p>Please click on the link to verify your email to activate your ResearcherDNA account:<br></p><a href= http://localhost:3000/api/v1/users/confirmEmail/${token}>${token}<br><p><b>NB!!: 
             </b>This link will be inactive within the next 24 hours.Failure to verify your email will result into the deactivation of your account. Furthermore, you will have to restart your registration process.</p>`

    };

    transporter.sendMail(mailOptions, (err, info) => {
        if (err) {
            console.log(err);
        }
        else {
            console.log('Email sent: ' + info.response);
        }
    });


    const cookieOptions = res.cookie('jwt', token, {
        expires: new Date( Date.now() + 1 * 24 * 60 * 1000),
        httpOnly: true
    });

    cookieOptions.secure = true;

    res.status(200).json({
        status: 'success',
        message: 'Awaiting email verification',
        user,
        token
    })

    if (user.verified == false && (!jwt.verify(req.params.token, 'Stack'))) {
        user.destroy({ where: { email: user.email } })
    }

})


exports.forgotPassword = catchAsync(async (req, res, next) => {
    
        res.status(200).json({
            status: 'success',
            message: 'Welcome to Forgot Password endpoint'
        })
    

    

})


exports.updatePassword = catchAsync(async (req, res, next) => {
    res.status(200).json({
        status: 'success',
        message: 'Welcome to Upadate Password endpoint'
    })
})



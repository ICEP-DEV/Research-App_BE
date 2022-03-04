const nodemailer = require('nodemailer');
const bcrypt = require('bcryptjs');
const User = require('../models/userModel')
const catchAsync = require('../utils/catchAsync')
const jwt = require("jsonwebtoken")
const messagebird = require('messagebird')
const { getMaxListeners } = require('../app');


  



// function authenticateToken(req,res,next){
//     const authHeader = req.headers["authorization"];
//     const token = authHeader && authHeader.split(' ')[1];

//     if(token == null ) return res.sendStatus()
// }

exports.login = catchAsync(async (req, res, next)=> {

 
    
    
    res.status(200).json({
        status: 'success',
        message: 'Welcome to login endpoint'
    })
})

exports.signup = catchAsync(async(req, res, next)=> {


    //code goes here....
    
    const user = await User.create(req.body)
    let hashedPassword = await bcrypt.hash(user.password, 8);
    await user.update({password: hashedPassword});

    const token = jwt.sign( {userType: user.userType,email:user.email},  
                           'Stack',
                         {expiresIn: "24h",} );  
   

     const transporter = nodemailer.createTransport({
         service: 'Gmail',
          auth: {
                    user: 'researcherdna952@gmail.com',
                    pass: '@icepdevs2022'
                }
      })


   const mailOptions = {
        from : 'researcherdna952@gmail.com',
         to: user.email,
        subject : 'Confrimation Email',
        text: 'Please click on the link to verify your ResearcherDNA account:',
        html: ` <p>Please click on the link to verify your ResearcherDNA account:</p><<br><a href= "http://localhost:3000/api/v1/users/login"${token}>${token}</a><br><p><b>NB!!: 
             </b>This link will be inactive within the next 24 hours.Failure to verify your account will result into the deactivation thereof.`
    
};

transporter.sendMail(mailOptions, (err,info) =>{
    if(err){
        console.log(err);
    }
    else{
        console.log('Email sent: '+ info.response);
    }
});

     res.status(200).json({
        status: 'success',
        message: 'Awaiting email verification',
        user
    })
    
 

 })


exports.forgotPassword = catchAsync(async(req, res, next)=> {

    const forgotPassToken = jwt.sign( {userType: user.userType,email:user.email},  
        'Stack',
      {expiresIn: "24h",} );

  const transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
        user: 'researcherdna952@gmail.com',
        pass: '@icepdevs2022'
    }
})

const mailOptions = {
    from : 'researcherdna952@gmail.com',
    to: User.email,
    subject : 'Password reset',
    text: "Please use the OTP below to reset your password",
    html: `<a href= "<p>Please use the link below to reset your password.<br>
            <b>Link:</b>${ forgotPassToken }`
    
};

transporter.sendMail(mailOptions, (err,info) =>{
    if(err){
        console.log(err);
    }
    else{
        console.log('Email sent: '+ info.response);
    }
});
    res.status(200).json({
        status: 'success',
        message: 'Welcome to Forgot Password endpoint'
    })

})


exports.updatePassword = catchAsync(async(req, res, next)=> {
    res.status(200).json({
        status: 'success',
        message: 'Welcome to Upadate Password endpoint'
    })
})



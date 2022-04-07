const nodemailer = require("nodemailer");
const bcrypt = require("bcryptjs");
const User = require("../models/userModel");
const catchAsync = require("../utils/catchAsync");
const jwt = require("jsonwebtoken");
const messagebird = require("messagebird");
const { getMaxListeners } = require("../app");
const { token } = require("morgan");
const { getUsers } = require("./userController");

const signToken = (user) => {
  const username = user.firstName + " " + user.lastName;

  return jwt.sign(
    {
      name: username,
      id: user.id,
      userType: user.userType,
      email: user.email,
      photo: user.photo,
    },
    "Stack",
    { expiresIn: "1d" }
  );
};

exports.confirmEmail = catchAsync(async (req, res, next) => {
  try {
    const userID = jwt.verify(req.params.token, "Stack");
    const user = await User.findOne({ where: { id: userID.id } });
    await user.update({ verified: true }, { where: { id: userID } });
  } catch (e) {
    res.send("Error!Link has expired.");
  }
  res.status(200).json({
    status: "success",
    message: "Email confirmed!",
  });
});

exports.resetPassword = catchAsync(async (req, res, next) => {
  // const user = User.findOne({ where: { email: req.params.email } });
  // const { password, confirmPassword } = req.body;
  // if (err) {
  //     return next(new Error('Oops!Something went wrong. Please try again'))
  // }
  // else

  //     if (!password || !confirmPassword) {
  //         res.send('Fields cannot be empty!')
  //     } else if (password !== confirmPassword) {
  //         res.send('Passwords do not match')
  //     } else {
  //         user.update({ password: password }, { where: { email: req.params.email } })

  //     }

  res.status(200).json({
    status: "success",
    message: "Password Successfully changed",
  });
});

exports.login = catchAsync(async (req, res, next) => {
  const { email, password } = req.body;

  if (!email || !password)
    return next(new Error("Please provide email and password"));

  if (typeof email === "object")
    return next(new Error("Invalid email address"));

  const user = await User.findOne({ where: { email: req.body.email } });

  // const match  = await bcrypt.compare(password, user.password);

  if (!user || !(await bcrypt.compare(password, user.password)))
    return next(new Error("Incorrect email or password"));

  if (user.verified == false)
    return next(new Error("Please verify your email address"));

  const token = signToken(user);

  const cookieOptions = res.cookie("jwt", token, {
    expires: new Date(Date.now() + 1 * 24 * 60 * 1000),
    httpOnly: true,
  });

  cookieOptions.secure = true;

  res.status(200).json({
    status: "success",
    message: "Successfully logged in",
    token,
    user,
  });
});

exports.restrict = (val) => (req, res, next) => {
  if (req.user.userType == val) {
    const err = new Error("Access Denied!");
    err.status = "fail";
    err.statusCode = 401;
    return next(err);
  }

  next();
};

exports.checkUser = (req, res, next) => {
  //Your code goes here.......

  const token = req.headers.authorization;

  if (!token) return next(new Error("Ooops Please log in"));

  decodedToken = jwt.verify(token.split(" ")[1], "Stack");

  const user = decodedToken;

  req.user = user;

  next();
};

//

exports.signup = catchAsync(async (req, res, next) => {
  //code goes here....

  
 

  const user = await User.create(req.body);

  const token = signToken(user);

  const transporter = nodemailer.createTransport({
    service: "Gmail",
    auth: {
      user: "researcherdna952@gmail.com",
      pass: "@icepdevs2022",
    },
  });

  const mailOptions = {
    from: "Admin",
    to: user.email,
    subject: "Confrimation Email",

    html: ` <p>Please click on the link to verify your email to activate your ResearcherDNA account:<br></p><a href= http://localhost:3000/api/v1/users/confirmEmail/${token}>${token}<br><p><b>NB!!: 
             </b>This link will be inactive within the next 24 hours.Failure to verify your email will result into the deactivation of your account. Furthermore, you will have to restart your registration process.</p>`,
  };

  transporter.sendMail(mailOptions, (err, info) => {
    if (err) {
      console.log(err);
    } else {
      console.log("Email sent: " + info.response);
    }
  });

  res.status(200).json({
    status: "success",
    message: "Awaiting email verification",
  });

  // if (user.verified == false && (!jwt.verify(req.params.token, 'Stack'))) {
  //     await user.destroy({ where: { email: user.email } })
  // }
});

exports.forgotPassword = catchAsync(async (req, res, next) => {
  const user = await User.findOne({ where: { email: req.body.email } });
  const token = signToken(user);

  if (!user) {
    return res.send("User does not exist");
  } else {
    const transporter = nodemailer.createTransport({
      service: "Gmail",
      auth: {
        user: "researcherdna952@gmail.com",
        pass: "@icepdevs2022",
      },
    });

    const mailOptions = {
      from: "Admin",
      to: user.email,
      subject: "Password reset",

      html: ` <p>Please click on the link to reset your ResearcherDNA passsword:<br></p><a href= http://localhost:3000/api/v1/users/resetPassword/${token}>${token}<br><p><b>NB!!: 
                 </b>This link will be inactive within the next 24 hours.</p>`,
    };

    transporter.sendMail(mailOptions, (err, info) => {
      if (err) {
        console.log(err);
      } else {
        console.log("Email sent: " + info.response);
      }
    });

    res.status(200).json({
      status: "success",
      message: "Reset",
      user,
      token,
    });
  }
});

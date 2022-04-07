const nodemailer = require('nodemailer')



exports.sendEmail = (user, token, subject) =>{
    const transporter = nodemailer.createTransport({
        service: "Gmail",
        auth: {
          user: "researcherdna952@gmail.com",
          pass: "@icepdevs2022",
        },
      });

    let html = ` <p>Please click on the link to verify your email to activate your ResearcherDNA account:<br></p><a href= http://localhost:3000/api/v1/users/confirmEmail/${token}>${token}<br><p><b>NB!!: 
    </b>This link will be inactive within the next 24 hours.Failure to verify your email will result into the deactivation of your account. Furthermore, you will have to restart your registration process.</p>`
     
    if(subject == "Password Reset" ){

        html= ` <p>Please click on the link to reset your ResearcherDNA passsword:<br></p><a href= http://localhost:3000/api/v1/users/resetPassword/${token}>${token}<br><p><b>NB!!: 
                 </b>This link will be inactive within the next 24 hours.</p>`
     }

      const mailOptions = {
        from: "Admin",
        to: user.email,
        subject: subject,
    
        html: html
      };
    
      transporter.sendMail(mailOptions, (err, info) => {
        if (err) {
          console.log(err);
        } else {
          console.log("Email sent: " + info.response);
        }
      });
}
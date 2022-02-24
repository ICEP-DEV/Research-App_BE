//1 REQUIRE PACKAGES
const express = require('express');
const morgan = require('morgan');



const app = express();

//2 REQUIRE ROUTES
const userRoutes = require('./routes/userRoutes')
const projectRoutes = require("./routes/projectRoutes");
const e = require('express');


//3 APP.USE MIDDLEWARE

app.use(express.json());

//Testing application
// app.get('/',(req,res)=>{
//     res.status(200).json('hello there')
// })

//APP.USE ROUTES DECLARATION MIDDLEWARE
app.use('/api/v1/users', userRoutes);
app.use('/api/v1/projects', projectRoutes)

const modelErrHandle = err =>{

    const errors = Object.values(err.errors).map(el => el.message);
    const message = `Invalid input data : ${errors.join(', ')}`;
    // console.log(message)
    const e = new Error(message)
    e.statusCode = 400;
    e.status = 'fail'
 
    return e; 
}

// const responseHandler = (e, res) => {
//     const message = err.message
//     res.status(e.statusCode).json({
//         status: e.status,
//         message
//     })


// }
app.use((err, req, res, next) => {

    if (err.errors) err =  modelErrHandle(err);
    err.statusCode = err.statusCode || 500;
    err.status = err.status || 'error';
    err.message = err.message || 'Ooops something went wrong';

    res.status(err.statusCode).json({
        status: err.status,
        message: err.message
    })

})
//4 SERVER
module.exports = app;

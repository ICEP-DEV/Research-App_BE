//1 REQUIRE PACKAGES
const express = require('express');
const morgan = require('morgan');



const app = express();

//2 REQUIRE ROUTES
const userRoutes = require('./routes/userRoutes')


//3 APP.USE MIDDLEWARE

app.use(express.json());

//Testing application
// app.get('/',(req,res)=>{
//     res.status(200).json('hello there')
// })

//APP.USE ROUTES DECLARATION MIDDLEWARE
app.use('/api/v1/users', userRoutes);

//4 SERVER
module.exports = app;

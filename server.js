const app = require('./app')
const dotenv = require('dotenv'); //FOR READING .env file
const {Sequelize} = require('sequelize')
dotenv.config({ path: './.env' }); //FOR GETTING PATH OF .env file
const sequelize = require('./config/db')
const Project = require("./models/projectModel")

// sequelize.sync()
// sequelize.sync({force:false})


// Project.sync({ force: true });
// // You can change the user.js file
// // And run this code to check if it overwrites the existing code.
// try {
//     sequelize.sync({force:false})
// } catch (error) {
//     // sequelize.sync()
//     if(error.errno == 1146)  sequelize.sync({force:true})

//     sequelize.sync({force:false})
// }


const port = process.env.PORT || 3000;
app.listen(port,()=>{
    console.log(`Application running on port ${port}`)
})
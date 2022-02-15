const app = require('./app')
const dotenv = require('dotenv'); //FOR READING .env file
dotenv.config({ path: './.env' }); //FOR GETTING PATH OF .env file

const port = process.env.PORT || 3000;
app.listen(port,()=>{
    console.log(`Application running on port ${port}`)
})
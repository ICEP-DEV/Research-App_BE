const http = require('http')
const app = require('./index')
const conn = require('./connection')





const port = process.env.PORT || 3000;
app.listen(port,()=>{
    console.log(`Application running on port ${port}`)
})
const mysql = require('mysql');
const connection = mysql.createConnection({

    host: "localhost",
    username: "root",
    password: "",
    database: "researcherdna"

})

connection.connect((err) =>{
    if(!err)
    {
        console.log("connected");
    }else{
        console.log(err);
    }
})

module.exports = connection;
const mysql = require('mysql');
const connection = mysql.createConnection({

    host: "localhost",
    user: "root",
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

// const mysql = require('mysql') 

// var conn = mysql.createConnection({
//     host: "localhost",
//     user: "root",
//     password: "",
//     database: "search"
//   });
  
// conn.connect((err) => {
//     if (err){

//       // console.log(err.sqlMessage)
//       throw err;
//       // return 0;
//     } 
//     console.log('Connected to the MySql DB');
//   });


// module.exports =conn;
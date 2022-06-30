const Sequelize = require('sequelize')
// const sequelizeTransforms = require('sequelize-transforms');

// Option 3: Passing parameters separately (other dialects)
const sequelize = new Sequelize(
    'researcherdna',
     'root',
     '', 
     {
  host: 'localhost',
  dialect: 'mysql' /* one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' */
});

// const sequelize = new Sequelize("mysql://b752eb1a931ab8:f1dd06fb@us-cdbr-east-05.cleardb.net/heroku_53594401c782c36?reconnect=true") 

//=--------------------------
    // "username": "b752eb1a931ab8",
    // "password": "f1dd06fb",
    // "database": "heroku_53594401c782c36",
    // "host": "127.0.0.1",
    // "dialect": "mysql"
//==----------------------------------

// (async()=>{
//   try {
//     await sequelize.authenticate();
//     console.log('Connection has been established successfully.');
//   } catch (err) {

//     const code = (typeof err.parent == "object" && err.parent && "errno" in err.parent) ? err.parent.errno: 0;
    
//     if(code == -4078) console.log('Unable to connect to the database: Xampp offline');
    
//   }
  
// })()
// start=async()=>{

// };


// start()

// sequelizeTransforms(sequelize);

module.exports = sequelize;
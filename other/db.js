const Sequelize = require('sequelize')
const sequelizeTransforms = require('sequelize-transforms');
 

// Option 3: Passing parameters separately (other dialects)
// const sequelize = new Sequelize(
//     'kasi_market',
//      'root',
//      '', 
//      {
//   host: 'localhost',
//   dialect: 'mysql' /* one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' */
// });

const sequelize = new Sequelize("mysql://bd45a5e3aba82c:e481c7c24bcffa4@us-cdbr-east-05.cleardb.net/heroku_121f32d29f33894?reconnect=true") 


// (async()=>{
//   try {
//     await sequelize.authenticate();
//     console.log('Connection has been established successfully.');
//   } catch (err) {

//     const code = (typeof err.parent == "object" && err.parent && "errno" in err.parent) ? err.parent.errno: 0;
    
//     if(code == -4078) console.log('Unable to connect to the database: Xampp offline');
    
//   }
  
// })()
 start=async()=>{
  // try {
  //   await sequelize.authenticate();
  //   console.log('Connection has been established successfully.');
  // } catch (err) {

  //   const code = (typeof err.parent == "object" && err.parent && "errno" in err.parent) ? err.parent.errno: 0;
    
  //   if(code == -4078) console.log('Unable to connect to the database: Xampp offline');
    
  // }
  
};

start()

sequelizeTransforms(sequelize);

module.exports = sequelize;
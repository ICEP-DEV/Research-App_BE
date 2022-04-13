const Sequelize = require('sequelize')

// Option 3: Passing parameters separately (other dialects)
const sequelize = new Sequelize(
    'researcherdnav1',
     'root',
     '', 
     {
  host: 'localhost',
  dialect: 'mysql' /* one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' */
});


(async()=>{
  try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
  } catch (err) {

    const code = (typeof err.parent == "object" && err.parent && "errno" in err.parent) ? err.parent.errno: 0;
    
    if(code == -4078) console.log('Unable to connect to the database: Xampp offline');
    
  }
  
})()


module.exports = sequelize;
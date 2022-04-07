const Sequelize = require('sequelize')
const sequelize = require('../config/db')

const ProjectStatus = sequelize.define('project_status',{
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    status: {
        type: Sequelize.STRING,
        allowNull: false,

    },

    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
})

// const hello = async()=>{
//     const logIt = await ProjectStatus.findAll({});

//     console.log(logIt)
// }

// hello()
ProjectStatus.beforeCreate(async (projectStatus, options) => {
  
    console.log("im in the hook")
  });

module.exports = ProjectStatus;
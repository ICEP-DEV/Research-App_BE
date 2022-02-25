const { DATE } = require('sequelize')
const Sequelize = require('sequelize')
const sequelize =  require("../config/db") 


const Project = sequelize.define('project',{
    projectId: {
        type: Sequelize.INTEGER,
        unique: true,
        autoIncrement: true
    },
    name: {
        type: Sequelize.UUID,//string
        primaryKey: true,
        allowNull: false,
        len:{ args: [6,20], msg: "String length is not in range 6-20"},
    },
    description: {
        type: Sequelize.STRING,
        allowNull: false,
        len:{ args: [6,2000], msg: "String length is not in range 6-20"},
    },
    statusId: {
        type: Sequelize.INTEGER
    },
    text: {
        type: Sequelize.STRING

    },
    startDate: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.NOW
    },
    keyword: {
        type: Sequelize.STRING
    },
    endDate: {
        type: Sequelize.DATE
    },
    projectTypeId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    userId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    supervisorId: {
        type: Sequelize.INTEGER
    },
    references: {
        type: Sequelize.INTEGER
    },


    
 // Column: Timestamps
 createdAt: Sequelize.DATE,
 updatedAt: Sequelize.DATE,
})



module.exports = Project;

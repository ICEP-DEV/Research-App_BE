const Sequelize = require('sequelize');
const { __esModule } = require('south-african-id-validator');
const sequelize = require('../config/db');
const Project = require('./projectModel');

const Appointment = sequelize.define('appointment',{

    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    }, 
    
    title: {
        type: Sequelize.STRING,
        allowNull: false
    }, 

    

    endAt:{
        type :Sequelize.DATE,
        
    },
    
    details: {
        type: Sequelize.STRING,
        allowNull: false
    }, 
    
    approved: {
        type: Sequelize.INTEGER,
        
    }, 
    
    type:{

        type: Sequelize.INTEGER,
        allowNull: false
    }, 
    
    
    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE



})

Project.hasMany(Appointment , {nDelete:"RESTRICT",foreignKey:"projectId"})
Appointment.belongsTo(Project)

// const hello = async()=>{
//     const logIt = await Appointment.findAll({
        
        
//     });

//     console.log(logIt)
// }

//hello()
module.exports = Appointment;
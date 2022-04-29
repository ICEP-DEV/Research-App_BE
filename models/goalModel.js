const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const User = require('./userModel');
const ProjectStatus = require('./projectStatusModel')
const Project = require('./projectModel');

const Goal = sequelize.define('goal',{
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    title:{
        type: Sequelize.STRING,
        allowNull: false
    },
    outcome:{
        type: Sequelize.TEXT,
        allowNull: false       

    },
    dueDate: Sequelize.DATE,
    acceptanceCriteria:{
        type: Sequelize.TEXT,
        allowNull: false       

    },



    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
})


User.hasMany(Goal, {onDelete:"RESTRICT",foreignKey:"userId"})
Goal.belongsTo(User)

ProjectStatus.hasMany(Goal, {onDelete:"RESTRICT",foreignKey:"projectStatusId"})
Goal.belongsTo(ProjectStatus)


Project.hasMany(Goal, {onDelete:"RESTRICT",foreignKey:"projectId"})
Goal.belongsTo(Project)

// const hello = async()=>{
//         const logIt = await Goal.findAll({
//             include: [
//                 {
//                   model: User,
//                   attributes: { exclude: ["updatedAt", "createdAt", "password"] },
//                 },
//                 {
//                   model: ProjectStatus,
//                   attributes: { exclude: ["updatedAt", "createdAt"] },
//                 },
//                 {
//                   model: Project,
//                   attributes: { exclude: ["updatedAt", "createdAt"] },
//                 },
//               ]
            
//         });
    
//         console.log(logIt)
//     }
    
//     hello()

module.exports = Goal;
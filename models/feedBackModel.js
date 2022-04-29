const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const User = require('./userModel');
const ProjectStatus = require('./projectStatusModel')
const Goal = require('./goalModel')

const Feedback = sequelize.define('feedback',{
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    title:{
        type: Sequelize.STRING,
        allowNull: false
    },
    text:{
        type: Sequelize.TEXT,
        allowNull: false       

    },


    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
})


User.hasMany(Feedback, {onDelete:"RESTRICT",foreignKey:"userId"})
Feedback.belongsTo(User)

ProjectStatus.hasMany(Feedback, {onDelete:"RESTRICT",foreignKey:"projectStatusId"})
Feedback.belongsTo(ProjectStatus)


Goal.hasMany(Feedback, {onDelete:"RESTRICT",foreignKey:"goalId"})
Feedback.belongsTo(Goal)

// const hello = async()=>{
//     const logIt = await Feedback.findAll({
//         include: [
//             {
//               model: User,
//               attributes: { exclude: ["updatedAt", "createdAt", "password"] },
//             },
//             {
//               model: ProjectStatus,
//               attributes: { exclude: ["updatedAt", "createdAt"] },
//             },
//             {
//               model: Goal,
//               attributes: { exclude: ["updatedAt", "createdAt"] },
//             },
//           ]
        
//     });

//     console.log(logIt)
// }

// hello()

module.exports = Feedback;
const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const User = require('./userModel');
const ProjectStatus = require('./projectStatusModel')
const Goal = require('./goalModel')

const ActionItem = sequelize.define('action_item',{
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
    dueDate: Sequelize.DATE,



    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
})


User.hasMany(ActionItem, {onDelete:"RESTRICT",foreignKey:"userId"})
ActionItem.belongsTo(User)

ProjectStatus.hasMany(ActionItem, {onDelete:"RESTRICT",foreignKey:"projectStatusId"})
ActionItem.belongsTo(ProjectStatus)


Goal.hasMany(ActionItem, {onDelete:"RESTRICT",foreignKey:"goalId"})
ActionItem.belongsTo(Goal)


module.exports = ActionItem;
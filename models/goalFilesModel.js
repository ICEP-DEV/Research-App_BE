const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const Goal = require('./goalModel')


const GoalFiles = sequelize.define('goal_files',{

    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    file_name:{
        type: Sequelize.STRING,
        allowNull: false
    },

    description:{
        type: Sequelize.TEXT,
        allowNull: false
    },

    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
})

Goal.hasMany(GoalFiles, {onDelete: "RESTRICT",foreignKey:"goalId"})
GoalFiles.belongsTo(Goal)

module.exports = GoalFiles;

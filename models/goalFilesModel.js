const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const Goal = require('./goalModel')


const GoalFIles = sequelize.define('goalFiles',{

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
        type: Sequelize.STRING,
        allowNull: false
    },

    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
})

Goal.hasMany(GoalFIles, {onDelete: "RESTRICT",foreignKey:"goalId"})
GoalFIles.belongsTo(Goal)

module.exports = GoalFIles;

const Sequelize = require('sequelize');
const sequelize = require("../config/db");
const Discipline  = require('./disciplineModel')

const ProjectType = sequelize.define('project_type', {
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false,
        vic: true
    },
    description: {
        type: Sequelize.STRING,
        allowNull: true
    },

    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE,
})

Discipline.hasOne(ProjectType, {onDelete: 'RESTRICT',foreignKey: 'disciplineId'})
ProjectType.belongsTo(Discipline)

ProjectType.beforeCreate(async (projectStatus, options) => {
  
    console.log("im in the hook", options)
  });

module.exports = ProjectType;


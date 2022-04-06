const Sequelize = require('sequelize');
const sequelize = require("../config/db");
const Discipline  = require('./disciplineModel')
const Guideline = require('./guidelinesModel')

const Subguide = sequelize.define('subguide', {
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    text: {
        type: Sequelize.STRING,
        allowNull: false

    },
   

    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE,
})

Guideline.hasOne(Subguide, {onDelete: 'RESTRICT',foreignKey: 'guidelineId'})
Subguide.belongsTo(Guideline)



module.exports = Subguide;

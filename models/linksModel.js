const Sequelize = require('sequelize');
const sequelize = require('../config/db')
const Guidelines = require('./guidelinesModel')


const Link = sequelize.define('link',{
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name:{
        type: Sequelize.STRING,
        allowNull: false,

    },
    link:{
        type: Sequelize.STRING,
        allowNull: false,
    },


    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE

})

Guidelines.hasMany(Link, {onDelete: 'RESTRICT',foreignKey:'guidelineId'})
Link.belongsTo(Guidelines)

module.exports = Link;
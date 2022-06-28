const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const ElementType = sequelize.define('element_types', {
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name:{
        type: Sequelize.STRING,
        allowNull: false
    },
    opening_tag:{
        type: Sequelize.STRING,
        allowNull: false
    },
    closing_tag:{
        type: Sequelize.STRING,
        allowNull: false
    },
    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
},{indexes: [{primaryKey: true, name: 'elementTypeId', fields: ['id']}]});


module.exports = ElementType;
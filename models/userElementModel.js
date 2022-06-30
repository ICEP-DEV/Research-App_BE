
const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const ElementType = require('./elementTypeModel');
const Guideline = require('./guidelinesModel');

const UserElement = sequelize.define('user_elements', {
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name:{
        type: Sequelize.STRING,
        allowNull: false
    },
    content:{
        type: Sequelize.TEXT,
    },
    elementId:{
        type: Sequelize.STRING
    },
    guidelineId:{
        type: Sequelize.INTEGER,
        allowNull: false
    },
    elementTypeId:{
        type: Sequelize.INTEGER,
        allowNull: false
    },
    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE,
});

Guideline.hasMany(UserElement, {onDelete: "RESTRICT", foreignKey: "guidelineId"});
UserElement.belongsTo(Guideline);
ElementType.hasMany(UserElement, {onDelete: "RESTRICT", foreignKey: "elementTypeId"});
UserElement.belongsTo(ElementType);

module.exports = UserElement;
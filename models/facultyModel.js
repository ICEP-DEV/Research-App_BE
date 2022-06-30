
const Sequelize = require('sequelize')
const sequelize = require('../config/db')

const Faculty = sequelize.define('faculty', {
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name:{
        type: Sequelize.STRING,
        allowNull: false,
        description: {
            type: Sequelize.STRING
        }
    },
    description: {
        type: Sequelize.TEXT
    },


    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE,


},{indexes: [{primaryKey: true, name: 'facultyId', fields: ['id']}]})

module.exports = Faculty;
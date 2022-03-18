
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
        type: Sequelize.STRING
    },


    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE,


},{indexes: [{primaryKey: true, name: 'facultyId', fields: ['id']}]})
//{indexes: [{unique: true, name: 'projectId', fields: ['projectId']}]})

module.exports = Faculty;











// CREATE TABLE `faculties`
// (
//     `facultyId` INT(3) PRIMARY KEY  AUTO_INCREMENT,
//     `name` VARCHAR(50) NOT NULL,
//     `description` VARCHAR(255)
// );
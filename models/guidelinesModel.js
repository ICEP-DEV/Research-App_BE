const Sequelize = require('sequelize')
const sequelize = require('../config/db')


const Guidelines = sequelize.define('guideline',{
    guidelineId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    projectTypeId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    text: {
        type: Sequelize.STRING,
        allowNull: false
    }

})


// CREATE TABLE `guidelines`
// (
//     `guidelineId` INT(10) PRIMARY KEY AUTO_INCREMENT,
//     `projectTypeId` INT(10) NOT NULL,
//     `text` TEXT NOT NULL,
//     FOREIGN KEY (`projectTypeId`) REFERENCES project_types(`projectTypeId`)
// );
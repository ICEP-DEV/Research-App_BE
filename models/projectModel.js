const { DATE } = require('sequelize')
const Sequelize = require('sequelize')
const sequelize =  require("../config/db") 


const Project = sequelize.define('project',{
    name: {
        type: Sequelize.STRING,
        allowNull: false,
        len:{ args: [6,20], msg: "String length is not in range 6-20"},
    },
    description: {
        type: Sequelize.STRING,
        allowNull: false,
        len:{ args: [6,2000], msg: "String length is not in range 6-20"},
    },
    statusId: {
        type: Sequelize.INTEGER
    },
    text: {
        type: Sequelize.STRING

    },
    startDate: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.NOW
    },
    keyword: {
        type: Sequelize.STRING
    },
    endDate: {
        type: Sequelize.DATE
    },
    projectTypeId: {
        type: Sequelize.INTEGER
    },
    userId: {
        type: Sequelize.INTEGER
    },
    supervisorId: {
        type: Sequelize.INTEGER
    },

    
   // don't add the timestamp attributes (updatedAt, createdAt)
//    timestamps: false,

   // If don't want createdAt
//    createdAt: false,
 
   // If don't want updatedAt
//    updatedAt: false,
 
   // your other configuration here
})

Project.queryInterface.addConstraint


module.exports = Project;
// CREATE TABLE `project`
// (
//     `projectId` INT(10) NOT NULL AUTO_INCREMENT,
//     `startDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
//     `endDate` DATE,
//     `description` VARCHAR(500), 
//     `keyword` VARCHAR(100),
//     `name` VARCHAR(100),
//     `text` LONGTEXT,
//     `statusId` INT(2) NOT NULL DEFAULT 1, -- FK
//     `projectTypeId` INT(2) NOT NULL, -- FK
//     `userId` INT(10) NOT NULL, -- FK
//     `supervisorId` INT(10) NOT NULL,
//     FOREIGN KEY (`supervisorId`) REFERENCES `user`(`userId`),
//     PRIMARY KEY (`projectId`, `name`),
//     FOREIGN KEY (`userId`) REFERENCES `user`(`userId`),
//     FOREIGN KEY (`statusId`) REFERENCES project_status(`statusId`),
//     FOREIGN KEY (`projectTypeId`) REFERENCES project_type(`projectTypeId`)
// );

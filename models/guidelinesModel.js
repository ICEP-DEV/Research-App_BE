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
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false,
        len:{ args: [6,20], msg: "Name length is not in range 6-20"}
    },
    g_order: {
        type: Sequelize.INTEGER,
        allowNull: false,
    }

})



module.exports = Guidelines;


// CREATE TABLE `guidelines` (
//     `guidelineId` int(10) NOT NULL,
//     `projectTypeId` int(10) NOT NULL,
//     `name` varchar(255) NOT NULL,
//     `g_order` int(10) NOT NULL,
//     `text` text NOT NULL
//   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  
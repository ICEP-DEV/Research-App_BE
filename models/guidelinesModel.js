const Sequelize = require('sequelize')
const sequelize = require('../config/db');
const ProjectType = require('./projectTypeModel');


const Guidelines = sequelize.define('guideline',{
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    text: {
        type: Sequelize.TEXT,
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
    },
    // points:{
    //     type: Sequelize.STRING,
    //     allowNull: true

    // },

    createdAt: {type:Sequelize.DATE, defaultValue: Sequelize.NOW},
    updatedAt: Sequelize.DATE,

})


// User.hasOne(Product);
// Product.belongsTo(User);
ProjectType.hasOne(Guidelines, {onDelete:"RESTRICT",foreignKey:'projectTypeId'});
Guidelines.belongsTo(ProjectType);

// sequelize.sync({alter:true})
module.exports = Guidelines;


// CREATE TABLE `guidelines` (
//     `guidelineId` int(10) NOT NULL,
//     `projectTypeId` int(10) NOT NULL,
//     `name` varchar(255) NOT NULL,
//     `g_order` int(10) NOT NULL,
//     `text` text NOT NULL
//   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  
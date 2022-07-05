const Sequelize = require('sequelize')
const sequelize = require('../config/db')
const Faculty = require('./facultyModel')


const Discipline = sequelize.define('discipline', {
    id: { 
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true

    },
    name: {
        type: Sequelize.STRING,
        allowNull: false

    },
 


     // Column: Timestamp
 createdAt: Sequelize.DATE,
 updatedAt: Sequelize.DATE,
})
//, {indexes: [{index: true, name: 'facultyId', fields: ['facultyId']}]}

Faculty.hasOne(Discipline, {onDelete: 'RESTRICT',foreignKey: 'facultyId'});
Discipline.belongsTo(Faculty)

// , {onDelete: 'RESTRICT',foreignKey: 'facultyId'}
// Discipline.sync({ alter: true });

module.exports = Discipline;



















// CREATE TABLE `disciplines` (
//     `desciplineId` int(5) NOT NULL,
//     `name` varchar(50) NOT NULL,
//     `facultyId` int(3) NOT NULL
//   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
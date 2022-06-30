const { DATE } = require('sequelize')
const Sequelize = require('sequelize')
const sequelize =  require("../config/db") 
const User = require('./userModel')
const ProjectStatus = require('./projectStatusModel')
const ProjectType = require('./projectTypeModel')


const Project = sequelize.define('project',{
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: Sequelize.STRING,//string
        primaryKey: true,
        allowNull: false,
        len:{ args: [6,20], msg: "String length is not in range 6-20"},
    },
    description: {
        type: Sequelize.TEXT,
        allowNull: false,
        len:{ args: [6,2000], msg: "String length is not in range 6-20"},
    },
    text: {
        type: Sequelize.TEXT

    },
    startDate: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.NOW
    },
    keyword: {
        type: Sequelize.STRING
    },
    // projectStatusId: Sequelize.INTEGER,
    endDate: {
        type: Sequelize.DATE
    },
    userId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false
    },
    supervisorId: {
        type: Sequelize.INTEGER,
        validate: {
            checkSupervisor(){
                if(this.userId == this.supervisorId) throw new Error(`Option prohibited: User can't supervise own work`)
            }
        }
    },
    references: {
        type: Sequelize.INTEGER
    },


    
 // Column: Timestamp
 createdAt: Sequelize.DATE,
 updatedAt: Sequelize.DATE,
}, {indexes: [{unique: true, name: 'projectId', fields: ['id']}]})

//FOREIGN KEY DECLARATIONS
User.hasOne(Project, {onDelete: 'RESTRICT',foreignKey: 'userId'});
Project.belongsTo(User);

ProjectStatus.hasOne(Project, {onDelete: 'RESTRICT',foreignKey: 'projectStatusId'});
Project.belongsTo(ProjectStatus);

ProjectType.hasOne(Project, {onDelete: 'RESTRICT',foreignKey: 'projectTypeId'});
Project.belongsTo(ProjectType);


module.exports = Project;

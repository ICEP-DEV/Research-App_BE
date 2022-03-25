const Sequelize = require('sequelize');
const sequelize = require('../config/db')
const Guidelines = require('./guidelinesModel')
const Project = require('./projectModel')
const User = require('./userModel')


const Note = sequelize.define('note',{
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    text:{
        type: Sequelize.STRING,
        allowNull: false,

    },
    title:{
        type: Sequelize.STRING,
        allowNull: false,
    },
    wordCount: {
        type: Sequelize.INTEGER,
        allowNull: true
    },
    // projectName:{
    //     type: Sequelize.STRING,
    // },


    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE

})

Guidelines.hasOne(Note, {onDelete: 'RESTRICT',foreignKey:'guidelineId'})
Note.belongsTo(Guidelines)

Project.hasOne(Note, {onDelete: 'RESTRICT',foreignKey:'projectId'})
Note.belongsTo(Project)

User.hasOne(Note, {onDelete: 'RESTRICT',foreignKey:'collaboratorId'})
Note.belongsTo(User)

User.hasOne(Note,{onDelete: 'RESTRICT',foreignKey:'userId'})
Note.belongsTo(User)

// Note.sync({alter: true})

const hello = async()=>{
    const logIt = await Note.findAll({});

    console.log(logIt)
}

hello()

module.exports = Note;
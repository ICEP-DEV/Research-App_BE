const { builtinModules } = require('module');
const Sequelize = require('sequelize')
const sequelize = require('../config/db')
const Event = require('./eventsModel')
const User = require('./userModel')


const EventAttendees = sequelize.define('eventAttendees',{

    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        
    },

    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
    
});

Event.hasMany(EventAttendees,{onDelete: "RESTRICT", foreignKey:'event_id'})
EventAttendees.belongsTo(Event)

User.hasOne(EventAttendees,{onDelete: "RESTRICT", foreignKey:'user_id'})
EventAttendees.belongsTo(User)


 module.exports = EventAttendees;
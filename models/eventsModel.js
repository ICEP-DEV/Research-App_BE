const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const User = require('./userModel');

const Events = sequelize.define('events',{

    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    
    event_name:{
       type: Sequelize.STRING,
       allowNull: false
    }, 
    
    description: {
        type: Sequelize.TEXT,
       allowNull: false
    }, 
    
    createdAt : Sequelize.DATE,
     updatedAt : Sequelize.DATE
});

User.hasMany(Events,{onDelete: "RESTRICT", foreignKey:"userId"})
Events.belongsTo(User)


module.exports = Events; 

const Sequelize = require('sequelize')
const sequelize = require('../config/db');


const ChatGroup = sequelize.define('chatGroup', {
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true 
  },
})
    

module.exports = ChatGroup;
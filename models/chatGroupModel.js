const Sequelize = require('sequelize')
const sequelize = require('../config/db');
const Discipline = require('./disciplineModel');
const User = require('./userModel');


const ChatGroup = sequelize.define('chatGroup', {
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true 
  },
  title: {
    type: Sequelize.STRING
  },
  privileges:{
    type: Sequelize.INTEGER
  },
  createdAt: Sequelize.DATE,
  updatedAt: Sequelize.DATE,
})
    

Discipline.hasOne(ChatGroup, {onDelete: 'RESTRICT',foreignKey:'disciplineId'})
ChatGroup.belongsTo(Discipline)

User.hasOne(ChatGroup, {onDelete: 'RESTRICT',foreignKey:'userId'})
ChatGroup.belongsTo(User)


module.exports = ChatGroup;
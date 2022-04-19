const Sequelize = require('sequelize')
const sequelize = require('../config/db');
const User = require('./userModel');
const ChatGroup = require('./chatGroupModel')

const Chat = sequelize.define('chat',{
    id:{
          type: Sequelize.INTEGER,
          primaryKey: true,
          autoIncrement: true 
    },
    // senderId:{
    //     type: Sequelize.INTEGER,
    //     allowNull : false,
    // },
    // dateCreated:{
    //     type: Sequelize.DATE,
    //    default: Sequelize.NOW,
    //    allowNull: false
    // },
    // chatGroupId:{
    //     type: Sequelize.INTEGER,
    //     allowNull: false
    // },
    text:{
         type: Sequelize.TEXT,
         allowNull: false   
    },


    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
})

// Chat.sync({ alter: true });

User.hasOne(Chat, {onDelete: 'CASCADE',foreignKey: 'userId'})
Chat.belongsTo(User)

ChatGroup.hasOne(Chat, {onDelete: 'CASCADE',foreignKey: 'chatGroupId'})
Chat.belongsTo(ChatGroup)



// const hello = async()=>{
//     const logIt = await Chat.findAll({});

//     console.log(logIt)
// }

// hello()

module.exports = Chat;
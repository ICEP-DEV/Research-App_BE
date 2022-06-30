const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const User = require('./userModel');
const Blog = require('./blogModel');

const Comment = sequelize.define('comment',{
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    comment:{
        type: Sequelize.TEXT,
        allowNull: false       

    },



    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
})

User.hasOne(Comment,{onDelete:"RESTRICT",foreignKey:"userId"})
Comment.belongsTo(User)

Blog.hasOne(Comment,{onDelete:"RESTRICT",foreignKey:"blogId"})
Comment.belongsTo(Blog)

// const hello = async()=>{
//     const logIt = await Comment.findAll({
        
//     });

//     console.log(logIt)
// }

// hello()



module.exports = Comment;
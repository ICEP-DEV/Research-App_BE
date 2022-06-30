const Sequelize = require('sequelize');
const sequelize = require('../config/db');
const User = require('./userModel');

const Blog = sequelize.define('blog',{
    id:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    title:{
        type: Sequelize.STRING,
        allowNull: false
    },
    post:{
        type: Sequelize.TEXT,
        allowNull: false       

    },



    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
})


User.hasMany(Blog, {onDelete:"RESTRICT",foreignKey:"userId"})
Blog.belongsTo(User)






module.exports = Blog;
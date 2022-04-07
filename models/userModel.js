const Sequelize = require('sequelize')
const bcrypt = require('bcryptjs')
const idvalidater = require('south-african-id-validator')
const sequelize =  require("../config/db") 


const User = sequelize.define('user',{
    id:{ //changed from id to userId
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },

    firstName:{
        type: Sequelize.STRING,
        allowNull: false,
    },

    lastName:{
        type: Sequelize.STRING,
        allowNull: false,
    },

    email: {
        type: Sequelize.STRING , 
        allowNull: false,
        validate:{
            isEmail : true
        },
    },

    password:{
       type: Sequelize.STRING,
       allowNull: false
    },

    idNumber:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        
        validate: {
            len: {args: [13,13], msg: 'Incorrect ID number length'},
            isCorrectId(value) {
                const idResult = idvalidater.validateIdNumber(value)
                
                if(!idResult.valid) throw  new Error('Invalid ID number!');
               
                this.title = idResult.gender =='male'? 'Mr' : 'Miss';
                
              }
        }
 
     },

     title:{
        type: Sequelize.STRING,
        allowNull: true,
        
 
     },

     photo:{
         type: Sequelize.STRING,
         defaultValue: "default.png",
     },

     userType:{
        type: Sequelize.STRING,
        defaultValue: 1,
        allowNull: false,
        
 
     },
     verified:{
         type: Sequelize.BOOLEAN,
         defaultValue: false

     },

     references:{
        type: Sequelize.INTEGER,
        len:{ args: [1,10], msg: "Password length is not in range 8-16"},
 
     },

     createdAt: Sequelize.DATE,
     updatedAt: Sequelize.DATE,

})

User.beforeCreate(async (user, options) => {
  
    user.password = await bcrypt.hash(user.password, 12);
    // console.log("im in the beforeCreate hook User", options, user)
  });



module.exports = User;


// CREATE TABLE `users`
// (
//     `id` INT(10) NOT NULL AUTO_INCREMENT,
//     `firstName` VARCHAR(50) NOT NULL,
//     `lastName` VARCHAR(50) NOT NULL,
//     `email` VARCHAR(250) UNIQUE NOT NULL,
//     `password` VARCHAR(16) NOT NULL,
//     `idNumber` CHAR(13) NOT NULL,
//     `title` VARCHAR(10),
//     `photo` VARCHAR(255) NOT NULL DEFAULT "Get the API",
//     `userType`  VARCHAR(15) NOT NULL,
//     `references` INT(10),
//     PRIMARY KEY(`id`, `idNumber`),
//     UNIQUE (`idNumber`, `userType`),
//     FOREIGN KEY (`references`) REFERENCES users(`id`)
    
// );
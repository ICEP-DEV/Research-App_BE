const Sequelize = require('sequelize')
const sequelize =  require("../config/db") 


const User = sequelize.define('user',{
    id:{
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
       allowNull: false,
       validate: {
        validatePassword: function(password) {

                      if(!(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/.test(password))) {
                          throw new Error('The password must contain at least 8 and maximum 16 characters including at least 1 uppercase, 1 lowercase, one number and one special character.');
                      }

                  }
              },
    },

    idNumber:{
        type: Sequelize.INTEGER,
        primaryKey: true,
        allowNull: false,
        len:{ args: [13,13], msg: "ID number is invalid"},
 
     },

     title:{
        type: Sequelize.STRING,
        allowNull: true,
        
 
     },

    //  photo:{
    //      type: Sequelize.BLOB
    //  },

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
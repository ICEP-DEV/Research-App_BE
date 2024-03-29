DROP DATABASE researcherdna;

CREATE DATABASE researcherdna;

USE researcherdna;

CREATE TABLE `faculty`
(
    `facultyId` INT(3) PRIMARY KEY  AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(255)
);

INSERT INTO `faculty` (`name`) VALUES ('natural science');
INSERT INTO `faculty` (`name`) VALUES ('mathematics and computer science');
INSERT INTO `faculty` (`name`) VALUES ('social sciences');
INSERT INTO `faculty` (`name`) VALUES ('humanities and arts');
INSERT INTO `faculty` (`name`) VALUES ('applied science');


CREATE TABLE `discipline`
(
    `disciplineId` INT(5) PRIMARY KEY AUTO_INCREMENT,
    `name`  VARCHAR(50) NOT NULL,
    `facultyId` INT(3) NOT NULL,
    FOREIGN KEY (`facultyId`) REFERENCES faculty(`facultyId`)
);
-- 1 Natural sciences
INSERT INTO `discipline` (`name`, `facultyId`) VALUES ('Astronomy',1);
INSERT INTO `discipline` (`name`, `facultyId`) VALUES ('Biology',1);
INSERT INTO `discipline` (`name`, `facultyId`) VALUES ('Chemistry',1);
INSERT INTO `discipline` (`name`, `facultyId`) VALUES ('Physics',1);
INSERT INTO `discipline` (`name`, `facultyId`) VALUES ('Planetary science',1);

-- 2 Mathematics and Computer science
INSERT INTO `discipline`  (`name`, `facultyId`)  VALUES ('Mathematics', 2);
INSERT INTO `discipline`  (`name`, `facultyId`)  VALUES ('Computer science', 2);



-- CREATE TABLE `userType`
-- (
--     `userTypeId` INT(2) PRIMARY KEY AUTO_INCREMENT,
--     `name` VARCHAR(50) NOT NULL
-- );

-- INSERT INTO `userType` (`name`) VALUES ('student');
-- INSERT INTO `userType` (`name`) VALUES ('supervisor');
-- INSERT INTO `userType` (`name`) VALUES ('admin');



CREATE TABLE `user`
(
    `userId` INT(10) NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `email` VARCHAR(250) UNIQUE NOT NULL,
    `password` VARCHAR(16) NOT NULL,
    `idNumber` CHAR(13) NOT NULL,
    `title` VARCHAR(10),
    `photo` VARCHAR(255) NOT NULL DEFAULT "Get the API",
    `userType`  VARCHAR(15) NOT NULL,
    `references` INT(10),
    PRIMARY KEY(`userId`, `idNumber`),
    UNIQUE (`idNumber`, `userType`),
    FOREIGN KEY (`references`) REFERENCES user(`userId`)
    
);

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `studNumber`, `title`, `photo`, `userType`, `references`, `disciplineId`, `verified`, `createdAt`, `updatedAt`) VALUES
(1, 'Shiko', 'Matlala', 'tsholofeloitumeleng@gmail.com', 'shikomatlala@', '9511275417087', 'Mr', 'Get the API', '2', 3, NULL, 0, '2022-03-17 09:34:15', '2022-03-17 09:34:15'),
1, 'Vanesasa', 'Maluleka', 'musa67@gmail.com', 'Vanessa98@', '9801140707086', 'Ms', 'Get the API', '2', 3, NULL, 0, '2022-03-17 09:34:15', '2022-03-17 09:34:15');

--INSERT INTO 'user' (`userId`, `firstName`, `lastName`,  `email`, `password`, `idNumber`, `title`, `photo`, `userType`,`references`) VALUES
--(1, 'Vanesasa', 'Maluleka', 'musa67@gmail.com', 'Vanessa98@', '9801140707086', 'Ms', )


-- CREATE TABLE `user_usertype`
-- (
--     `userUserTypeId` INT(10) PRIMARY KEY AUTO_INCREMENT,
--     `userId` INT(10) NOT NULL,
--     `email` VARCHAR(250) UNIQUE NOT NULL,
--     `password` VARCHAR(16) NOT NULL,
--     `userTypeId` INT(2) NOT NULL DEFAULT 1,
--     FOREIGN KEY (`userTypeId`) REFERENCES userType(`userTypeId`),
--     FOREIGN KEY (`userId`) REFERENCES user(`userId`)

-- );




CREATE TABLE `project_type`
(
    `projectTypeId` INT(10) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(80) NOT NULL,
    `description` TEXT,
    `disciplineId` INT(5) NOT NULL,
    FOREIGN KEY (`disciplineId`) REFERENCES discipline(`disciplineId`)
);

INSERT INTO `project_type` (`projectTypeId`, `name`, `description`, `disciplineId`) VALUES
(1, 'Research Proposal', 'A research proposal is a document proposing a research project, generally in the sciences or academia, and generally constitutes a request for sponsorship of that research. Proposals are evaluated on the cost and potential impact of the proposed research, and on the soundness of the proposed plan for carrying it out', 7),
(2, 'Research', 'Research is \"creative and systematic work undertaken to increase the stock of knowledge\". It involves the collection, organization and analysis of information to increase understanding of a topic or issue. A research project may be an expansion on past work in the field.', 7);



CREATE TABLE `guideline`
(
    `guidelineId` INT(10) PRIMARY KEY AUTO_INCREMENT,
    `projectTypeId` INT(10) NOT NULL,
    `text` TEXT NOT NULL,
    FOREIGN KEY (`projectTypeId`) REFERENCES project_type(`projectTypeId`)
);


CREATE TABLE `link`
(
    `linkId` INT(20) PRIMARY KEY AUTO_INCREMENT,
    `name` TEXT NOT NULL,
    `link` TEXT NOT NULL,
    `guideLineId` INT(10) NOT NULL,
    FOREIGN KEY(`guideLineId`) REFERENCES guideline(`guideLineId`)
);


CREATE TABLE `project_status`
(
    `statusId` INT(2) PRIMARY KEY AUTO_INCREMENT,
    `status` VARCHAR(150)
);

INSERT INTO `project_status` (`status`) VALUES ('created');
INSERT INTO `project_status` (`status`) VALUES ('completed');
INSERT INTO `project_status` (`status`) VALUES ('published');
INSERT INTO `project_status` (`status`) VALUES ('sent to supervisor');
INSERT INTO `project_status` (`status`) VALUES ('opened');
INSERT INTO `project_status` (`status`) VALUES ('under review');
INSERT INTO `project_status` (`status`) VALUES ('rejected');
INSERT INTO `project_status` (`status`) VALUES ('accepted');



CREATE TABLE `project`
(
    `projectId` INT(10) NOT NULL AUTO_INCREMENT,
    `startDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `endDate` DATE,
    `description` VARCHAR(500), 
    `keyword` VARCHAR(100),
    `name` VARCHAR(100),
    `text` LONGTEXT,
    `statusId` INT(2) NOT NULL DEFAULT 1, -- FK
    `projectTypeId` INT(2) NOT NULL, -- FK
    `userId` INT(10) NOT NULL, -- FK
    `supervisorId` INT(10) NOT NULL,
    FOREIGN KEY (`supervisorId`) REFERENCES `user`(`userId`),
    PRIMARY KEY (`projectId`, `name`),
    FOREIGN KEY (`userId`) REFERENCES `user`(`userId`),
    FOREIGN KEY (`statusId`) REFERENCES project_status(`statusId`),
    FOREIGN KEY (`projectTypeId`) REFERENCES project_type(`projectTypeId`)
);

CREATE TABLE `notes`
(
    `noteId` INT(100) PRIMARY KEY AUTO_INCREMENT,
    `startDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `text` TEXT NOT NULL,
    `guidelineId` INT(10),
    `projectId` INT(10) NOT NULL,
    FOREIGN KEY (`guidelineId`) REFERENCES `guideline`(`guidelineId`),
    FOREIGN KEY (`projectId`) REFERENCES project(`projectId`)

);


ALTER TABLE `user` ADD UNIQUE `unique_index_for_user`(`idNumber`, `userType`);
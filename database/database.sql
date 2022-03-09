DROP DATABASE researcherdna;

CREATE DATABASE researcherdna;

USE researcherdna;

CREATE TABLE `faculties`
(
    `facultyId` INT(3) PRIMARY KEY  AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(255)
);

INSERT INTO `faculties` (`name`) VALUES ('natural science');
INSERT INTO `faculties` (`name`) VALUES ('mathematics and computer science');
INSERT INTO `faculties` (`name`) VALUES ('social sciences');
INSERT INTO `faculties` (`name`) VALUES ('humanities and arts');
INSERT INTO `faculties` (`name`) VALUES ('applied science');


CREATE TABLE `disciplines`
(
    `disciplineId` INT(5) PRIMARY KEY AUTO_INCREMENT,
    `name`  VARCHAR(50) NOT NULL,
    `facultyId` INT(3) NOT NULL,
    FOREIGN KEY (`facultyId`) REFERENCES faculties(`facultyId`)
);
-- 1 Natural sciences
INSERT INTO `disciplines` (`name`, `facultyId`) VALUES ('Astronomy',1);
INSERT INTO `disciplines` (`name`, `facultyId`) VALUES ('Biology',1);
INSERT INTO `disciplines` (`name`, `facultyId`) VALUES ('Chemistry',1);
INSERT INTO `disciplines` (`name`, `facultyId`) VALUES ('Physics',1);
INSERT INTO `disciplines` (`name`, `facultyId`) VALUES ('Planetary science',1);

-- 2 Mathematics and Computer science
INSERT INTO `disciplines`  (`name`, `facultyId`)  VALUES ('Mathematics', 2);
INSERT INTO `disciplines`  (`name`, `facultyId`)  VALUES ('Computer science', 2);




CREATE TABLE `users`
(
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `email` VARCHAR(250) UNIQUE NOT NULL,
    `password` VARCHAR(16) NOT NULL,
    `idNumber` CHAR(13) NOT NULL,
    `title` VARCHAR(10),
    `photo` VARCHAR(255) NOT NULL DEFAULT "Get the API",
    `userType`  VARCHAR(15) NOT NULL,
    `references` INT(10),
    PRIMARY KEY(`id`, `idNumber`),
    UNIQUE (`idNumber`, `userType`),
    FOREIGN KEY (`references`) REFERENCES users(`id`)
    
);

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `idNumber`, `title`, `photo`, `userType`, `references`) VALUES (NULL, 'Shiko', 'Matlala', 'shikomatlala@gmail.com', 'shiko', '9511275418082', 'Mr', 'Get the API', '1', NULL);



CREATE TABLE `project_types`
(
    `projectTypeId` INT(10) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(80) NOT NULL,
    `description` TEXT,
    `disciplineId` INT(5) NOT NULL,
    FOREIGN KEY (`disciplineId`) REFERENCES disciplines(`disciplineId`)
);

INSERT INTO `project_types` (`projectTypeId`, `name`, `description`, `disciplineId`) VALUES
(1, 'Research Proposal', 'A research proposal is a document proposing a research project, generally in the sciences or academia, and generally constitutes a request for sponsorship of that research. Proposals are evaluated on the cost and potential impact of the proposed research, and on the soundness of the proposed plan for carrying it out', 7),
(2, 'Research', 'Research is \"creative and systematic work undertaken to increase the stock of knowledge\". It involves the collection, organization and analysis of information to increase understanding of a topic or issue. A research project may be an expansion on past work in the field.', 7);



CREATE TABLE `guidelines`
(
    `guidelineId` INT(10) PRIMARY KEY AUTO_INCREMENT,
    `projectTypeId` INT(10) NOT NULL,
    `text` TEXT NOT NULL,
    FOREIGN KEY (`projectTypeId`) REFERENCES project_types(`projectTypeId`)
);


CREATE TABLE `links`
(
    `linkId` INT(20) PRIMARY KEY AUTO_INCREMENT,
    `name` TEXT NOT NULL,
    `link` TEXT NOT NULL,
    `guideLineId` INT(10) NOT NULL,
    FOREIGN KEY(`guideLineId`) REFERENCES guidelines(`guideLineId`)
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



CREATE TABLE `projects`
(
    `projectId` INT(10) NOT NULL UNIQUE AUTO_INCREMENT,
    `startDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `endDate` DATE,
    `description` VARCHAR(500), 
    `keyword` VARCHAR(100),
    `name` VARCHAR(100),
    `text` LONGTEXT,
    `statusId` INT(2) NOT NULL DEFAULT 1, -- FK
    `projectTypeId` INT(2) NOT NULL, -- FK
    `userId` INT(10) NOT NULL, -- FK
    `supervisorId` INT(10),
    `createAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL,
    `references` INT(10),
    FOREIGN KEY (`supervisorId`) REFERENCES `users`(`id`),
    FOREIGN KEY (`references`) REFERENCES `projects`(`projectId`),
    PRIMARY KEY (`name`, `userId`),
    FOREIGN KEY (`userId`) REFERENCES `users`(`id`),
    FOREIGN KEY (`statusId`) REFERENCES project_status(`statusId`),
    FOREIGN KEY (`projectTypeId`) REFERENCES project_types(`projectTypeId`)
);


INSERT INTO `projects` (`projectId`, `startDate`, `endDate`, `description`, `keyword`, `name`, `text`, `statusId`, `projectTypeId`, `userId`, `supervisorId`, `createAt`, `updatedAt`, `references`) VALUES (NULL, current_timestamp(), NULL, 'Here we study the effects that water has on human beings, \r\nI have a theory that people who drink water can reduce the level of their mental health', 'Health, Nature, Well Being', 'Water makes you healtheir', NULL, '1', '1', '1', NULL, '2022-02-24 16:18:00.000000', '2022-02-24 16:18:00.000000', NULL);

CREATE TABLE `notes`
(
    `noteId` INT(100) PRIMARY KEY AUTO_INCREMENT,
    `startDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `text` TEXT NOT NULL,
    `guidelineId` INT(10),
    `projectId` INT(10) NOT NULL,
    FOREIGN KEY (`guidelineId`) REFERENCES `guidelines`(`guidelineId`),
    FOREIGN KEY (`projectId`) REFERENCES projects(`projectId`)

);


ALTER TABLE `users` ADD UNIQUE `unique_index_for_user`(`idNumber`, `userType`);
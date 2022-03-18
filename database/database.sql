-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2022 at 03:31 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `researcherdna`
DROP DATABASE IF EXISTS researcherdna;

CREATE DATABASE researcherdna;

USE researcherdna;
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `guidelinesUnder` (IN `projectType` INT, IN `disciplineId` INT)  SELECT guidelines.`name` "Name", guidelines.g_order "Sequence", guidelines.text "Text", disciplines.`name` "Department Name" 
    FROM guidelines, project_types, disciplines 
    WHERE project_types.id = 1
    AND project_types.disciplineId = disciplineId 
    AND disciplines.id = project_types.disciplineId$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `post` longtext NOT NULL,
  `userId` int(10) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blogcomments`
--

CREATE TABLE `blogcomments` (
  `id` int(10) NOT NULL,
  `commenterId` int(10) NOT NULL,
  `createrId` int(10) NOT NULL,
  `blogId` int(10) NOT NULL,
  `comment` text NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `disciplines`
--

CREATE TABLE `disciplines` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `facultyId` int(3) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disciplines`
--

INSERT INTO `disciplines` (`id`, `name`, `facultyId`, `createdAt`, `updatedAt`) VALUES
(1, 'Astronomy', 1, NULL, NULL),
(2, 'Biology', 1, NULL, NULL),
(3, 'Chemistry', 1, NULL, NULL),
(4, 'Physics', 1, NULL, NULL),
(5, 'Planetary science', 1, NULL, NULL),
(6, 'Mathematics', 2, NULL, NULL),
(7, 'Computer science', 2, NULL, NULL),
(8, 'Software', 2, '2022-03-12 15:11:30', '2022-03-12 15:11:30'),
(9, 'Information Technology', 2, '2022-03-12 14:14:50', '2022-03-12 14:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 'natural science', NULL, NULL, NULL),
(2, 'mathematics and computer science', NULL, NULL, NULL),
(3, 'social sciences', NULL, NULL, NULL),
(4, 'humanities and arts', NULL, NULL, NULL),
(5, 'applied science', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guidelines`
--

CREATE TABLE `guidelines` (
  `id` int(10) NOT NULL,
  `projectTypeId` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `g_order` int(10) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guidelines`
--

INSERT INTO `guidelines` (`id`, `projectTypeId`, `name`, `g_order`, `text`) VALUES
(1, 1, 'Title', 1, 'The title summarizes the main idea or ideas of your study. A good title contains the fewest possible words that adequately describe the contents and/or purpose of your research paper.\n\nThe title is without doubt the part of a paper that is read the most, and it is usually read first. If the title is too long it usually contains too many unnecessary words, e.g., \"A Study to Investigate the....\" On the other hand, a title which is too short often uses words which are too general. For example, \"African Politics\" could be the title of a book, but it does not provide any information on the focus of a research paper.'),
(2, 1, 'Abstract', 2, 'An abstract summarizes, usually in one paragraph of 300 words or less, the major aspects of the entire paper in a prescribed sequence that includes: 1) the overall purpose of the study and the research problem(s) you investigated; 2) the basic design of the study; 3) major findings or trends found as a result of your analysis; and, 4) a brief summary of your interpretations and conclusions.');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(20) NOT NULL,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `guidelineId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `name`, `link`, `guidelineId`) VALUES
(1, 'Choosing a Title', 'https://library.sacredheart.edu/c.php?g=29803&p=185911', 1),
(2, 'The Abstract', 'https://libguides.usc.edu/writingguide/abstract#:~:text=An%20abstract%20summarizes%2C%20usually%20in,as%20a%20result%20of%20your', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(100) NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `text` text NOT NULL,
  `guidelineId` int(10) DEFAULT NULL,
  `projectId` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `wordCount` int(10) NOT NULL,
  `collaborator` varchar(255) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `endDate` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `text` longtext DEFAULT NULL,
  `statusId` int(2) NOT NULL DEFAULT 1,
  `projectTypeId` int(2) NOT NULL,
  `userId` int(10) NOT NULL,
  `supervisorId` int(10) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `references` int(10) DEFAULT NULL
) ;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `startDate`, `endDate`, `description`, `keyword`, `name`, `text`, `statusId`, `projectTypeId`, `userId`, `supervisorId`, `createdAt`, `updatedAt`, `references`) VALUES
(5, '2022-03-12 14:07:02', NULL, 'Looking for james', NULL, 'hey best friend', NULL, 1, 1, 1, NULL, '2022-03-12 14:07:02', '2022-03-12 14:07:02', NULL),
(3, '2022-03-12 13:49:06', NULL, 'Looking for james', NULL, 'hey you', NULL, 1, 1, 1, NULL, '2022-03-12 13:49:06', '2022-03-12 13:49:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE `project_status` (
  `id` int(2) NOT NULL,
  `status` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`id`, `status`) VALUES
(1, 'created'),
(2, 'completed'),
(3, 'published'),
(4, 'sent to supervisor'),
(5, 'opened'),
(6, 'under review'),
(7, 'rejected'),
(8, 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `project_types`
--

CREATE TABLE `project_types` (
  `id` int(10) NOT NULL,
  `name` varchar(80) NOT NULL,
  `description` text DEFAULT NULL,
  `disciplineId` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_types`
--

INSERT INTO `project_types` (`id`, `name`, `description`, `disciplineId`) VALUES
(1, 'Research Proposal', 'A research proposal is a document proposing a research project, generally in the sciences or academia, and generally constitutes a request for sponsorship of that research. Proposals are evaluated on the cost and potential impact of the proposed research, and on the soundness of the proposed plan for carrying it out', 7),
(2, 'Research', 'Research is \"creative and systematic work undertaken to increase the stock of knowledge\". It involves the collection, organization and analysis of information to increase understanding of a topic or issue. A research project may be an expansion on past work in the field.', 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(16) NOT NULL,
  `idNumber` char(13) NOT NULL,
  `title` varchar(10) DEFAULT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'Get the API',
  `userType` varchar(15) NOT NULL,
  `references` int(10) DEFAULT NULL,
  `departmentId` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `idNumber`, `title`, `photo`, `userType`, `references`, `departmentId`) VALUES
(1, 'Shiko', 'Matlala', 'shikomatlala@gmail.com', 'shiko', '9511275418082', 'Mr', 'Get the API', '1', NULL, 2),
(2, 'Katleho', 'Makhoba', 'rkm@gmail.com', 'hello', '1234567890987', 'Dr', 'Get the API', '2', NULL, 9),
(3, 'Makape', 'Tema', 'makapetema@gmail.com', '0000', '1234567890101', 'Mr', 'Get the API', '3', NULL, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `blogcomments`
--
ALTER TABLE `blogcomments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commenterId` (`commenterId`),
  ADD KEY `createrId` (`createrId`);

--
-- Indexes for table `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facultyId` (`facultyId`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facultyId` (`id`);

--
-- Indexes for table `guidelines`
--
ALTER TABLE `guidelines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projectTypeId` (`projectTypeId`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guidelineId` (`guidelineId`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guidelineId` (`guidelineId`),
  ADD KEY `collaborator` (`collaborator`),
  ADD KEY `userId` (`userId`),
  ADD KEY `projectId` (`projectId`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`name`,`userId`),
  ADD UNIQUE KEY `projectId` (`id`),
  ADD KEY `supervisorId` (`supervisorId`),
  ADD KEY `references` (`references`),
  ADD KEY `userId` (`userId`),
  ADD KEY `statusId` (`statusId`),
  ADD KEY `projectTypeId` (`projectTypeId`);

--
-- Indexes for table `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_types`
--
ALTER TABLE `project_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disciplineId` (`disciplineId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`idNumber`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `idNumber` (`idNumber`,`userType`),
  ADD UNIQUE KEY `unique_index_for_user` (`idNumber`,`userType`),
  ADD KEY `references` (`references`),
  ADD KEY `departmentId` (`departmentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogcomments`
--
ALTER TABLE `blogcomments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `guidelines`
--
ALTER TABLE `guidelines`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `project_types`
--
ALTER TABLE `project_types`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_idfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `blogcomments`
--
ALTER TABLE `blogcomments`
  ADD CONSTRAINT `blogComments_idfk_1` FOREIGN KEY (`commenterId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `blogComments_idfk_2` FOREIGN KEY (`createrId`) REFERENCES `users` (`id`);

--
-- Constraints for table `disciplines`
--
ALTER TABLE `disciplines`
  ADD CONSTRAINT `disciplines_ibfk_1` FOREIGN KEY (`facultyId`) REFERENCES `faculties` (`id`);

--
-- Constraints for table `guidelines`
--
ALTER TABLE `guidelines`
  ADD CONSTRAINT `guidelines_ibfk_1` FOREIGN KEY (`projectTypeId`) REFERENCES `project_types` (`id`);

--
-- Constraints for table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_1` FOREIGN KEY (`guidelineId`) REFERENCES `guidelines` (`id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`guidelineId`) REFERENCES `guidelines` (`id`),
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`projectId`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `notes_idfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_idfk_4` FOREIGN KEY (`collaborator`) REFERENCES `users` (`email`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`supervisorId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`references`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_ibfk_4` FOREIGN KEY (`statusId`) REFERENCES `project_status` (`id`),
  ADD CONSTRAINT `projects_ibfk_5` FOREIGN KEY (`projectTypeId`) REFERENCES `project_types` (`id`);

--
-- Constraints for table `project_types`
--
ALTER TABLE `project_types`
  ADD CONSTRAINT `project_types_ibfk_1` FOREIGN KEY (`disciplineId`) REFERENCES `disciplines` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`references`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`departmentId`) REFERENCES `disciplines` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

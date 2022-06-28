-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2022 at 09:57 AM
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
--
DROP DATABASE IF EXISTS researcherd_na;

CREATE DATABASE researcherd_na;

USE researcherd_na;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `guidelinesUnder` (IN `projectType` INT, IN `disciplineId` INT)  SELECT guidelines.`name` "Name", guidelines.g_order "Sequence", guidelines.text "Text", disciplines.`name` "Department Name" 
    FROM guidelines, project_types, disciplines 
    WHERE project_types.projectTypeId = projectType 
    AND project_types.desciplineId = disciplineId 
    AND disciplines.desciplineId = project_types.desciplineId$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `action_items`
--

CREATE TABLE `action_items` (
  `id` int(10) NOT NULL COMMENT 'ID uniquely describes an action item and sets it apart from every other action item',
  `dueDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Every action item has its own due date.\r\nThis allows the user to decide when they want to finish working on an action \r\nOr it allows a user to plan their action items and see that they have achieved them.',
  `title` varchar(255) NOT NULL COMMENT 'This allows the user to give their action item a shorthand way of easily identifying it from every other action item.',
  `text` text NOT NULL COMMENT 'Here the user is given the opportunity to write anything which may include how they are going to to it, when they are going to do it.\r\nHow they are going to do it and so on',
  `projectStatusId` int(2) NOT NULL COMMENT 'The status here allows the user to click if the action item is complete or still pending and so on.',
  `goalId` int(10) NOT NULL COMMENT 'This  allows the user to link an action item to a bigger goal or to give the an action item its parent goal',
  `userId` int(10) NOT NULL COMMENT 'This allows the system to know who owns the note - since others since we will have many individuals creating action-items',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `action_items`
--

INSERT INTO `action_items` (`id`, `dueDate`, `title`, `text`, `projectStatusId`, `goalId`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, '2022-04-23 20:10:03', 'Learn Harvard referencing Guide', '- Look for books that teach harvard guide\r\n- Study the books that teach about harvard guide.\r\n- Practive harvard guide', 1, 1, 2, '2022-04-28 14:09:46', '2022-04-28 14:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `post` longtext NOT NULL,
  `userId` int(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `post`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'Testing', 'We are here what are you talking about', 1, '2022-03-17 09:13:10', '2022-03-17 09:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `chatgroups`
--

CREATE TABLE `chatgroups` (
  `id` int(2) NOT NULL,
  `userId` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `privileges` int(2) NOT NULL DEFAULT 1,
  `departmentId` int(5) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chatgroups`
--

INSERT INTO `chatgroups` (`id`, `userId`, `title`, `privileges`, `departmentId`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Noticeboard', 1, 1, '2022-04-28 14:16:19', '2022-04-28 14:16:19'),
(2, 1, 'Supervisor Chat', 1, 2, '2022-04-28 14:16:19', '2022-04-28 14:16:19'),
(3, 1, 'Open Chat', 1, 3, '2022-04-28 14:16:19', '2022-04-28 14:16:19'),
(4, 1, 'Open Chat', 1, 4, '2022-04-28 14:16:19', '2022-04-28 14:16:19'),
(5, 1, 'Open Chat', 1, 5, '2022-04-28 14:16:19', '2022-04-28 14:16:19'),
(6, 1, 'Research Ethics', 3, 7, '2022-04-28 14:16:19', '2022-04-28 14:16:19'),
(8, 1, 'Supervisor Chat', 1, 1, '2022-04-28 14:16:19', '2022-04-28 14:16:19');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `chatGroupId` int(5) NOT NULL,
  `text` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `userId`, `chatGroupId`, `text`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '1. Pick Your People\nThe number of folks you can include in a chat will be dependent on which chat app you’re using. However, just because you can talk to 20 or 25 people doesn’t mean you should! Once you get beyond a certain number, it can get difficult for everyone to communicate effectively. Be sure to keep your group a manageable size.\n2. Review Your Texts\nWe’ve all experienced those moments where it’s hard to know how to read a text. That’s why when it comes to group texting it’s more important than ever to think before you write! Instead of sending a snap text, make sure you’ve reviewed your response. Have a look at your punctuation and make sure that word recognition or auto-correct worked correctly.\n3. Get Involved in the Group Chat\nIt can be hard to keep up with some of the group chat conversations. However, it’s important to respond now and then so your fellow group chatters know that you’re still available. Instead of hitting mute, pop in every once in a while, and let people know what you think.\n4. Stay on Topic\nA chat with six or seven people can be pretty busy! That’s why it’s important that the content stays on topic. Instead of going off on unrelated issues, try a direct message or telephone call. Once the topic has veered, it can be confusing to get back to the root of the matter.\n5. Be Patient With Others in a Group Chat\nIt can be difficult to respond to a text blitz from one person, but it’s more complicated with group chat conversations! Instead of asking multiple questions, wait for a response. If everyone has to jump in and answer more than one question, the thread can get too busy too fast.\nWhat Should You Not Do in a Group Chat?\ngroup chat etiquette\n6. Don’t Give Out Sensitive Information\nIf you’re part of a larger group chat, there’s a chance that you might not know all the parties involved. For that reason, it’s important to be cautious about the information you share. Giving out information passwords, addresses, and even credit card numbers is not safe.\nEven if you know everyone, there’s a chance your chat data isn’t safe on many different texting apps. So choose a secure messenger like FamilyApp to keep all your data private.\n7. Avoid Private Conversations in a Group Chat\nIt’s one thing to direct message people individually if you want to talk about things. But if you’re on a group text, stick with conversations that relate to the whole group.\n8. Don’t Text Bomb\nNo one wants to receive 20 or 30 notifications because they’re in a group chat. It can become impossible to respond and will make it hard for others to stay involved. Stick with easy responses, condense your texts, and be direct.\n9. Refrain From Overusing Emojis\nEmojis and emoticons can be a fun way to be more expressive in a text. But when it comes to group texting, they can make it much busier. While you can still use them, it’s important to minimize your use so it doesn’t overwhelm the chat.', '2022-04-28 14:17:12', '2022-04-28 14:17:12'),
(2, 1, 2, '1. Pick Your People\r\nThe number of folks you can include in a chat will be dependent on which chat app you’re using. However, just because you can talk to 20 or 25 people doesn’t mean you should! Once you get beyond a certain number, it can get difficult for everyone to communicate effectively. Be sure to keep your group a manageable size.\r\n2. Review Your Texts\r\nWe’ve all experienced those moments where it’s hard to know how to read a text. That’s why when it comes to group texting it’s more important than ever to think before you write! Instead of sending a snap text, make sure you’ve reviewed your response. Have a look at your punctuation and make sure that word recognition or auto-correct worked correctly.\r\n3. Get Involved in the Group Chat\r\nIt can be hard to keep up with some of the group chat conversations. However, it’s important to respond now and then so your fellow group chatters know that you’re still available. Instead of hitting mute, pop in every once in a while, and let people know what you think.\r\n4. Stay on Topic\r\nA chat with six or seven people can be pretty busy! That’s why it’s important that the content stays on topic. Instead of going off on unrelated issues, try a direct message or telephone call. Once the topic has veered, it can be confusing to get back to the root of the matter.\r\n5. Be Patient With Others in a Group Chat\r\nIt can be difficult to respond to a text blitz from one person, but it’s more complicated with group chat conversations! Instead of asking multiple questions, wait for a response. If everyone has to jump in and answer more than one question, the thread can get too busy too fast.\r\nWhat Should You Not Do in a Group Chat?\r\ngroup chat etiquette\r\n6. Don’t Give Out Sensitive Information\r\nIf you’re part of a larger group chat, there’s a chance that you might not know all the parties involved. For that reason, it’s important to be cautious about the information you share. Giving out information passwords, addresses, and even credit card numbers is not safe.\r\nEven if you know everyone, there’s a chance your chat data isn’t safe on many different texting apps. So choose a secure messenger like FamilyApp to keep all your data private.\r\n7. Avoid Private Conversations in a Group Chat\r\nIt’s one thing to direct message people individually if you want to talk about things. But if you’re on a group text, stick with conversations that relate to the whole group.\r\n8. Don’t Text Bomb\r\nNo one wants to receive 20 or 30 notifications because they’re in a group chat. It can become impossible to respond and will make it hard for others to stay involved. Stick with easy responses, condense your texts, and be direct.\r\n9. Refrain From Overusing Emojis\r\nEmojis and emoticons can be a fun way to be more expressive in a text. But when it comes to group texting, they can make it much busier. While you can still use them, it’s important to minimize your use so it doesn’t overwhelm the chat.', '2022-04-28 14:17:12', '2022-04-28 14:17:12'),
(3, 1, 3, '1. Pick Your People\r\nThe number of folks you can include in a chat will be dependent on which chat app you’re using. However, just because you can talk to 20 or 25 people doesn’t mean you should! Once you get beyond a certain number, it can get difficult for everyone to communicate effectively. Be sure to keep your group a manageable size.\r\n2. Review Your Texts\r\nWe’ve all experienced those moments where it’s hard to know how to read a text. That’s why when it comes to group texting it’s more important than ever to think before you write! Instead of sending a snap text, make sure you’ve reviewed your response. Have a look at your punctuation and make sure that word recognition or auto-correct worked correctly.\r\n3. Get Involved in the Group Chat\r\nIt can be hard to keep up with some of the group chat conversations. However, it’s important to respond now and then so your fellow group chatters know that you’re still available. Instead of hitting mute, pop in every once in a while, and let people know what you think.\r\n4. Stay on Topic\r\nA chat with six or seven people can be pretty busy! That’s why it’s important that the content stays on topic. Instead of going off on unrelated issues, try a direct message or telephone call. Once the topic has veered, it can be confusing to get back to the root of the matter.\r\n5. Be Patient With Others in a Group Chat\r\nIt can be difficult to respond to a text blitz from one person, but it’s more complicated with group chat conversations! Instead of asking multiple questions, wait for a response. If everyone has to jump in and answer more than one question, the thread can get too busy too fast.\r\nWhat Should You Not Do in a Group Chat?\r\ngroup chat etiquette\r\n6. Don’t Give Out Sensitive Information\r\nIf you’re part of a larger group chat, there’s a chance that you might not know all the parties involved. For that reason, it’s important to be cautious about the information you share. Giving out information passwords, addresses, and even credit card numbers is not safe.\r\nEven if you know everyone, there’s a chance your chat data isn’t safe on many different texting apps. So choose a secure messenger like FamilyApp to keep all your data private.\r\n7. Avoid Private Conversations in a Group Chat\r\nIt’s one thing to direct message people individually if you want to talk about things. But if you’re on a group text, stick with conversations that relate to the whole group.\r\n8. Don’t Text Bomb\r\nNo one wants to receive 20 or 30 notifications because they’re in a group chat. It can become impossible to respond and will make it hard for others to stay involved. Stick with easy responses, condense your texts, and be direct.\r\n9. Refrain From Overusing Emojis\r\nEmojis and emoticons can be a fun way to be more expressive in a text. But when it comes to group texting, they can make it much busier. While you can still use them, it’s important to minimize your use so it doesn’t overwhelm the chat.', '2022-04-28 14:17:12', '2022-04-28 14:17:12'),
(4, 1, 4, '1. Pick Your People\r\nThe number of folks you can include in a chat will be dependent on which chat app you’re using. However, just because you can talk to 20 or 25 people doesn’t mean you should! Once you get beyond a certain number, it can get difficult for everyone to communicate effectively. Be sure to keep your group a manageable size.\r\n2. Review Your Texts\r\nWe’ve all experienced those moments where it’s hard to know how to read a text. That’s why when it comes to group texting it’s more important than ever to think before you write! Instead of sending a snap text, make sure you’ve reviewed your response. Have a look at your punctuation and make sure that word recognition or auto-correct worked correctly.\r\n3. Get Involved in the Group Chat\r\nIt can be hard to keep up with some of the group chat conversations. However, it’s important to respond now and then so your fellow group chatters know that you’re still available. Instead of hitting mute, pop in every once in a while, and let people know what you think.\r\n4. Stay on Topic\r\nA chat with six or seven people can be pretty busy! That’s why it’s important that the content stays on topic. Instead of going off on unrelated issues, try a direct message or telephone call. Once the topic has veered, it can be confusing to get back to the root of the matter.\r\n5. Be Patient With Others in a Group Chat\r\nIt can be difficult to respond to a text blitz from one person, but it’s more complicated with group chat conversations! Instead of asking multiple questions, wait for a response. If everyone has to jump in and answer more than one question, the thread can get too busy too fast.\r\nWhat Should You Not Do in a Group Chat?\r\ngroup chat etiquette\r\n6. Don’t Give Out Sensitive Information\r\nIf you’re part of a larger group chat, there’s a chance that you might not know all the parties involved. For that reason, it’s important to be cautious about the information you share. Giving out information passwords, addresses, and even credit card numbers is not safe.\r\nEven if you know everyone, there’s a chance your chat data isn’t safe on many different texting apps. So choose a secure messenger like FamilyApp to keep all your data private.\r\n7. Avoid Private Conversations in a Group Chat\r\nIt’s one thing to direct message people individually if you want to talk about things. But if you’re on a group text, stick with conversations that relate to the whole group.\r\n8. Don’t Text Bomb\r\nNo one wants to receive 20 or 30 notifications because they’re in a group chat. It can become impossible to respond and will make it hard for others to stay involved. Stick with easy responses, condense your texts, and be direct.\r\n9. Refrain From Overusing Emojis\r\nEmojis and emoticons can be a fun way to be more expressive in a text. But when it comes to group texting, they can make it much busier. While you can still use them, it’s important to minimize your use so it doesn’t overwhelm the chat.', '2022-04-28 14:17:12', '2022-04-28 14:17:12'),
(5, 1, 5, '1. Pick Your People\r\nThe number of folks you can include in a chat will be dependent on which chat app you’re using. However, just because you can talk to 20 or 25 people doesn’t mean you should! Once you get beyond a certain number, it can get difficult for everyone to communicate effectively. Be sure to keep your group a manageable size.\r\n2. Review Your Texts\r\nWe’ve all experienced those moments where it’s hard to know how to read a text. That’s why when it comes to group texting it’s more important than ever to think before you write! Instead of sending a snap text, make sure you’ve reviewed your response. Have a look at your punctuation and make sure that word recognition or auto-correct worked correctly.\r\n3. Get Involved in the Group Chat\r\nIt can be hard to keep up with some of the group chat conversations. However, it’s important to respond now and then so your fellow group chatters know that you’re still available. Instead of hitting mute, pop in every once in a while, and let people know what you think.\r\n4. Stay on Topic\r\nA chat with six or seven people can be pretty busy! That’s why it’s important that the content stays on topic. Instead of going off on unrelated issues, try a direct message or telephone call. Once the topic has veered, it can be confusing to get back to the root of the matter.\r\n5. Be Patient With Others in a Group Chat\r\nIt can be difficult to respond to a text blitz from one person, but it’s more complicated with group chat conversations! Instead of asking multiple questions, wait for a response. If everyone has to jump in and answer more than one question, the thread can get too busy too fast.\r\nWhat Should You Not Do in a Group Chat?\r\ngroup chat etiquette\r\n6. Don’t Give Out Sensitive Information\r\nIf you’re part of a larger group chat, there’s a chance that you might not know all the parties involved. For that reason, it’s important to be cautious about the information you share. Giving out information passwords, addresses, and even credit card numbers is not safe.\r\nEven if you know everyone, there’s a chance your chat data isn’t safe on many different texting apps. So choose a secure messenger like FamilyApp to keep all your data private.\r\n7. Avoid Private Conversations in a Group Chat\r\nIt’s one thing to direct message people individually if you want to talk about things. But if you’re on a group text, stick with conversations that relate to the whole group.\r\n8. Don’t Text Bomb\r\nNo one wants to receive 20 or 30 notifications because they’re in a group chat. It can become impossible to respond and will make it hard for others to stay involved. Stick with easy responses, condense your texts, and be direct.\r\n9. Refrain From Overusing Emojis\r\nEmojis and emoticons can be a fun way to be more expressive in a text. But when it comes to group texting, they can make it much busier. While you can still use them, it’s important to minimize your use so it doesn’t overwhelm the chat.', '2022-04-28 14:17:12', '2022-04-28 14:17:12');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `blogId` int(10) NOT NULL,
  `comment` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `disciplines`
--

CREATE TABLE `disciplines` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `facultyId` int(3) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disciplines`
--

INSERT INTO `disciplines` (`id`, `name`, `facultyId`, `createdAt`, `updatedAt`) VALUES
(1, 'Astronomy', 1, '2022-03-17 09:18:13', '2022-03-17 09:18:13'),
(2, 'Biology', 1, '2022-03-17 09:18:13', '2022-03-17 09:18:13'),
(3, 'Chemistry', 1, '2022-03-17 09:18:13', '2022-03-17 09:18:13'),
(4, 'Physics', 1, '2022-03-17 09:18:13', '2022-03-17 09:18:13'),
(5, 'Planetary science', 1, '2022-03-17 09:18:13', '2022-03-17 09:18:13'),
(6, 'Mathematics', 2, '2022-03-17 09:18:13', '2022-03-17 09:18:13'),
(7, 'Computer science', 2, '2022-03-17 09:18:13', '2022-03-17 09:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `name`, `description`, `updatedAt`, `createdAt`) VALUES
(1, 'natural science', NULL, '2022-03-17 09:19:04', '2022-03-17 09:19:04'),
(2, 'mathematics and computer science', NULL, '2022-03-17 09:19:04', '2022-03-17 09:19:04'),
(3, 'social sciences', NULL, '2022-03-17 09:19:04', '2022-03-17 09:19:04'),
(4, 'humanities and arts', NULL, '2022-03-17 09:19:04', '2022-03-17 09:19:04'),
(5, 'applied science', NULL, '2022-03-17 09:19:04', '2022-03-17 09:19:04');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `userId` int(10) NOT NULL COMMENT 'supervisor and student',
  `goalId` int(10) NOT NULL,
  `status` int(2) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `title`, `text`, `userId`, `goalId`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Title not properly formatted', 'Matlala - I see that you did you put your title in order, can you please have a look at it, - I provided some good guides for you.\r\n\r\nThe main issue that we have here is that your title is missing substance, when I read your title I get a feeling that it is not in relation to what your research is about.\r\nYour title is missing some words that are going to make it relatable with the research that you are conducting.\r\n\r\nWork on this one important issue then we can see how we can move forward.\r\n\r\nRemember you are running out of time.\r\nso fix it as soon as you can and then I will give you my feedback', 1, 1, 1, '2022-04-28 14:25:10', '2022-04-28 14:25:10');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` int(10) NOT NULL COMMENT 'A unique identifer for the goal that has been created',
  `title` varchar(255) NOT NULL COMMENT 'This gives a goal a suitable name that the user can use to refere to a goal',
  `dueDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Outlines the date that the goal is going to end',
  `outcome` text NOT NULL COMMENT 'Here the user can write what they want to have as the result of the gaol (This attribute my in some ways function as an acceptance criteria but it is not realy it)',
  `acceptanceCriteria` text NOT NULL COMMENT 'Allows the user to define what sets the goal as complete',
  `projectStatusId` int(1) NOT NULL DEFAULT 0 COMMENT 'Creates a way for the student to know the goal that they are working on.',
  `projectId` int(10) NOT NULL COMMENT 'Links the goal to a specific project that the student is working on.',
  `userId` int(10) NOT NULL COMMENT 'supervisor',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `title`, `dueDate`, `outcome`, `acceptanceCriteria`, `projectStatusId`, `projectId`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'Study all the guidelines', '2022-04-23 20:05:38', '- I want you to know harvard referencing.\r\n- I want you to know the structure of research\r\n- I want you to know why we conduct research the way we do.\r\n- I want you to share with me some researches that you have discovered through you study.', '- Give me a written paper describing your understanding of what you came to learn.\r\n- Give me a detailed summary of two articles together with their proper reference (note that the articles may be any of your choice)', 1, 1, 1, '2022-04-28 14:14:37', '2022-04-28 14:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `guidelines`
--

CREATE TABLE `guidelines` (
  `id` int(10) NOT NULL,
  `projectTypeId` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `g_order` int(10) NOT NULL,
  `text` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guidelines`
--

INSERT INTO `guidelines` (`id`, `projectTypeId`, `name`, `g_order`, `text`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Title', 1, 'The title summarizes the main idea or ideas of your study. A good title contains the fewest possible words that adequately describe the contents and/or purpose of your research paper.\n\nThe title is without doubt the part of a paper that is read the most, and it is usually read first. If the title is too long it usually contains too many unnecessary words, e.g., \"A Study to Investigate the....\" On the other hand, a title which is too short often uses words which are too general. For example, \"African Politics\" could be the title of a book, but it does not provide any information on the focus of a research paper.', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(2, 1, 'Abstract', 2, 'An abstract summarizes, usually in one paragraph of 300 words or less, the major aspects of the entire paper in a prescribed sequence that includes: 1) the overall purpose of the study and the research problem(s) you investigated; 2) the basic design of the study; 3) major findings or trends found as a result of your analysis; and, 4) a brief summary of your interpretations and conclusions.', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(3, 1, 'Preamble', 1, 'You will be informed who your supervisor is as soon as you are notified about your selection after the interviews.  Supervisors are allocated based on students’ research topics, and supervisors’ areas of expertise.', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(4, 1, 'Working title', 2, 'Your proposal should have a working title, which would help you and your supervisor to have an immediate sense of the subject area you’re interested in; what your topic of interest is; the context/population in question and, what the scope of your research may be.  This title will be finalised when you submit your work for final examination at the end of your study', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(5, 1, 'Introduction', 3, 'The Introduction should contain (some) of the following elements:', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(6, 1, 'Background And Rationale', 4, 'This is also known as the “zooming in” part.  How does this problem manifest itself on a wider scale?  E.g.: How does substance abuse effect learning in teaching in other countries, in South Africa, in Gauteng Province (With the necessary references to literature).', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(7, 1, 'preliminary literature study', 5, 'From literature, books (recently published), articles in journals and selective texts from the internet are used to support your thesis.  The literature study is not only a duplication of what was found.  It is expected that you deal with it in an academic way: compare authors’ views, criticise points of view based on facts and understand what you read to be able to put it in your own words.  A literature study is NOT about the use of quotation after quotation.  A literature study is about reading and reading and reading and become aware of the views of scholars about your topic', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(8, 1, 'statement of the problem', 6, 'Your problem statement is based only on what you have discussed so far in the introduction, the background and the literature study. Start thinking about the idea of the golden thread. Everything written should start forming a golden thread.  In other words, the problem statement flows from what was argued so far in the introduction, background and literature review.\r\nLook again at the concept: Problem STATEMENT.  The format should thus be a STATEMENT and not a QUESTION.\r\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(9, 1, 'Research questions and hypotheses', 7, 'DO NOT USE HYPOTHESES AND RESEARCH QUESTIONS\nIn most research that is undertaken, we come up with a specification of what the research problem is, i.e., what we hope will answer the questions raised by the curiosity we nurture (e.g., “Why do butterflies usually not fly by night?”; “What impact does is the abolishment of corporal punishment have on the society?”; “How does the late coming of teachers impact on learners’ academic performance?”). These research questions should then lead us to take certain initial positions on the matter (i.e., hypotheses), e.g., “The late coming of teachers lead to the incompletion of academic work.”\nHowever, not all research is about research problems/hypotheses. A lot of good, qualitative research is descriptive, and focuses on, for example, providing details of how a cultural and sociolinguistic ritual may take place (e.g., a traditional wedding ceremony), using a proven model of description (e.g., Hymes’ [1984] SPEAKING model in the Ethnography of Communication).\nHint: Stated research questions should be 100% in line with your title and your problem statement. Usually you will have a main question and some sub-questions. Start research questions with What?, Why? How? etc. and not with a verb.  That could lead to ‘yes’ or ‘no’ answers.\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(10, 1, 'research objectives', 8, '', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(11, 1, 'research design', 9, 'For this part of the work it is important that students should study literature. You need to be informed about research methodology and research design to be able to complete this section.\r\nExplain the concept “Research design” from literature.\r\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(12, 1, 'chapter outline', 0, 'A MEd study usually consists of five chapters.  A DEd study may have exactly the same structure.  If needed, more chapters could be added.\r\nChapter 1: Introduction and background to the study \r\nChapter 2: Literature review\r\nChapter 3: Research design\r\nChapter 4: Findings\r\nChapter 5: Conclusions and recommendations.\r\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(13, 1, 'significance of the study', 10, 'Explain why is this study of importance for your peers, for the Department or for schools.  Try also to state how these findings will be made known to people to whom it matters.  E.g.: Conferences, articles, presentations in school circuits)', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(14, 1, 'ethical consideration', 11, 'You need to make use of literature to explain how aspects such as confidentiality, the harm of respondents, informed consent, etc. could be dealt with in your research.', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(15, 1, 'time frame', 12, 'A clear indication should be given about the time frames required to complete this study.  It will start on the first day of registration until your final submission for examination.  You have to allow time for resubmissions of the proposal and chapters. It happens very seldom that your work will be accepted as perfect after the first chapter. All dissertations are dealt with chapter by chapter.  You are not allowed to continue with a chapter if you did not receive permission from your supervisor.\r\nTo assist students with keeping to deadlines as well as to support students keep on track to complete the Masters within a two period (approximately two and half from application to graduation), the Department will offer a series of research seminars. These seminars cover relevant topics that students are expected to engage in and are presented within a timeframe that corresponds to the key stages for completing the MEd thesis. BUDGET PLANNING \r\nYou need to draw a clear budget of all your expenses over the time of study.  This is a very important part of your proposal.  You need to convince your supervisor that you have the financial means to complete this study.  Think about telephone and internet costs, buying of books, travelling to conduct research and to visit your supervisor, registration, reregistration, etc. This will assist you in planning your sampling. Instead of selecting people widely spread, narrow it down to a specific region. \r\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(16, 1, 'general', 13, '', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(18, 1, 'stipulating a thoery of action', 0, 'A theory of action is intended to portray what is essentially a logic or causal model that describes how programs, projects or studies are intended to work, and outlines the different components of the system, while clearly specifying the connections among these components.  More importantly, a theory of action must specify the inputs or antecedent conditions, proximal, intermediate and distal outcomes, and describe the mechanisms or processes that specify the logic by which these components are sensibly related or the processes for processes for bringing about intended goals .\r\nStipulating the theory of action for your intended research study is a useful starting point as it allows researchers to develop a valid argument for the study, and will enable researchers to state very explicitly why answers to a specific research question will lead to a specific set of outcomes.  For this proposal, the theory of action should be presented in the form of text as well as graphically.  See examples 1 and 2. \r\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(19, 1, 'relationship between use of textbooks and teaching practices', 0, 'If teachers are provided with appropriate textbooks and are provided with training and support on how to effectively use these textbooks, this will lead to increase use of textbooks in the classroom, which in turn will lead to improvement in teaching practice. ', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(20, 1, 'Impact of ICT on performance of teachers and learners', 0, 'If appropriate ICT facilities and support is available and used effectively in schools, and if this leads to an improvement in the management of the school as well as improve support to teachers, then this will result in an improvement in teaching and learning practices which will improve performance of learners. ', '2022-03-17 09:20:03', '2022-03-17 09:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(20) NOT NULL,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `guidelineId` int(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `name`, `link`, `guidelineId`, `createdAt`, `updatedAt`) VALUES
(1, 'Choosing a Title', 'https://library.sacredheart.edu/c.php?g=29803&p=185911', 1, '2022-03-17 09:21:02', '2022-03-17 09:21:02'),
(2, 'The Abstract', 'https://libguides.usc.edu/writingguide/abstract#:~:text=An%20abstract%20summarizes%2C%20usually%20in,as%20a%20result%20of%20your', 2, '2022-03-17 09:21:02', '2022-03-17 09:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(100) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `text` varchar(255) NOT NULL,
  `guidelineId` int(10) DEFAULT NULL,
  `projectId` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `wordCount` int(10) NOT NULL,
  `collaboratorId` varchar(255) DEFAULT NULL,
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
  `projectStatusId` int(2) NOT NULL DEFAULT 1,
  `projectTypeId` int(2) NOT NULL,
  `userId` int(10) NOT NULL,
  `supervisorId` int(10) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `references` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `startDate`, `endDate`, `description`, `keyword`, `name`, `text`, `projectStatusId`, `projectTypeId`, `userId`, `supervisorId`, `createdAt`, `updatedAt`, `references`) VALUES
(17, '2022-03-25 13:51:45', NULL, 'Looking for james', NULL, ' hey  he friend', NULL, 1, 1, 1, NULL, '2022-03-25 13:51:45', '2022-03-25 13:51:45', NULL),
(21, '2022-03-25 13:53:06', NULL, 'Looking for james', NULL, ' hey  he friend', NULL, 1, 1, 2, NULL, '2022-03-25 13:53:06', '2022-03-25 13:53:06', NULL),
(14, '2022-03-25 13:51:22', NULL, 'Looking for james', NULL, ' hey best he friend', NULL, 1, 1, 1, NULL, '2022-03-25 13:51:22', '2022-03-25 13:51:22', NULL),
(3, '2022-03-18 07:53:27', NULL, 'Looking for james', NULL, ' hey hey he friend', NULL, 1, 2, 1, NULL, '2022-03-18 07:53:27', '2022-03-18 07:53:27', NULL),
(1, '2022-03-01 07:40:49', NULL, 'Here we study the effects that water has on human beings, \r\nI have a theory that people who drink water can reduce the level of their mental health', 'Health, Nature, Well Being', 'Water makes you healtheir', NULL, 1, 1, 1, NULL, '2022-02-24 16:18:00', '2022-02-24 16:18:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_statuses`
--

CREATE TABLE `project_statuses` (
  `id` int(2) NOT NULL,
  `status` varchar(150) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_statuses`
--

INSERT INTO `project_statuses` (`id`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'created', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(2, 'completed', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(3, 'published', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(4, 'sent to supervisor', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(5, 'opened', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(6, 'under review', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(7, 'rejected', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(8, 'accepted', '2022-03-17 09:23:38', '2022-03-17 09:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `project_types`
--

CREATE TABLE `project_types` (
  `id` int(10) NOT NULL,
  `name` varchar(80) NOT NULL,
  `description` text DEFAULT NULL,
  `disciplineId` int(5) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_types`
--

INSERT INTO `project_types` (`id`, `name`, `description`, `disciplineId`, `createdAt`, `updatedAt`) VALUES
(1, 'Research Proposal', 'A research proposal is a document proposing a research project, generally in the sciences or academia, and generally constitutes a request for sponsorship of that research. Proposals are evaluated on the cost and potential impact of the proposed research, and on the soundness of the proposed plan for carrying it out', 7, '2022-03-17 09:24:14', '2022-03-17 09:24:14'),
(2, 'Research', 'Research is \"creative and systematic work undertaken to increase the stock of knowledge\". It involves the collection, organization and analysis of information to increase understanding of a topic or issue. A research project may be an expansion on past work in the field.', 7, '2022-03-17 09:24:14', '2022-03-17 09:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `subguides`
--

CREATE TABLE `subguides` (
  `id` int(10) NOT NULL,
  `text` text NOT NULL,
  `guidelineId` int(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subguides`
--

INSERT INTO `subguides` ( `text`, `guidelineId`, `createdAt`, `updatedAt`) VALUES
('According to TUT policy on Postgraduate Studies, your research proposal should be completed within 6 months of registration for your M Ed or D Ed. In the Department of Educational Studies, you have to present your proposal at a Research Proposal Seminar in June.  After you have made the final changes, your proposal must be approved by the Departmental Research & Innovation Committee (DRIC) as well as by the University Higher Degrees Committee The approval process will be undertaken by your supervisor. ', 6, '2022-03-14 13:12:38', '2022-03-14 13:12:38'),
('Your proposal should, with the support and advice of your supervisor, be developed according to the guidelines herein stated.  These guidelines apply, more-or-less, to both Masters and Doctoral research proposals, and should be between 10-15 pages in length, excluding references and appendices.', 6, '2022-03-14 13:13:00', '2022-03-14 13:13:00'),
('What is essential in preparing your proposal is that your supervisor and DRIC must have sufficient evidence that you: \r\n\r\n•	have a clear-enough idea what research you hope to undertake in terms of the area and topic, \r\n•	will be able to find enough literature sources to explain the theoretical background of your study, \r\n•	know which research design will be most suitable for your research, \r\n•	will be able to complete the study in the prescribed time (M Ed two years, D Ed three years) and, \r\n•	have the academic background and competences to bring the project to a successful completion.\r\n', 6, '2022-03-14 13:13:42', '2022-03-14 13:13:42'),
('The template presented is guide to assist students in completing their proposal. You need not follow the sections (and their titles) below word-for-word; however, your proposal should present the gist required by the sections below.', 6, '2022-03-14 13:14:56', '2022-03-14 13:14:56'),
('Opening (Quotation or general statement)', 6, '2022-03-14 13:18:48', '2022-03-14 13:18:48'),
('Establishing common ground (Contextualise problem, Significance and relevance, current status of the problem, Discussion of previous studies, limitations, omissions \r\nPrevious literature summarised, reviewed', 6, '2022-03-14 13:20:20', '2022-03-14 13:20:20'),
('Prepare for current research (Denial (on the other hand), indicate gap in previous research, indicate how this research will fill the gap, state the cost of leaving the condition unsolved', 6, '2022-03-14 13:21:06', '2022-03-14 13:21:06'),
('Resolution (purpose of the research, focus, outline or overview, maybe a short indication of research methods, overview of what will follow)', 6, '2022-03-14 13:21:42', '2022-03-14 13:21:42'),
('Definitions/Explanations of principal concepts/notions implied\r\n\r\n\r\nThe first thing to do here is to define/explain the principal and relevant concepts/notions/terms you will be using, given your area of research.', 6, '2022-03-14 13:29:10', '2022-03-14 13:29:10'),
('Summary of previous literature on your intended topic.\r\n\r\nReview at least 6 to 10 of the latest journal articles, review research reports, books and book chapters, policy documents and any other relevant material that is applicable to your intended study. Provide a concise summary of your readings, focussing specifically on the theoretical approach, the research methods, study sample and population and research findings that may impact on your intended area of study.', 6, '2022-03-14 13:30:39', '2022-03-14 13:30:39'),
('The theoretical background and framework to the research:\r\n\r\nPresent/discuss the most relevant theories/models, in relation to your area of study, tracing the evolution of thinking in that area to the present day, i.e., the current state-of-play. Relate this to the crux of the matter of your research, e.g., do you intend to duplicate/repudiate the findings of a previous study/confirm the position of a theory? In addition, on what theoretical framework/model is your study based?  In the event of a descriptive study, present/discuss the model of description/observation you intend to use, comparing it to others before it (if applicable).', 6, '2022-03-14 13:33:44', '2022-03-14 13:33:44'),
('Specify the Theory of Action for your study (Optional)\r\n\r\n\r\nBegin with an explanation of the concept “theory of action”. The theory of action should be listed verbally as well as in the form of a diagram.  See Appendix A for more information. ', 6, '2022-03-14 13:34:24', '2022-03-14 13:34:24')
('If anyone reads your problem statement, he/she should be able to recognise the most important elements of your title in it without knowing what the title is.', 6, '2022-03-14 13:37:05', '2022-03-14 13:37:05'),
('Formulate your problem statement in not more than one paragraph', 6, '2022-03-14 13:37:43', '2022-03-14 13:37:43'),
('Can you determine what the title of the following study is:\r\nThe increase of incidents of bullying in primary schools within the inner-city is an issue of major concern to parents, teachers and learners.  Bullying in most schools, including some Pretoria inner-city primary schools, is leading to worsening educational conditions, such as serious school violence, psychological problems, decreased academic performance and truancy by learners.schools (Chauke, N.P: M Ed 2013)\r\n', 6, '2022-03-14 13:38:40', '2022-03-14 13:38:40'),
('Formulate your main research question.  This should contain elements of the research topic and what was mentioned in the problem statement (REMEMBER THE GOLDEN THREAD)', 6, '2022-03-14 13:42:48', '2022-03-14 13:42:48'),
('Formulate four sub-questions which will contribute to answering the main research question', 6, '2022-03-14 13:43:15', '2022-03-14 13:43:15'),
('Population\r\nExplain the concept ‘population’ from literature.\r\nExplain the population relevant for your study.\r\n', 11, '2022-03-14 14:25:53', '2022-03-14 14:25:53'),
(22, 'Sampling\r\nExplain the concept ‘sampling’ from literature.\r\nExplain your sampling technique.\r\nE.g.: For qualitative research: probability sampling, random sampling, cluster sampling, etc.\r\nQuantitative: Non-probability, convenience, snowball, purposive, etc.\r\nYou will use a smaller sample for qualitative studies and larger samples for quantitative studies.\r\n', 11, '2022-03-14 14:26:35', '2022-03-14 14:26:35'),
(23, 'Data collection\r\nKeep your research approach in mind when making this choice.\r\nQualitative research: E.g. Interviews, observations, document analysis, photographs.\r\nState your instrument chosen for data collection.  Then give the theory underlying that from literature.  Explain the administrative aspects of your data collection:  When will you do it? From whom do you need to obtain permission? \r\nQuantitative: E.g. Questionnaires. Find from literature the theory behind questionnaires.\r\nExplain the administrative aspects of your data collection:  When will you do it? From whom do you need to obtain permission? \r\n', 11, '2022-03-14 14:27:13', '2022-03-14 14:27:13'),
(24, 'Data analysis\r\nQualitative data are in the form of notes and audio tape recordings. These notes need to be transcribed, to be read and re-read, themes need to be identified.  You have to find from literature ways of analysing qualitative data.  Interpretations of data are presented in narratives and words.\r\nQuantitative data are analysed through statistical procedures.  Findings are presented as tables, histograms, pie charts, etc\r\n', 11, '2022-03-14 14:28:33', '2022-03-14 14:28:33'),
(25, 'references\r\nA complete alphabetical list of references, ONLY cited in the proposal, should be prepared. You have to make use of the guidelines in the Citation Guide of TUT.\r\nReference items are not numbered; NO JUSTIFICATION..\r\n', 14, '2022-03-14 14:37:05', '2022-03-14 14:37:05'),
(26, 'Editing:  All work submitted to your supervisor, should be edited and free from spelling mistakes and sentence construction errors.  Your dictionary should become one of your most important companions during your studies.', 16, '2022-03-14 14:41:00', '2022-03-14 14:41:00'),
(27, 'Font:  All work should be submitted only in 12pt Arial or Times New Roman.', 16, '2022-03-14 14:41:24', '2022-03-14 14:41:24'),
(28, 'Line spacing: 1.5 ', 16, '2022-03-14 14:42:24', '2022-03-14 14:42:24'),
(29, 'Numbering:  The numbering format should be numerical and should not be more than two levels, e.g. 1; 1.1 and 1.1.1  or 2; 2.1 and 2.1.1', 16, '2022-03-14 14:44:59', '2022-03-14 14:44:59'),
(30, 'File naming convention If you send any work by e-mail to your supervisor, use the following file naming convention:\r\n1. Surname,	2. Work submitted and 	3. Date (Day Month and Year).\r\nExample 1:	Mahlangu Proposal 13March2012 \r\nExample 2:	Mahlangu Chapter1 19 June2012 \r\n', 16, '2022-03-14 14:46:56', '2022-03-14 14:46:56'),
(31, 'Use the example in Appendix C for your front page: (use spaces to spread over a whole page)', 16, '2022-03-14 14:47:30', '2022-03-14 14:47:30'),
(32, 'Feedback: we would greatly appreciate your comments and inputs regarding the usefulness of this guide and suggestions on how this guide should be improved for future use. Please send all feedback to gaenoalet@tut.ac.za.', 16, '2022-03-14 14:47:58', '2022-03-14 14:47:58'),
(33, 'Feedback: we would greatly appreciate your comments and inputs regarding the usefulness of this guide and suggestions on how this guide should be improved for future use. Please send all feedback to gaenoalet@tut.ac.za.', 16, '2022-03-14 14:49:52', '2022-03-14 14:49:52');

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
  `disciplineId` int(10) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `idNumber`, `title`, `photo`, `userType`, `references`, `disciplineId`, `verified`, `createdAt`, `updatedAt`) VALUES
(1, 'Shiko', 'Matlala', '', 'shiko', '9511275418082', 'Mr', 'Get the API', '1', NULL, NULL, 0, '2022-03-17 09:34:15', '2022-03-17 09:34:15'),
(2, 'Katleho', 'Makhoba', 'rkmwastaken@gmail.com', '123456', '1111111111111', NULL, 'Get the API', '', NULL, NULL, 0, '2022-03-25 15:52:50', '2022-03-25 15:52:50'),
(3, 'Shiko', 'Matlala', 'shikomatlala2@gmail.com', '$2a$12$m6MLnMKeo', '2001114386089', 'Miss', 'default.png', '1', NULL, NULL, 1, '2022-04-28 12:33:18', '2022-04-28 12:33:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action_items`
--
ALTER TABLE `action_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `constraint_fk_action_item_creator` (`userId`),
  ADD KEY `constraint_fk_action_item_goal_id` (`goalId`),
  ADD KEY `action_item_fk_status_project_status` (`projectStatusId`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `chatgroups`
--
ALTER TABLE `chatgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdBy` (`userId`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `senderId` (`userId`),
  ADD KEY `chatGroupId` (`chatGroupId`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogId` (`blogId`),
  ADD KEY `userId` (`userId`) USING BTREE;

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
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `constraint_fk_supervisorfeedback_goal` (`goalId`),
  ADD KEY `constraint_fk_supervisorid_user` (`userId`),
  ADD KEY `supervisorfeedback_fk_status_project_status` (`status`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id_constraint` (`projectId`),
  ADD KEY `createdBy` (`userId`),
  ADD KEY `constraint_fk_status_project_status` (`projectStatusId`);

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
  ADD KEY `collaborator` (`collaboratorId`),
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
  ADD KEY `statusId` (`projectStatusId`),
  ADD KEY `projectTypeId` (`projectTypeId`);

--
-- Indexes for table `project_statuses`
--
ALTER TABLE `project_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_types`
--
ALTER TABLE `project_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disciplineId` (`disciplineId`) USING BTREE;

--
-- Indexes for table `subguides`
--
ALTER TABLE `subguides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guidelineId` (`guidelineId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`idNumber`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `idNumber` (`idNumber`,`userType`),
  ADD UNIQUE KEY `unique_index_for_user` (`idNumber`,`userType`),
  ADD KEY `references` (`references`),
  ADD KEY `departmentId` (`disciplineId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action_items`
--
ALTER TABLE `action_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID uniquely describes an action item and sets it apart from every other action item', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chatgroups`
--
ALTER TABLE `chatgroups`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'A unique identifer for the goal that has been created', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guidelines`
--
ALTER TABLE `guidelines`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `project_statuses`
--
ALTER TABLE `project_statuses`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `project_types`
--
ALTER TABLE `project_types`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subguides`
--
ALTER TABLE `subguides`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `action_items`
--
ALTER TABLE `action_items`
  ADD CONSTRAINT `action_item_fk_status_project_status` FOREIGN KEY (`projectStatusId`) REFERENCES `project_statuses` (`id`),
  ADD CONSTRAINT `constraint_fk_action_item_creator` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `constraint_fk_action_item_goal_id` FOREIGN KEY (`goalId`) REFERENCES `goals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blog_idfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `chatgroups`
--
ALTER TABLE `chatgroups`
  ADD CONSTRAINT `chatgroup_idfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chatgroup_idfk_2` FOREIGN KEY (`departmentId`) REFERENCES `disciplines` (`id`);

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chat_idfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_idfk_2` FOREIGN KEY (`chatGroupId`) REFERENCES `chatgroups` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `blogComments_idfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `blogComments_idfk_2` FOREIGN KEY (`blogId`) REFERENCES `blogs` (`id`);

--
-- Constraints for table `disciplines`
--
ALTER TABLE `disciplines`
  ADD CONSTRAINT `disciplines_ibfk_1` FOREIGN KEY (`facultyId`) REFERENCES `faculties` (`id`);

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `constraint_fk_supervisorfeedback_goal` FOREIGN KEY (`goalId`) REFERENCES `goals` (`id`),
  ADD CONSTRAINT `constraint_fk_supervisorid_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `supervisorfeedback_fk_status_project_status` FOREIGN KEY (`status`) REFERENCES `project_statuses` (`id`);

--
-- Constraints for table `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `constraint_fk_status_project_status` FOREIGN KEY (`projectStatusId`) REFERENCES `project_statuses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `project_id_constraint` FOREIGN KEY (`projectId`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`projectId`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `notes_ibfk_3` FOREIGN KEY (`guidelineId`) REFERENCES `guidelines` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notes_idfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_idfk_4` FOREIGN KEY (`collaboratorId`) REFERENCES `users` (`email`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`supervisorId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`references`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_ibfk_4` FOREIGN KEY (`projectStatusId`) REFERENCES `project_statuses` (`id`),
  ADD CONSTRAINT `projects_ibfk_5` FOREIGN KEY (`projectTypeId`) REFERENCES `project_types` (`id`);

--
-- Constraints for table `project_types`
--
ALTER TABLE `project_types`
  ADD CONSTRAINT `project_types_ibfk_1` FOREIGN KEY (`disciplineId`) REFERENCES `disciplines` (`id`);

--
-- Constraints for table `subguides`
--
ALTER TABLE `subguides`
  ADD CONSTRAINT `subguides_idfk_1` FOREIGN KEY (`guidelineId`) REFERENCES `guidelines` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`references`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`disciplineId`) REFERENCES `disciplines` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

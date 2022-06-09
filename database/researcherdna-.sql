-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2022 at 02:37 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

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


USE sql10498434;

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
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `action_items`
--

INSERT INTO `action_items` (`id`, `dueDate`, `title`, `text`, `projectStatusId`, `goalId`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, '2022-04-23 20:10:03', 'Learn Harvard referencing Guide', '- Look for books that teach harvard guide\r\n- Study the books that teach about harvard guide.\r\n- Practive harvard guide', 1, 1, 2, '2022-04-28 14:09:46', '2022-04-28 14:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `endDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `details` text NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'The purpose of this is to check if the supervisor has accepted the appointment or not',
  `type` int(11) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `projectId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `title`, `createAt`, `endDate`, `details`, `approved`, `type`, `updatedAt`, `projectId`) VALUES
(1, 'Appointment : Interview about conducting surveys', '2022-05-18 09:45:03', '2022-05-18 10:45:03', 'I would like to create an appointment to meet with you regarding - the procedure of cunducting surveys - I have see how a lot of people conduct Surveys but I want to have a one to one session where I can have you walk me through your initial experiences in conducting surveys', 1, 1, '2022-05-17 09:48:07', 17);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `post` longtext NOT NULL,
  `userId` int(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `post`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'Testing', 'We are here what are you talking about', 1, '2022-03-17 09:13:10', '2022-03-17 09:13:10'),
(2, 'Probabilities', 'The table will end at some age, traditionally denoted by 𝜔, such that 𝓁𝜔 = 0. This is the\nlimiting age of the table, and denotes the first age at which all of the original group will have\ndied. The actual value of 𝜔 will vary with the particular life table, but it is typically taken to\nbe around 110 or higher.\n3.2 Probabilities\nAlthough we assume we can predict 𝓁x exactly, there is still randomness in our model,\nsince it is not known whether or not any given individual will be among the survivors at a\nparticular point of time. It is convenient to introduce some elementary probabilistic notions.\nFor nonnegative integers n and x, let\nnpx = 𝓁x+n\n𝓁x\n. (3.2)\nWhat is the meaning of this term? Consider the 𝓁x survivors age x. Out of this group, 𝓁x+n will\nsurvive to age x + n. The quotient then gives us the probability that a person aged x, hereafter\ndenoted just by the symbol (x), will be alive at age x + n. Let\nnqx = 𝓁x − 𝓁x+n\n𝓁x\n. (3.3)\nThis gives us the probability that (x) will die between the ages of x and x + n. It is clear that\nnqx = 1 −npx. (3.4)\nAs an example, in the table given above we would have 2p0 = 965∕1000, 2q1 = 25∕980.\nSince a left subscript of ‘1’ occurs frequently it is omitted for notational convenience.\nThat is, px denotes 1px, and qx denotes 1qx. The quantity qx is often referred to as the mortality\nrate at age x.\nWhat is the probability that (x) will die between the ages of x + n and x + n + k? This is a\nquantity which we will use frequently. There are three main ways of expressing it:\n𝓁x+n − 𝓁x+n+k\n𝓁x\n, (3.5a)', 1, '2022-06-07 19:07:34', '2022-06-07 20:15:17'),
(3, 'Life expectancy', 'Life expectancy is one of the most frequently quoted actuarial concepts. Probably for this\nreason it is often used incorrectly, as we will explain below. A basic question is the following.\nHow long can a person age x expect to live? Of course there is much variety in the future\nlifetime of various individuals of the same age. Some will live for several years, and some\nwill die immediately, but we can attempt to arrive at some sort of average figure. One\napproach would be to take a large number of people age x and observe them until all have\ndied. We could then compute the total future lifetime of all these individuals. Dividing by\nthe number of people in the original group would give an estimate of the desired average.\nFor a drastically oversimplified example, take three people exactly age 60. Suppose one dies\nat age 62, another at age 721\n2\nand the third at age 911\n4\n. The total future lifetime would be\n2 + 12 1\n2 + 311\n4 = 45 3\n4 . Dividing by 3 we could estimate that a person age 60 could expect\nto live on average another 151\n4 years. Of course to be statistically accurate we would need\nmany more than three people. Moreover, the length of time needed for such a study makes\nit completely impractical. Remarkably however, once we have the life table, we can obtain\nthe figure directly, without carrying out the observations. To see this, we look at another\napproach to obtaining total future lifetime. Suppose we start with 𝓁x people age x. After 1\nyear, there will 𝓁x+1 survivors who would have each contributed 1 year of lifetime to this\ntotal. At the end of the 2 years there will 𝓁x+2 survivors who would have each contributed\nanother year to the total. Continuing in this way, we can estimate the total future lifetime of all\nlives as\n𝓁x+1 + 𝓁x+2 + 𝓁x+3 +⋯+ 𝓁𝜔−1,\nand, dividing through by 𝓁x, we obtain the quantity\nex =\n𝜔Σ−x−1\nk=1\n𝓁x+k\n𝓁x\n=\n𝜔Σ−x−1\nk=1\nkpx. (3.8)\nThe quantity ex is known as the curtate life expectancy or curtate expectation of life at age\nx. Theword curtate means reduced or truncated, reflecting the fact that this is not exactly the\nquantity that we want. We have cheated a little in our alternate measurement scheme, for it\nmeasures only whole future years of lifetime and ignores the fraction of the year lived in the\nyear of death. In our illustration above, for example, under the alternate counting method, the\n60-year-old who died at age 721\n2\nwould be credited with only 12 years of total lifetime rather\nthan the actual 12 1\n2\n. The person who died at 911\n4\nwould be credited with only 31 years rather\nthan the actual 311\n4 . We are undercounting between 0 and 1 years for each individual, and\nit seems reasonable to take this to be one-half on average. The true life expectancy, usually\nreferred to as the complete life expectancy at age x and denoted by e◦\nx is given approximately by\ne◦\nx = ex + 1\n2.\n\n', 3, '2022-06-07 20:26:02', '2022-06-07 22:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `chatgroups`
--

CREATE TABLE `chatgroups` (
  `id` int(2) NOT NULL,
  `userId` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `privileges` int(2) NOT NULL DEFAULT 1 COMMENT '1 - Everyone can read/update/delete\r\n\r\n2 - Students can read but cannot comment\r\n\r\n3 - Students cannot see but supervisors can see the group chat and participate\r\n\r\n',
  `disciplineId` int(5) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chatgroups`
--

INSERT INTO `chatgroups` (`id`, `userId`, `title`, `privileges`, `disciplineId`, `createdAt`, `updatedAt`) VALUES
(2, 1, 'Supervisor Chat', 2, 1, '2022-04-28 14:16:19', '2022-05-05 09:54:38'),
(4, 1, 'Open Chat', 1, 1, '2022-04-28 14:16:19', '2022-05-05 09:54:21'),
(5, 1, 'Open Chat', 1, 1, '2022-04-28 14:16:19', '2022-04-28 14:16:19'),
(16, 3, 'Lets talk about computers', 1, 1, '2022-05-07 14:12:41', '2022-05-07 14:12:41'),
(17, 3, 'Testing Group', 2, 1, '2022-05-26 13:12:39', '2022-05-26 13:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `chatGroupId` int(5) NOT NULL,
  `text` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `userId`, `chatGroupId`, `text`, `createdAt`, `updatedAt`) VALUES
(2, 1, 2, '1. Pick Your People\r\nThe number of folks you can include in a chat will be dependent on which chat app you’re using. However, just because you can talk to 20 or 25 people doesn’t mean you should! Once you get beyond a certain number, it can get difficult for everyone to communicate effectively. Be sure to keep your group a manageable size.\r\n2. Review Your Texts\r\nWe’ve all experienced those moments where it’s hard to know how to read a text. That’s why when it comes to group texting it’s more important than ever to think before you write! Instead of sending a snap text, make sure you’ve reviewed your response. Have a look at your punctuation and make sure that word recognition or auto-correct worked correctly.\r\n3. Get Involved in the Group Chat\r\nIt can be hard to keep up with some of the group chat conversations. However, it’s important to respond now and then so your fellow group chatters know that you’re still available. Instead of hitting mute, pop in every once in a while, and let people know what you think.\r\n4. Stay on Topic\r\nA chat with six or seven people can be pretty busy! That’s why it’s important that the content stays on topic. Instead of going off on unrelated issues, try a direct message or telephone call. Once the topic has veered, it can be confusing to get back to the root of the matter.\r\n5. Be Patient With Others in a Group Chat\r\nIt can be difficult to respond to a text blitz from one person, but it’s more complicated with group chat conversations! Instead of asking multiple questions, wait for a response. If everyone has to jump in and answer more than one question, the thread can get too busy too fast.\r\nWhat Should You Not Do in a Group Chat?\r\ngroup chat etiquette\r\n6. Don’t Give Out Sensitive Information\r\nIf you’re part of a larger group chat, there’s a chance that you might not know all the parties involved. For that reason, it’s important to be cautious about the information you share. Giving out information passwords, addresses, and even credit card numbers is not safe.\r\nEven if you know everyone, there’s a chance your chat data isn’t safe on many different texting apps. So choose a secure messenger like FamilyApp to keep all your data private.\r\n7. Avoid Private Conversations in a Group Chat\r\nIt’s one thing to direct message people individually if you want to talk about things. But if you’re on a group text, stick with conversations that relate to the whole group.\r\n8. Don’t Text Bomb\r\nNo one wants to receive 20 or 30 notifications because they’re in a group chat. It can become impossible to respond and will make it hard for others to stay involved. Stick with easy responses, condense your texts, and be direct.\r\n9. Refrain From Overusing Emojis\r\nEmojis and emoticons can be a fun way to be more expressive in a text. But when it comes to group texting, they can make it much busier. While you can still use them, it’s important to minimize your use so it doesn’t overwhelm the chat.', '2022-04-28 14:17:12', '2022-04-28 14:17:12'),
(4, 1, 4, '1. Pick Your People\r\nThe number of folks you can include in a chat will be dependent on which chat app you’re using. However, just because you can talk to 20 or 25 people doesn’t mean you should! Once you get beyond a certain number, it can get difficult for everyone to communicate effectively. Be sure to keep your group a manageable size.\r\n2. Review Your Texts\r\nWe’ve all experienced those moments where it’s hard to know how to read a text. That’s why when it comes to group texting it’s more important than ever to think before you write! Instead of sending a snap text, make sure you’ve reviewed your response. Have a look at your punctuation and make sure that word recognition or auto-correct worked correctly.\r\n3. Get Involved in the Group Chat\r\nIt can be hard to keep up with some of the group chat conversations. However, it’s important to respond now and then so your fellow group chatters know that you’re still available. Instead of hitting mute, pop in every once in a while, and let people know what you think.\r\n4. Stay on Topic\r\nA chat with six or seven people can be pretty busy! That’s why it’s important that the content stays on topic. Instead of going off on unrelated issues, try a direct message or telephone call. Once the topic has veered, it can be confusing to get back to the root of the matter.\r\n5. Be Patient With Others in a Group Chat\r\nIt can be difficult to respond to a text blitz from one person, but it’s more complicated with group chat conversations! Instead of asking multiple questions, wait for a response. If everyone has to jump in and answer more than one question, the thread can get too busy too fast.\r\nWhat Should You Not Do in a Group Chat?\r\ngroup chat etiquette\r\n6. Don’t Give Out Sensitive Information\r\nIf you’re part of a larger group chat, there’s a chance that you might not know all the parties involved. For that reason, it’s important to be cautious about the information you share. Giving out information passwords, addresses, and even credit card numbers is not safe.\r\nEven if you know everyone, there’s a chance your chat data isn’t safe on many different texting apps. So choose a secure messenger like FamilyApp to keep all your data private.\r\n7. Avoid Private Conversations in a Group Chat\r\nIt’s one thing to direct message people individually if you want to talk about things. But if you’re on a group text, stick with conversations that relate to the whole group.\r\n8. Don’t Text Bomb\r\nNo one wants to receive 20 or 30 notifications because they’re in a group chat. It can become impossible to respond and will make it hard for others to stay involved. Stick with easy responses, condense your texts, and be direct.\r\n9. Refrain From Overusing Emojis\r\nEmojis and emoticons can be a fun way to be more expressive in a text. But when it comes to group texting, they can make it much busier. While you can still use them, it’s important to minimize your use so it doesn’t overwhelm the chat.', '2022-04-28 14:17:12', '2022-04-28 14:17:12'),
(5, 1, 5, '1. Pick Your People\r\nThe number of folks you can include in a chat will be dependent on which chat app you’re using. However, just because you can talk to 20 or 25 people doesn’t mean you should! Once you get beyond a certain number, it can get difficult for everyone to communicate effectively. Be sure to keep your group a manageable size.\r\n2. Review Your Texts\r\nWe’ve all experienced those moments where it’s hard to know how to read a text. That’s why when it comes to group texting it’s more important than ever to think before you write! Instead of sending a snap text, make sure you’ve reviewed your response. Have a look at your punctuation and make sure that word recognition or auto-correct worked correctly.\r\n3. Get Involved in the Group Chat\r\nIt can be hard to keep up with some of the group chat conversations. However, it’s important to respond now and then so your fellow group chatters know that you’re still available. Instead of hitting mute, pop in every once in a while, and let people know what you think.\r\n4. Stay on Topic\r\nA chat with six or seven people can be pretty busy! That’s why it’s important that the content stays on topic. Instead of going off on unrelated issues, try a direct message or telephone call. Once the topic has veered, it can be confusing to get back to the root of the matter.\r\n5. Be Patient With Others in a Group Chat\r\nIt can be difficult to respond to a text blitz from one person, but it’s more complicated with group chat conversations! Instead of asking multiple questions, wait for a response. If everyone has to jump in and answer more than one question, the thread can get too busy too fast.\r\nWhat Should You Not Do in a Group Chat?\r\ngroup chat etiquette\r\n6. Don’t Give Out Sensitive Information\r\nIf you’re part of a larger group chat, there’s a chance that you might not know all the parties involved. For that reason, it’s important to be cautious about the information you share. Giving out information passwords, addresses, and even credit card numbers is not safe.\r\nEven if you know everyone, there’s a chance your chat data isn’t safe on many different texting apps. So choose a secure messenger like FamilyApp to keep all your data private.\r\n7. Avoid Private Conversations in a Group Chat\r\nIt’s one thing to direct message people individually if you want to talk about things. But if you’re on a group text, stick with conversations that relate to the whole group.\r\n8. Don’t Text Bomb\r\nNo one wants to receive 20 or 30 notifications because they’re in a group chat. It can become impossible to respond and will make it hard for others to stay involved. Stick with easy responses, condense your texts, and be direct.\r\n9. Refrain From Overusing Emojis\r\nEmojis and emoticons can be a fun way to be more expressive in a text. But when it comes to group texting, they can make it much busier. While you can still use them, it’s important to minimize your use so it doesn’t overwhelm the chat.', '2022-04-28 14:17:12', '2022-04-28 14:17:12'),
(7, 1, 2, 'We are putting in a new chat', '2022-05-07 13:51:16', '2022-05-07 13:51:16'),
(15, 3, 5, 'Hi there', '2022-05-07 14:02:28', '2022-05-07 14:02:28'),
(16, 3, 5, 'What are you up to?', '2022-05-07 14:02:45', '2022-05-07 14:02:45'),
(17, 3, 5, 'Hi there everyone - I just wanted to let you all know that we are not happy with the questions that we are receiving from everyone right now, we would appreciate it if you guys can just put down the question - ', '2022-05-07 14:07:22', '2022-05-07 14:07:22'),
(22, 3, 16, 'Hi guys I am shiko - let us talk about computes', '2022-05-07 14:12:57', '2022-05-07 14:12:57'),
(24, 3, 16, 'Hi there', '2022-05-09 08:14:00', '2022-05-09 08:14:00'),
(25, 3, 16, 'What are you up to?', '2022-05-09 08:14:09', '2022-05-09 08:14:09'),
(26, 3, 2, 'What are you up to?', '2022-05-09 08:14:31', '2022-05-09 08:14:31'),
(27, 1, 2, 'We are putting in a new chat', '2022-05-13 14:32:47', '2022-05-13 14:32:47'),
(28, 3, 17, 'Hi there how are you doing today?', '2022-05-26 13:12:50', '2022-05-26 13:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `blogId` int(10) NOT NULL,
  `comment` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `userId`, `blogId`, `comment`, `createdAt`, `updatedAt`) VALUES
(2, 3, 3, 'Hi there', '2022-06-07 23:24:11', '2022-06-07 23:24:11'),
(3, 3, 3, 'I see that this works well - \nWhat more could I be asking for?', '2022-06-07 23:24:53', '2022-06-07 23:24:53'),
(5, 3, 3, 'Look I wanted to ask you a qeuestion about the kind of thigns that you are doing.', '2022-06-07 23:25:41', '2022-06-07 23:25:41'),
(6, 3, 3, 'Dividing by 3 we could estimate that a person age 60 could expect\nto live on average another 151\n4 years. Of course to be statistically accurate we would need\nmany more than three people. Moreover, the length of time needed for such a study makes\nit completely impractical. Remarkably however, once we have the life table, we can obtain\nthe figure directly, without carrying out the observations. To see this, we look at another\napproach to obtaining total future lifetime. Suppose we start with 𝓁x people age x. After 1\nyear, there will 𝓁x+1 survivors who would have each contributed 1 year of lifetime to this\ntotal. At the end of the 2 years there will 𝓁x+2 survivors who would have each contributed\nanother year to the total. Continuing in this way, we can estimate the total future lifetime of all\nlives as\n\nYou know to this day I don\'t fully comprehend what is going on here.\n\nCan anyone please give me advice as to what is going on here?', '2022-06-07 23:27:12', '2022-06-07 23:27:12'),
(7, 3, 2, 'There is a very simple question that I have that I wanted to tackle with you about froms - can you kindly elaborate on th\n\"is finding here\nThis gives us the probability that (x) will die between the ages of x and x + n. It is clear that\nnqx = 1 −npx. (3.4)\nAs an example, in the table given above we would have 2p0 = 965∕1000, 2q1 = 25∕980.\nSince a left subscript of ‘1’ occurs frequently it is omitted for notational convenience.\nThat is, px denotes 1px, and qx denotes 1qx. The quantity qx is often referred to as the mortality\nrate at age x.\nWhat is the probability that (x) will die between the ages of x + n and x + n + k? This is a\nquantity which we will use frequently. There are three main ways of expressing it:\n𝓁x+n − 𝓁x+n+k\n𝓁x\"', '2022-06-07 23:40:34', '2022-06-07 23:40:34'),
(8, 4, 2, 'To Shiko Matlala\nI have always had the same question but I did not know how to go about tackling the question, could you kindly advice me about opening up a new shop.\n\n', '2022-06-07 23:46:33', '2022-06-07 23:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `disciplines`
--

CREATE TABLE `disciplines` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `facultyId` int(3) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
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
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `userId` int(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event_attendees`
--

CREATE TABLE `event_attendees` (
  `id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `attendace_status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
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
  `projectStatusId` int(2) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `title`, `text`, `userId`, `goalId`, `projectStatusId`, `createdAt`, `updatedAt`) VALUES
(1, 'Title not properly formatted', 'Matlala - I see that you did you put your title in order, can you please have a look at it, - I provided some good guides for you.\r\n\r\nThe main issue that we have here is that your title is missing substance, when I read your title I get a feeling that it is not in relation to what your research is about.\r\nYour title is missing some words that are going to make it relatable with the research that you are conducting.\r\n\r\nWork on this one important issue then we can see how we can move forward.\r\n\r\nRemember you are running out of time.\r\nso fix it as soon as you can and then I will give you my feedback', 1, 1, 1, '2022-04-28 14:25:10', '2022-04-28 14:25:10'),
(10, 'asdfasdf', 'asdfasdfasdf', 3, 2, 13, '2022-05-25 12:32:39', '2022-05-25 12:32:39'),
(11, 'I am happy', 'Great work I am loving the things that you are doing well done', 3, 2, 13, '2022-05-25 14:53:05', '2022-05-25 14:53:05'),
(12, 'Improve on the title', 'Hey I am happy that you were able to work on the title, I just wanted you to imporve on something that I like.\n\nMake sure that you improve on your title -  guidelines | I have noticed that a lot of you guys are struggling wht the title please have a look at the updated title on the guidelines', 3, 3, 13, '2022-05-25 15:00:09', '2022-05-25 15:00:09'),
(13, 'OK I am happy', 'I am happy with the work that you have done, - I would like you to improve on something that is important', 3, 2, 13, '2022-05-26 13:06:49', '2022-05-26 13:06:49'),
(14, 'OK I am happy', 'I am happy with the work that you have done, - I would like you to improve on something that is important', 3, 2, 13, '2022-05-26 13:06:51', '2022-05-26 13:06:51'),
(15, 'OK I am happy', 'I am happy with the work that you have done, - I would like you to improve on something that is important', 3, 2, 13, '2022-05-26 13:06:52', '2022-05-26 13:06:52'),
(16, 'bhubhuhbu', 'klo0-lop-lp', 3, 2, 13, '2022-05-27 10:53:57', '2022-05-27 10:53:57');

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
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `title`, `dueDate`, `outcome`, `acceptanceCriteria`, `projectStatusId`, `projectId`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'Study all the guidelines', '2022-04-23 20:05:38', '- I want you to know harvard referencing.\r\n- I want you to know the structure of research\r\n- I want you to know why we conduct research the way we do.\r\n- I want you to share with me some researches that you have discovered through you study.', '- Give me a written paper describing your understanding of what you came to learn.\r\n- Give me a detailed summary of two articles together with their proper reference (note that the articles may be any of your choice)', 1, 1, 1, '2022-04-28 14:14:37', '2022-04-28 14:14:37'),
(2, 'Testing new Goal', '2022-05-23 11:02:10', 'Test Goal description', '/Hi there/What are you up to?', 11, 14, 3, '2022-05-19 07:33:44', '2022-05-19 07:33:44'),
(3, 'Understand the structure of research', '2022-07-20 08:20:00', 'Understanding the structure of research is beneficial as it will allow you to create an information structure that users can understand and know how to work with your research.\n\nFurthermore this is important in that it will allow you to get a good head start on your research', '/Study about the title/Study and understand how to go about making ', 1, 14, 3, '2022-05-19 08:29:34', '2022-05-19 08:29:34'),
(4, 'Twingles', '2022-06-06 22:15:08', 'Test goal title', 'OK this works now', 11, 14, 3, '2022-05-19 08:53:36', '2022-06-06 22:15:08'),
(5, 'Goal Title', '2022-06-06 22:15:08', 'Hi there', 'What are you up to?', 11, 14, 3, '2022-05-19 09:02:38', '2022-06-06 22:15:08'),
(6, 'asdfasdf', '2022-05-27 09:56:00', 'asdfasdf', 'asfasfasdffds', 1, 1, 3, '2022-05-19 09:56:49', '2022-05-19 09:56:49'),
(7, 'What is Rain - ', '2022-06-28 09:08:00', 'By the end of this goal I want to know how to define the term rain.\nThe idea that I have is to make sure that we can fully define the term rain.\n\nIf not then we cannot fully talk about the system that we are working on.', '/Define what we mean by the term rain', 1, 3, 4, '2022-06-09 09:08:11', '2022-06-09 09:08:11'),
(8, 'Test ', '2022-06-10 11:56:00', 'Description', '/Acceptance Criteria', 1, 25, 10, '2022-06-09 11:56:20', '2022-06-09 11:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `goal_files`
--

CREATE TABLE `goal_files` (
  `id` int(10) NOT NULL,
  `file_name` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `goalId` int(10) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guidelines`
--

INSERT INTO `guidelines` (`id`, `projectTypeId`, `name`, `g_order`, `text`, `createdAt`, `updatedAt`) VALUES
(6, 1, 'Background And Rationale', 0, 'This is also known as the “zooming in” part.  How does this problem manifest itself on a wider scale?  E.g.: How does substance abuse effect learning in teaching in other countries, in South Africa, in Gauteng Province (With the necessary references to literature).', '2022-03-17 09:20:03', '2022-05-26 11:08:05'),
(7, 1, 'preliminary literature study', 0, 'From literature, books (recently published), articles in journals and selective texts from the internet are used to support your thesis.  The literature study is not only a duplication of what was found.  It is expected that you deal with it in an academic way: compare authors’ views, criticise points of view based on facts and understand what you read to be able to put it in your own words.  A literature study is NOT about the use of quotation after quotation.  A literature study is about reading and reading and reading and become aware of the views of scholars about your topic\n                      ', '2022-03-17 09:20:03', '2022-05-26 10:10:21'),
(8, 1, 'statement of the problem', 0, 'Your problem statement is based only on what you have discussed so far in the introduction, the background and the literature study. Start thinking about the idea of the golden thread. Everything written should start forming a golden thread.  In other words, the problem statement flows from what was argued so far in the introduction, background and literature review.\nLook again at the concept: Problem STATEMENT.  The format should thus be a STATEMENT and not a QUESTION.\n', '2022-03-17 09:20:03', '2022-05-26 11:06:55'),
(10, 1, 'research objectives', 8, '', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(11, 1, 'research design', 9, 'For this part of the work it is important that students should study literature. You need to be informed about research methodology and research design to be able to complete this section.\r\nExplain the concept “Research design” from literature.\r\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(12, 1, 'chapter outline', 0, 'A MEd study usually consists of five chapters.  A DEd study may have exactly the same structure.  If needed, more chapters could be added.\r\nChapter 1: Introduction and background to the study \r\nChapter 2: Literature review\r\nChapter 3: Research design\r\nChapter 4: Findings\r\nChapter 5: Conclusions and recommendations.\r\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(13, 1, 'significance of the study', 0, 'Explain why is this study of importance for your peers, for the Department or for schools.  Try also to state how these findings will be made known to people to whom it matters.  E.g.: Conferences, articles, presentations in school circuits)', '2022-03-17 09:20:03', '2022-05-26 11:08:14'),
(14, 1, 'ethical consideration', 11, 'You need to make use of literature to explain how aspects such as confidentiality, the harm of respondents, informed consent, etc. could be dealt with in your research.', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(15, 1, 'time frame', 12, 'A clear indication should be given about the time frames required to complete this study.  It will start on the first day of registration until your final submission for examination.  You have to allow time for resubmissions of the proposal and chapters. It happens very seldom that your work will be accepted as perfect after the first chapter. All dissertations are dealt with chapter by chapter.  You are not allowed to continue with a chapter if you did not receive permission from your supervisor.\r\nTo assist students with keeping to deadlines as well as to support students keep on track to complete the Masters within a two period (approximately two and half from application to graduation), the Department will offer a series of research seminars. These seminars cover relevant topics that students are expected to engage in and are presented within a timeframe that corresponds to the key stages for completing the MEd thesis. BUDGET PLANNING \r\nYou need to draw a clear budget of all your expenses over the time of study.  This is a very important part of your proposal.  You need to convince your supervisor that you have the financial means to complete this study.  Think about telephone and internet costs, buying of books, travelling to conduct research and to visit your supervisor, registration, reregistration, etc. This will assist you in planning your sampling. Instead of selecting people widely spread, narrow it down to a specific region. \r\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(18, 1, 'stipulating a thoery of action', 0, 'A theory of action is intended to portray what is essentially a logic or causal model that describes how programs, projects or studies are intended to work, and outlines the different components of the system, while clearly specifying the connections among these components.  More importantly, a theory of action must specify the inputs or antecedent conditions, proximal, intermediate and distal outcomes, and describe the mechanisms or processes that specify the logic by which these components are sensibly related or the processes for processes for bringing about intended goals .\r\nStipulating the theory of action for your intended research study is a useful starting point as it allows researchers to develop a valid argument for the study, and will enable researchers to state very explicitly why answers to a specific research question will lead to a specific set of outcomes.  For this proposal, the theory of action should be presented in the form of text as well as graphically.  See examples 1 and 2. \r\n', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(19, 1, 'relationship between use of textbooks and teaching practices', 0, 'If teachers are provided with appropriate textbooks and are provided with training and support on how to effectively use these textbooks, this will lead to increase use of textbooks in the classroom, which in turn will lead to improvement in teaching practice. ', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(20, 1, 'Impact of ICT on performance of teachers and learners', 0, 'If appropriate ICT facilities and support is available and used effectively in schools, and if this leads to an improvement in the management of the school as well as improve support to teachers, then this will result in an improvement in teaching and learning practices which will improve performance of learners. ', '2022-03-17 09:20:03', '2022-03-17 09:20:03'),
(30, 1, 'Guidelines', 0, 'Hi there how are you doing today', '2022-05-26 12:52:50', '2022-05-26 12:52:50'),
(31, 1, 'Enter Title', 0, 'Guidelines Details', '2022-05-26 12:55:40', '2022-05-26 12:55:40'),
(32, 1, 'Jack mo di notlolong', 0, 'Yessir', '2022-05-26 12:59:54', '2022-05-26 12:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(20) NOT NULL,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `guidelineId` int(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `createdAt`, `text`, `guidelineId`, `projectId`, `title`, `updatedAt`, `wordCount`, `collaboratorId`, `userId`) VALUES
(5, '2022-05-04 14:19:35', 'alsjdfljdfjs', NULL, 1, 'Testing Notes', '2022-05-23 14:43:26', 0, NULL, 1),
(8, '2022-05-23 14:42:33', 'An abstract summarizes, usually in one paragraph of 300 words or less, the major aspects of the entire paper in a prescribed sequence that includes: 1) the overall purpose of the study and the research problem(s) you investigated; 2) the basic design of t', NULL, 1, 'Notes about abstract', '2022-05-23 14:42:33', 0, NULL, 1),
(9, '2022-05-23 14:43:19', 'You will be informed who your supervisor is as soon as you are notified about your selection after the interviews. Supervisors are allocated based on students’ research topics, and supervisors’ areas of expertise.', NULL, 1, 'What I think is the meaning of preamble', '2022-05-23 14:43:19', 0, NULL, 1),
(10, '2022-05-23 14:43:59', 'From literature, books (recently published), articles in journals and selective texts from the internet are used to support your thesis. The literature study is not only a duplication of what was found. It is expected that you deal with it in an academic ', NULL, 1, 'I came to learn the following about preliminary investigation', '2022-05-23 14:43:59', 0, NULL, 1);

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
(14, '2022-03-25 13:51:22', NULL, 'Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user. Large clouds often have functions distributed over multiple locations, each location being a data center.', NULL, 'Cloud computing', NULL, 1, 1, 5, 3, '2022-03-25 13:51:22', '2022-03-25 13:51:22', NULL),
(22, '2022-06-09 10:23:25', NULL, 'Here we explore the power to which scripture study has on people including the ability to overcome temptations.\n\nBut all this research stems from the doctrine Deitism the idea that as children of a Deity we have within us attributes of a Deity or are one day going to be a Deity.\n\nThis in turn means that when individuals study from holy writ they in turn create a connection with their Deity Father', NULL, 'Dailly Scripture study makes you more brave', NULL, 1, 1, 2, NULL, '2022-06-09 10:23:25', '2022-06-09 10:23:25', NULL),
(3, '2022-03-18 07:53:27', NULL, 'Rain is liquid water in the form of droplets that have condensed from atmospheric water vapor and then become heavy enough to fall under gravity. Rain is a major component of the water cycle and is responsible for depositing most of the fresh water on the Earth.', NULL, 'Rain', NULL, 1, 2, 9, 3, '2022-03-18 07:53:27', '2022-03-18 07:53:27', NULL),
(23, '2022-06-09 10:54:10', NULL, 'Hi there', NULL, 'Testing', NULL, 1, 1, 2, NULL, '2022-06-09 10:54:10', '2022-06-09 10:54:10', NULL),
(17, '2022-03-25 13:51:45', NULL, 'A wall is a structure and a surface that defines an area; carries a load; provides security, shelter, or soundproofing; or, is decorative.', NULL, 'The bad side effects of walls', NULL, 1, 1, 7, 3, '2022-03-25 13:51:45', '2022-03-25 13:51:45', NULL),
(21, '2022-03-25 13:53:06', NULL, 'In botany, a tree is a perennial plant with an elongated stem, or trunk, usually supporting branches and leaves. In some usages, the definition of a tree may be narrower, including only woody plants with secondary growth, plants that are usable as lumber or plants above a specified height.', NULL, 'The conception of Trees', NULL, 1, 1, 8, 3, '2022-03-25 13:53:06', '2022-03-25 13:53:06', NULL),
(25, '2022-06-09 11:17:39', NULL, 'Description', NULL, 'title', NULL, 1, 2, 10, NULL, '2022-06-09 11:17:39', '2022-06-09 11:17:39', NULL),
(24, '2022-06-09 10:56:25', NULL, 'Description is good', NULL, 'Title is good', NULL, 1, 1, 2, 3, '2022-06-09 10:56:25', '2022-06-09 10:56:25', NULL),
(1, '2022-03-01 07:40:49', NULL, 'Here we study the effects that water has on human beings, \r\nI have a theory that people who drink water can reduce the level of their mental health', 'Health, Nature, Well Being', 'Water makes you healtheir', NULL, 1, 1, 6, 3, '2022-02-24 16:18:00', '2022-02-24 16:18:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_statuses`
--

CREATE TABLE `project_statuses` (
  `id` int(2) NOT NULL,
  `status` varchar(150) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_statuses`
--

INSERT INTO `project_statuses` (`id`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Inprogress', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(2, 'completed', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(3, 'published', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(4, 'sent to supervisor', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(5, 'opened', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(6, 'under review', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(7, 'rejected', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(8, 'accepted', '2022-03-17 09:23:38', '2022-03-17 09:23:38'),
(9, 'cancelled', '2022-05-23 12:53:26', '2022-05-23 12:53:26'),
(10, 'deleted', '2022-05-23 12:53:39', '2022-05-23 12:53:39'),
(11, 'overdue', '2022-05-23 12:54:40', '2022-05-23 12:54:40'),
(12, 'sent to student', '2022-05-25 12:22:37', '2022-05-25 12:22:37'),
(13, 'sent', '2022-05-25 12:22:49', '2022-05-25 12:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `project_types`
--

CREATE TABLE `project_types` (
  `id` int(10) NOT NULL,
  `name` varchar(80) NOT NULL,
  `description` text DEFAULT NULL,
  `disciplineId` int(5) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
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

INSERT INTO `subguides` (`id`, `text`, `guidelineId`, `createdAt`, `updatedAt`) VALUES
(9, 'Definitions/Explanations of principal concepts/notions implied\r\n\r\n\r\nThe first thing to do here is to define/explain the principal and relevant concepts/notions/terms you will be using, given your area of research.', 7, '2022-03-14 13:29:10', '2022-03-14 13:29:10'),
(10, 'Summary of previous literature on your intended topic.\r\n\r\nReview at least 6 to 10 of the latest journal articles, review research reports, books and book chapters, policy documents and any other relevant material that is applicable to your intended study. Provide a concise summary of your readings, focussing specifically on the theoretical approach, the research methods, study sample and population and research findings that may impact on your intended area of study.', 7, '2022-03-14 13:30:39', '2022-03-14 13:30:39'),
(11, 'The theoretical background and framework to the research:\r\n\r\nPresent/discuss the most relevant theories/models, in relation to your area of study, tracing the evolution of thinking in that area to the present day, i.e., the current state-of-play. Relate this to the crux of the matter of your research, e.g., do you intend to duplicate/repudiate the findings of a previous study/confirm the position of a theory? In addition, on what theoretical framework/model is your study based?  In the event of a descriptive study, present/discuss the model of description/observation you intend to use, comparing it to others before it (if applicable).', 7, '2022-03-14 13:33:44', '2022-03-14 13:33:44'),
(12, 'Specify the Theory of Action for your study (Optional)\r\n\r\n\r\nBegin with an explanation of the concept “theory of action”. The theory of action should be listed verbally as well as in the form of a diagram.  See Appendix A for more information. ', 7, '2022-03-14 13:34:24', '2022-03-14 13:34:24'),
(13, 'If anyone reads your problem statement, he/she should be able to recognise the most important elements of your title in it without knowing what the title is.', 8, '2022-03-14 13:37:05', '2022-03-14 13:37:05'),
(14, 'Formulate your problem statement in not more than one paragraph', 8, '2022-03-14 13:37:43', '2022-03-14 13:37:43'),
(15, 'Can you determine what the title of the following study is:\r\nThe increase of incidents of bullying in primary schools within the inner-city is an issue of major concern to parents, teachers and learners.  Bullying in most schools, including some Pretoria inner-city primary schools, is leading to worsening educational conditions, such as serious school violence, psychological problems, decreased academic performance and truancy by learners.schools (Chauke, N.P: M Ed 2013)\r\n', 8, '2022-03-14 13:38:40', '2022-03-14 13:38:40'),
(21, 'Population\r\nExplain the concept ‘population’ from literature.\r\nExplain the population relevant for your study.\r\n', 11, '2022-03-14 14:25:53', '2022-03-14 14:25:53'),
(22, 'Sampling\r\nExplain the concept ‘sampling’ from literature.\r\nExplain your sampling technique.\r\nE.g.: For qualitative research: probability sampling, random sampling, cluster sampling, etc.\r\nQuantitative: Non-probability, convenience, snowball, purposive, etc.\r\nYou will use a smaller sample for qualitative studies and larger samples for quantitative studies.\r\n', 11, '2022-03-14 14:26:35', '2022-03-14 14:26:35'),
(23, 'Data collection\r\nKeep your research approach in mind when making this choice.\r\nQualitative research: E.g. Interviews, observations, document analysis, photographs.\r\nState your instrument chosen for data collection.  Then give the theory underlying that from literature.  Explain the administrative aspects of your data collection:  When will you do it? From whom do you need to obtain permission? \r\nQuantitative: E.g. Questionnaires. Find from literature the theory behind questionnaires.\r\nExplain the administrative aspects of your data collection:  When will you do it? From whom do you need to obtain permission? \r\n', 11, '2022-03-14 14:27:13', '2022-03-14 14:27:13'),
(24, 'Data analysis\r\nQualitative data are in the form of notes and audio tape recordings. These notes need to be transcribed, to be read and re-read, themes need to be identified.  You have to find from literature ways of analysing qualitative data.  Interpretations of data are presented in narratives and words.\r\nQuantitative data are analysed through statistical procedures.  Findings are presented as tables, histograms, pie charts, etc\r\n', 11, '2022-03-14 14:28:33', '2022-03-14 14:28:33'),
(25, 'references\r\nA complete alphabetical list of references, ONLY cited in the proposal, should be prepared. You have to make use of the guidelines in the Citation Guide of TUT.\r\nReference items are not numbered; NO JUSTIFICATION..\r\n', 14, '2022-03-14 14:37:05', '2022-03-14 14:37:05');

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
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `idNumber`, `title`, `photo`, `userType`, `references`, `disciplineId`, `verified`, `createdAt`, `updatedAt`) VALUES
(1, 'Shiko', 'Matlala', 'tsholofeloitumeleng@gmail.com', 'shikomatlala@', '9511275418082', 'Mr', 'Get the API', '2', 3, NULL, 0, '2022-03-17 09:34:15', '2022-03-17 09:34:15'),
(2, 'Katleho', 'Makhoba', 'rkmwastaken@gmail.com', '123456', '1111111111111', NULL, 'Get the API', '', NULL, NULL, 0, '2022-03-25 15:52:50', '2022-03-25 15:52:50'),
(3, 'Shiko', 'Matlala', 'shikomatlala2@gmail.com', '$2a$12$m6MLnMKeo', '2001114386089', 'Miss', 'default.png', '2', NULL, 1, 1, '2022-04-28 12:33:18', '2022-04-28 12:33:18'),
(4, 'James', 'Livingston', 'workmaster42@gmail.com', '$2a$12$mgWWQUk2t', '9511275418083', 'Mr', 'default.png', '1', NULL, 7, 1, '2022-05-04 13:42:05', '2022-05-04 13:42:05'),
(5, 'Phindile', 'Matlala', 'pidilematlala@gmail.com', '$2a$12$m6MLnMKeo', '9911275418082', NULL, 'Get the API', '1', NULL, 7, 1, '2022-05-16 09:58:12', '2022-05-16 09:58:12'),
(6, 'Jan', 'Maponyane', 'janmaponyane@gmail.com', 'janmaponyane@', '8711275418082', NULL, 'Get the API', '1', NULL, 7, 1, '2022-05-16 09:59:52', '2022-05-16 09:59:52'),
(7, 'Thatohatsi', 'Mabapa', 'thatomabapa@gmail.com', 'thatomabapa@', '9611275418082', NULL, 'Get the API', '1', NULL, 7, 1, '2022-05-16 10:02:32', '2022-05-16 10:02:32'),
(8, 'Thandi', 'Mohlahlo', 'thandimohlahlo@gmail.com', 'thandimohlahlo@', '0011275418082', NULL, 'Get the API', '1', NULL, 7, 1, '2022-05-16 10:04:46', '2022-05-16 10:04:46'),
(9, 'Makape', 'Tema', 'makapetema@gmail.com', 'makapetema@', '9811275418082', NULL, 'Get the API', '1', NULL, 7, 1, '2022-05-16 10:04:46', '2022-05-16 10:04:46'),
(10, 'Phindile', 'Matlala', 'phindilematlala@gmail.com', '$2a$12$9V95dWCBd', '9911235418082', 'Mr', '', '1', NULL, 7, 1, '2022-06-09 09:57:19', '2022-06-09 09:57:19');

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
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_projectId_projects_appointment` (`projectId`);

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
  ADD KEY `chatgroup_idfk_2` (`disciplineId`);

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
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_created_by_users_event` (`userId`);

--
-- Indexes for table `event_attendees`
--
ALTER TABLE `event_attendees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_event_id_events_event_attendance` (`event_id`),
  ADD KEY `fk_user_id_users_event_attendees` (`user_id`),
  ADD KEY `fk_attendance_status_events_project_statuses` (`attendace_status`);

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
  ADD KEY `supervisorfeedback_fk_status_project_status` (`projectStatusId`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id_constraint` (`projectId`),
  ADD KEY `createdBy` (`userId`),
  ADD KEY `constraint_fk_status_project_status` (`projectStatusId`);

--
-- Indexes for table `goal_files`
--
ALTER TABLE `goal_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goalId` (`goalId`);

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
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chatgroups`
--
ALTER TABLE `chatgroups`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_attendees`
--
ALTER TABLE `event_attendees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'A unique identifer for the goal that has been created', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `goal_files`
--
ALTER TABLE `goal_files`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guidelines`
--
ALTER TABLE `guidelines`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `project_statuses`
--
ALTER TABLE `project_statuses`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `fk_projectId_projects_appointment` FOREIGN KEY (`projectId`) REFERENCES `projects` (`id`);

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
  ADD CONSTRAINT `chatgroup_idfk_2` FOREIGN KEY (`disciplineId`) REFERENCES `disciplines` (`id`);

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
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_created_by_users_event` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `event_attendees`
--
ALTER TABLE `event_attendees`
  ADD CONSTRAINT `fk_attendance_status_events_project_statuses` FOREIGN KEY (`attendace_status`) REFERENCES `project_statuses` (`id`),
  ADD CONSTRAINT `fk_event_id_events_event_attendance` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `fk_user_id_users_event_attendees` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `constraint_fk_supervisorfeedback_goal` FOREIGN KEY (`goalId`) REFERENCES `goals` (`id`),
  ADD CONSTRAINT `constraint_fk_supervisorid_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `supervisorfeedback_fk_status_project_status` FOREIGN KEY (`projectStatusId`) REFERENCES `project_statuses` (`id`);

--
-- Constraints for table `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `constraint_fk_status_project_status` FOREIGN KEY (`projectStatusId`) REFERENCES `project_statuses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `project_id_constraint` FOREIGN KEY (`projectId`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `goal_files`
--
ALTER TABLE `goal_files`
  ADD CONSTRAINT `fk_goalId_goals_goal_files` FOREIGN KEY (`goalId`) REFERENCES `goals` (`id`);

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

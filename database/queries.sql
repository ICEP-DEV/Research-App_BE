-- //We need to be able to count the total number of notifications from each goal - 
-- //Firstly select a goal that the super
SELECT * FROM `goal`
-- Select a goal the supervisor oversees.
SELECT * FROM `goals`, `users`
-- In order to get this proper, we need to start to get the project.
SELECT * FROM `projects`
-- Now that we have create projects we need to find prjects for a specific supervisor
SELECT * 
FROM `projects`
WHERE `projects`.`supervisorId` = 3
-- Now for each project we want to get the goals
SELECT *
FROM `projects`, `goals`
WHERE `projects`.`id` = `goals`.`projectId`
AND `projects`.`supervisorId` = 3
-- Now for each project we want to count the number of goals and group the projects by the project.
SELECT COUNT(`goals`.`projectId`) `total goals` , `projects`.`id` as `Project ID`
FROM `projects`, `goals`
WHERE `projects`.`id` = `goals`.`projectId`
AND `projects`.`supervisorId` = 3
GROUP BY `projects`.`id`
-- Now for every goal in every projecct get the total number of feedbacks
-- This query below is only going to give us projects.id that have goals, and whose goals also have feedbacks, as for those that do not meet this condition they will be excluded
SELECT COUNT(`goals`.`projectId`) `total goals` , `projects`.`id` as `Project ID`
FROM `projects`, `goals`, `feedbacks`
WHERE `projects`.`supervisorId` = 3
  AND `projects`.`id` = `goals`.`projectId`
  AND `goals`.`id` = `feedbacks`.`goalId`
GROUP BY `projects`.`id`
-- Now for every goal in every project get the total number of feedbacks
SELECT COUNT(`feedbacks`.`id`) `Total Feedbacks`,  `goals`.`id` as `Goal ID` , `projects`.`id` AS `Project ID`
FROM `projects`, `goals`, `feedbacks`
WHERE `projects`.`supervisorId` = 3
  AND `projects`.`id` = `goals`.`projectId`
  AND `goals`.`id` = `feedbacks`.`goalId`
GROUP BY `projects`.`id`, `goals`.`id`
-- Now for every goal in every project get the total number of feedbacks and together with their projects status
SELECT `project_statuses`.`status`, COUNT(`feedbacks`.`id`) `Total Feedbacks`,  `goals`.`id` as `Goal ID` , `projects`.`id` AS `Project ID`
FROM `projects`, `goals`, `feedbacks`, `project_statuses`
WHERE `projects`.`supervisorId` = 3
  AND `projects`.`id` = `goals`.`projectId`
  AND `goals`.`id` = `feedbacks`.`goalId`
  AND `project_statuses`.`id` = `feedbacks`.`projectStatusId`
GROUP BY `projects`.`id`, `goals`.`id`, `project_statuses`.`status`
-- If you are the reciepent of the of the goal then you cannot updated the goal to read, or seen
-- Now we only want to show feedbacks that have not been opened
SELECT `project_statuses`.`status`, COUNT(`feedbacks`.`id`) `Total Feedbacks`,  `goals`.`id` as `Goal ID` , `projects`.`id` AS `Project ID`
FROM `projects`, `goals`, `feedbacks`, `project_statuses`
WHERE `projects`.`supervisorId` = 3
  AND `projects`.`id` = `goals`.`projectId`
  AND `goals`.`id` = `feedbacks`.`goalId`
  AND `project_statuses`.`id` = `feedbacks`.`projectStatusId`
  AND `feedbacks`.`projectStatusId` = 13
GROUP BY `projects`.`id`, `goals`.`id`, `project_statuses`.`status`
-- Now we want to count but only for goals
SELECT `project_statuses`.`status`, COUNT(`feedbacks`.`id`) `Total Feedbacks`,  `goals`.`id` as `Goal ID` , `projects`.`id` AS `Project ID`
FROM `projects`, `goals`, `feedbacks`, `project_statuses`
WHERE `projects`.`supervisorId` = 3
  AND `projects`.`id` = `goals`.`projectId`
  AND `goals`.`id` = `feedbacks`.`goalId`
  AND `project_statuses`.`id` = `feedbacks`.`projectStatusId`
  AND `feedbacks`.`projectStatusId` = 13
GROUP BY `projects`.`id`, `goals`.`id`, `project_statuses`.`status`
-- Update the status of every feedback that is opened that has not been read - update the status to opened.
UPDATE `feedbacks` SET `projectStatusId` = 5
WHERE `feedbacks`.`id` = 15


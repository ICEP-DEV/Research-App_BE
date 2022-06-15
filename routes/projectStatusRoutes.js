const router = require("express").Router();
const projectStatusController = require("../controllers/projectStatusController");

router
  .route("/")
  .post(projectStatusController.createProjectStatus)
  .get(projectStatusController.getAllProjectStatuses);

router
  .route("/:id")
  .get(projectStatusController.getProjectStatus)
  .patch(projectStatusController.updateProjectStatus)
  .delete(projectStatusController.deleteProjectStatus);

module.exports = router;

const router = require("express").Router();
const projectTypeController = require("../controllers/projectTypeController");

router
  .route("/")
  .post(projectTypeController.createProjectType)
  .get(projectTypeController.getAllProjectTypes);

router
  .route("/:id")
  .get(projectTypeController.getProjectType)
  .patch(projectTypeController.updateProjectType)
  .delete(projectTypeController.deleteProjectType);

module.exports = router;

const router = require("express").Router();
const projectController = require("../controllers/projectController");

router
  .route("/")
  .post(projectController.createProject)
  .get(projectController.getAllProjects);

router
  .route("/:id")
  .get(projectController.getProject)
  .patch(projectController.updateProject)
  .delete(projectController.deleteProject);

router
  .route("/userId/:id")
  .get(projectController.getUserProjects);

module.exports = router;

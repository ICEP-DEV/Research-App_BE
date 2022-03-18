const router = require("express").Router();
const facultyController = require("../controllers/facultyController");

router
  .route("/")
  .post(facultyController.createFaculty)
  .get(facultyController.getAllFaculties);

router
  .route("/:id")
  .get(facultyController.getFaculty)
  .patch(facultyController.updateFaculty)
  .delete(facultyController.deleteFaculty);

module.exports = router;

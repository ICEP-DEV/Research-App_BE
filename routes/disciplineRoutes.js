const router = require("express").Router();
const disciplineController = require("../controllers/disciplineController");

router
  .route("/")
  .post(disciplineController.createDiscipline)
  .get(disciplineController.getAllDisciplines);

router
  .route("/:id")
  .get(disciplineController.getDiscipline)
  .patch(disciplineController.updateDiscipline)
  .delete(disciplineController.deleteDiscipline);

router
  .route("/faculty/:id")
  .get(disciplineController.getFacultyDiscipline);

module.exports = router;

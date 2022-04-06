const router = require("express").Router();
const subguidesController = require("../controllers/subguidesController");

router
  .route("/")
  .post(subguidesController.createSubguide)
  .get(subguidesController.getAllSubguides);

router
  .route("/:id")
  .get(subguidesController.getSubguide)
  .patch(subguidesController.updateSubguide)
  .delete(subguidesController.deleteSubguide);

module.exports = router;

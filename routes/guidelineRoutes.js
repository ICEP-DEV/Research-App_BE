const guidelineController = require("../controllers/guidelinesControler");
const router = require("express").Router();

router
  .route("/")
  .get(guidelineController.getAllGuidelines)
  .post(guidelineController.createGuideline);

router
  .route("/:id")
  .get(guidelineController.getGuideline)
  .patch(guidelineController.updateGuideline)
  .delete(guidelineController.deleteGuideline);

module.exports = router;

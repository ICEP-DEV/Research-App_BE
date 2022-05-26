const guidelineController = require("../controllers/guidelinesController");
const router = require("express").Router();

router.use(guidelineController.setIDs)
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

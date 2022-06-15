const linksController = require("../controllers/linksController");
const router = require("express").Router();

router
  .route("/")
  .get(linksController.getAllLinks)
  .post(linksController.createLink);

router
  .route("/:id")
  .get(linksController.getLink)
  .patch(linksController.updateLink)
  .delete(linksController.deleteLink);

module.exports = router;

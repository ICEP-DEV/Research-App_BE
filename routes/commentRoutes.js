const router = require("express").Router();
const commentController = require("../controllers/commentController");

router
  .route("/")
  .post(commentController.createComment)
  .get(commentController.getAllComments);

router
  .route("/:id")
  .get(commentController.getComment)
  .patch(commentController.updateComment)
  .delete(commentController.deleteComment);

module.exports = router;

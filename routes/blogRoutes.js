const router = require("express").Router();
const blogController = require("../controllers/blogController");

router
  .route("/")
  .post(blogController.createBlog)
  .get(blogController.getAllBlogs);

router
  .route("/:id")
  .get(blogController.getBlog)
  .patch(blogController.updateBlog)
  .delete(blogController.deleteBlog);

module.exports = router;

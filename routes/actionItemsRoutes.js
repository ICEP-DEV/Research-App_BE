const router = require('express').Router();
const actionItemsController = require('../controllers/actionItemsController');
const authController = require("../controllers/authController")
router
.route("/")
.get(authController.checkUser,actionItemsController.viewActionItems)
.post(authController.checkUser,actionItemsController.createActionItem)
router
   .route("/:id")
   
   .patch(actionItemsController.updateActionItem)
   .delete(actionItemsController.deleteActionItem)





module.exports = router;
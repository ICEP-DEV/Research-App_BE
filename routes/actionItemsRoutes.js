const router = require('express').Router();
const actionItemsController = require('../controllers/actionItemsController');

router
   .route("/:id")
   .get(actionItemsController.viewActionItems)
   .post(actionItemsController.createActionItem)
   .patch(actionItemsController.updateActionItem)
   .delete(actionItemsController.deleteActionItem)





module.exports = router;
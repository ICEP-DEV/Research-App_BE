const catchAsync = require("../utils/catchAsync");
const ActionItem = require("../models/actionItemsModel")

exports.createActionItem = catchAsync(async (req, res, next) => {
    req.body.userId = req.user.id;
      

    const actionItem = await ActionItem.create(req.body);


     if (!actionItem) return next(new Error("Document does not exist"));

    res.status(200).json({
        status: "success",
        message: "action-item successfully created.",
        actionItem
    })

})

exports.viewActionItems = catchAsync(async (req, res, next) => {

    const actionItems = await ActionItem.findAll({ where: { userId: req.user.id } })


    res.status(200).json({
        status: "success",
        message: "Welcome to actionItem endpoint😎",
        actionItems

    })
})

exports.updateActionItem = catchAsync(async (req, res, next) => {

    const { body } = req;

    const actionItem = await ActionItem.update(body, { where: { id: req.params.id } })

    res.status(200).json({
        status: "success",
        message: "action item successfully updated.",
        actionItem
    })
})

exports.deleteActionItem = catchAsync(async (req, res, next) => {

    const actionItem = await ActionItem.destroy(body, { where: { id: req.params.id } })

    if (!actionItem) return next(new Error("Document does not exist"));

    res.status(200).json({
        status: "success",
        message: "Action-item successfully deleted.",
        actionItem

    })

})
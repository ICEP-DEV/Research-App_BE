const Project = require("../models/projectModel");
const catchAsync = require("../utils/catchAsync");
const User = require("../models/userModel");
const ProjectStatus = require("../models/projectStatusModel");
const ProjectType = require("../models/projectTypeModel");

exports.createProject = catchAsync(async (req, res, next) => {
  //     try {
  //         const project =  await Project.create(req.body);
  //     } catch (err) {
  // let errors = {}
  // let message = '';
  //          if (err.errors) {
  //        errors = Object.values(err.errors).map((el) => el.message);
  //        message = `Invalid input data : ${errors.join(', ')}`;
  //          }

  //     return res.status(200).json({
  //         status: "fail",
  //         message

  //     })
  // }

  const project = await Project.create(req.body);

  res.status(200).json({
    status: "success",
    project,
  });
});

exports.getAllProjects = async (req, res, next) => {
  const projects = await Project.findAll({
    include: [
      {
        model: User,
        attributes: { exclude: ["updatedAt", "createdAt", "password"] },
      },
      {
        model: ProjectStatus,
        attributes: { exclude: ["updatedAt", "createdAt"] },
      },
      {
        model: ProjectType,
        attributes: { exclude: ["updatedAt", "createdAt"] },
      },
    ],
  });

  res.status(200).json({
    status: "success",
    message: "Hello from get all Project route 😜",
    results: projects.length,
    projects,
  });
};

exports.getProject = async (req, res, next) => {
  const project = await Project.findOne({
    where: { id: req.params.id },
  });

  if (!project) return next(new Error("Document does not exist"));

  res.status(200).json({
    status: "success",
    project,
  });
};


exports.getUserProjects = async (req, res, next) => {
  const projects = await Project.findAll({
    where: { userId: req.params.id },
    include: [
      {
        model: ProjectStatus,
        attributes: { exclude: ["updatedAt", "createdAt"] },
      },
      {
        model: ProjectType,
        attributes: { exclude: ["updatedAt", "createdAt"] },
      },
    ]
  });

  if (!projects) return next(new Error("Document GetUserProjects does not exist"));

  res.status(200).json({
    status: "success",
    projects,
  });
};


exports.updateProject = async (req, res, next) => {
  const { body } = req;

  const project = await Project.update(body, {
    where: { id: req.params.id },
  });

  if (!project[0]) return next(new Error("Document does not exist"));

  res.status(200).json({
    status: "success",
    message: "Project updated",
    project,
  });
};

exports.deleteProject = async (req, res, next) => {
  // const projects=0;
  const project = await Project.destroy({
    where: { id: req.params.id },
  });

  console.log(project);
  if (!project) return next(new Error("Document does not exist"));
  res.status(200).json({
    status: "success",
    message: "Project deleted",
    project,
  });
};

//1 REQUIRE PACKAGES
const express = require('express');
const morgan = require('morgan');
const globalErrHandler = require('./utils/errHandler')



const app = express();

//2 REQUIRE ROUTES
const userRoutes = require('./routes/userRoutes')
const projectRoutes = require("./routes/projectRoutes");
const guidelineRoutes = require('./routes/guidelineRoutes');
const disciplineRoutes = require('./routes/disciplineRoutes');
const facultyRoutes = require('./routes/facultyRoutes');
const projectTypeRoutes = require('./routes/projectTypeRoutes');
const projectStatusRoutes = require('./routes/projectStatusRoutes');
const linkController = require('./routes/linkController');
const commentRoutes = require('./routes/commentRoutes');
const blogRoutes = require('./routes/blogRoutes');
const notesRoutes = require('./routes/notesRoutes');



//3 APP.USE MIDDLEWARE

app.use(express.json());

//Testing application
// app.get('/',(req,res)=>{
//     res.status(200).json('hello there')
// })

//APP.USE ROUTES DECLARATION MIDDLEWARE
app.use('/api/v1/users', userRoutes);
app.use('/api/v1/projects', projectRoutes);
app.use('/api/v1/guidelines', guidelineRoutes);
app.use('/api/v1/faculties', facultyRoutes);
app.use('/api/v1/discipline', disciplineRoutes);
app.use('/api/v1/project_types', projectTypeRoutes);
app.use('/api/v1/project_statuses', projectStatusRoutes);
app.use('/api/v1/links', linkController);
app.use('/api/v1/comments', commentRoutes);
app.use('/api/v1/blogs', blogRoutes);
app.use('/api/v1/notes', notesRoutes);

app.use(globalErrHandler)
//4 SERVER
module.exports = app;

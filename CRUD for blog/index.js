const express = require('express');
const connection = require("./connection");
const productionRoute = require('./production')
const app = express();

app.use(express.urlencoded({extended: true}));
app.use(express.json());
app.use('/production', productionRoute);
module.exports = app;
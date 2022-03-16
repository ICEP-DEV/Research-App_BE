const cloudinary = require('cloudinary').v2;

cloudinary.config({ 
    cloud_name: 'dcjm162nn', 
    api_key: '594532251657385', 
    api_secret: 'k4ujBoWbEaT7sdETipSo1mmlpS0' 
  });

  module.exports = cloudinary;
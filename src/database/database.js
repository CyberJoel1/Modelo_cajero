const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('Cajero3'
, 'postgres'
, '18062014', {
    host: 'localhost',
    dialect: 'postgres'
  });
  
  module.exports={sequelize};
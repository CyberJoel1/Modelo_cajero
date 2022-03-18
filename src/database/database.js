const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('daoce6i88n8pda'
, 'etercqlrndounz'
, 'c4d61bf194bb4869f5b67c7c2086288c7532583e3907294343b60f25c046f373', {
    host: 'ec2-52-44-209-165.compute-1.amazonaws.com',
    dialect: 'postgres',
    dialectOptions: {
      ssl: {
        require: true,
        rejectUnauthorized: false
      }
    }
  });
  
  module.exports={sequelize};

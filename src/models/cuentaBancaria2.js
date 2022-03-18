/*
const { sequelize2 }= require('../database/database2');
const { Sequelize } = require('sequelize');
const cuentaBancaria2 = sequelize2.define('cuenta_bancaria',{
  id_cuentabancaria: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true // Automatically gets converted to SERIAL for postgres
  }
  ,
  id_cliente: {
    type: Sequelize.INTEGER,

  }
  ,
  tipo_cuentabancaria: {
    type: Sequelize.STRING,
  },
  fechacreacion_cuentabancaria: {
    type: Sequelize.DATE,
  }
  ,
  saldo_cuentabancaria: {
    type: Sequelize.DOUBLE,
  }
  
}, {
  timestamps: false,
  freezeTableName: true
});

  sequelize2.authenticate().then(() => {
    console.log('Connection has been established successfully!');
  }).catch((err) => {
    console.log('Can\'t establish database connection:\n' + err);
  });

module.exports={ cuentaBancaria2 }
*/
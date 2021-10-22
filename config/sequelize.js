require("dotenv").config();
const { Sequelize } = require('sequelize');


// Option 2: Passing parameters separately (other dialects)
const sequelize = new Sequelize(process.env.DBNAME, 'root', process.env.PASSWORD, {
    host: process.env.HOST,
    dialect: process.env.DRIVER,
    /* one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' */
    pool: {
        max: 10,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});


module.exports = sequelize
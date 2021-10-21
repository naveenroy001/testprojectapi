const { DataTypes } = require('sequelize');
const DB = require('../config/sequelize');

const City = DB.define('cities', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: DataTypes.STRING
    }
}, {
    timestamps: false,
})


module.exports = City;
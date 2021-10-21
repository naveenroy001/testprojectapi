const { DataTypes, Sequelize } = require('sequelize');
const DB = require('../config/sequelize');

const PasswordReset = DB.define('password_resets', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    token: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    created_at: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.fn('NOW'),
    }
}, {
    timestamps: false,
})


module.exports = PasswordReset;
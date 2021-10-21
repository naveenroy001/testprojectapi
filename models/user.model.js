const { DataTypes } = require('sequelize');
const DB = require('../config/sequelize');

const User = DB.define('users', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {
                    msg: "Name cannot be empty"
                },
            }
        },
        username: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true,
            validate: {
                notEmpty: {
                    msg: "Username cannot be empty"
                },
            }
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true,
            validate: {
                isEmail: {
                    msg: "Enter Valid Email Address"
                },
                notEmpty: {
                    msg: "Email cannot be empty"
                }
            }
        },
        password: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: true
            }
        },
        company_name: {
            type: DataTypes.STRING,
            allowNull: true
        },
        gst_no: {
            type: DataTypes.STRING,
            allowNull: true
        }

    }, {
        timestamps: true,
        underscored: true,


        scopes: {
            withoutPassword: {
                attributes: { exclude: ['password'] },
            }
        }
    },


)

module.exports = User;
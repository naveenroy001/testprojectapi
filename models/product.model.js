const { DataTypes } = require('sequelize');
const DB = require('../config/sequelize');
var User = require('./user.model');
var City = require('./city.model');

const Product = DB.define('products', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    product_name: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notEmpty: {
                msg: "Product Name cannot be empty"
            },
        }
    },
    user_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            notEmpty: {
                msg: "user id cannot be empty"
            },
        }
    },
    revenue: {
        type: DataTypes.DOUBLE,
        allowNull: false,
    },
    target_revenue: {
        type: DataTypes.DOUBLE,
        allowNull: false,
    },
    city_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
}, {
    timestamps: true,
    underscored: true,
})

Product.belongsTo(User, { foreignKey: 'user_id' });
Product.belongsTo(City, { foreignKey: 'city_id' });



module.exports = Product;
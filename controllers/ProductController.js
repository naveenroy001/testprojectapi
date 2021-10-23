const DB = require('../config/sequelize');
const { QueryTypes } = require('sequelize');
var Product = require('../models/product.model');
var User = require('../models/user.model');
var City = require('../models/city.model');


exports.findall = async function(req, res) {
    const products = await Product.findAll({
        include: [{
                model: User,
                required: true
            },
            {
                model: City,
                required: true
            }
        ]
    });
    if (products.length > 0 && products != null)
        res.status(200).send({ "status": true, "message": "Products fetched successfully", results: products })
    else {
        res.status(500).send({
            message: err.message || "Some error occurred while fetching users."
        });
    }
}

exports.getDashboardData = async function(req, res) {
    let userId = req.params.userId;
    let donut = await DB.query("SELECT product_name ,Sum(revenue) revenue FROM products WHERE user_id = " + userId + " GROUP BY product_name ORDER BY revenue DESC LIMIT 5", { type: QueryTypes.SELECT });
    let bargraph = await DB.query("SELECT p.product_name ,sum(p.revenue) actual_revenue,sum(p.target_revenue) target_revenue,c.name city_name FROM products p " +
        " JOIN cities c ON c.id = p.city_id WHERE user_id = " + userId + " GROUP BY p.product_name,c.name ORDER BY p.product_name", { type: QueryTypes.SELECT });
    let cities = await City.findAll();

    let results = {
        "donut": donut,
        "bargraph": bargraph,
        "cities": cities
    }
    if (results) {
        let result = {
            "status": true,
            "message": "Record fetched successfully",
            "result": results
        }
        res.send(result);
    }
    res.status(200).send({
        "status": false,
        "message": "Record not found",
    });
}

exports.dashboardBarChart = async function(req, res) {
    let userId = req.params.userId;
    let cityId = req.params.cityId;
    let bargraph = null;
    let donut = null;
    if (cityId == 0) {
        bargraph = await DB.query("SELECT p.product_name ,sum(p.revenue) actual_revenue,sum(p.target_revenue) target_revenue,c.name city_name FROM products p " +
            " JOIN cities c ON c.id = p.city_id WHERE user_id = " + userId + " GROUP BY p.product_name,c.name ORDER BY p.product_name", { type: QueryTypes.SELECT });

        donut = await DB.query("SELECT product_name ,Sum(revenue) revenue FROM products WHERE user_id = " + userId + " GROUP BY product_name ORDER BY revenue DESC LIMIT 5", { type: QueryTypes.SELECT });

    } else {
        bargraph = await DB.query("SELECT p.product_name ,sum(p.revenue) actual_revenue,sum(p.target_revenue) target_revenue,c.name city_name FROM products p " +
            " JOIN cities c ON c.id = p.city_id WHERE user_id = " + userId + "  and p.city_id = " + cityId + " GROUP BY p.product_name,c.name ORDER BY p.product_name", { type: QueryTypes.SELECT });

        donut = await DB.query("SELECT p.product_name ,Sum(p.revenue) revenue FROM products p JOIN cities c ON c.id = p.city_id WHERE p.user_id = " + userId + " and p.city_id = " + cityId + " GROUP BY p.product_name,c.name ORDER BY revenue DESC LIMIT 5", { type: QueryTypes.SELECT });
    }


    if (bargraph) {

        let results = {
            "donut": donut,
            "bargraph": bargraph,
        }

        let result = {
            "status": true,
            "message": "Record fetched successfully",
            "result": results
        }

        res.status(200).send(result);
    }
    res.status(200).send({
        "status": false,
        "message": "Record not found",
    });
}
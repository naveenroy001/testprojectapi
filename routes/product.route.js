var express = require('express');
var router = express.Router();
var productController = require('../controllers/ProductController');


/* GET users listing. */
router.get('/', productController.findall);
router.get('/dashboard/:userId', productController.getDashboardData);
router.get('/dashboard-barchart/:userId/city/:cityId', productController.dashboardBarChart);




module.exports = router;
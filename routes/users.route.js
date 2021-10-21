var express = require('express');
var router = express.Router();
var userController = require('../controllers/UserController');


/* GET users listing. */
router.get('/', userController.findall);

router.get('/checklogin', userController.checklogin);






module.exports = router;
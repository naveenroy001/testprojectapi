var express = require('express');
var router = express.Router();
var authController = require('../controllers/AuthController');

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { title: 'Express' });
});


router.post("/login", authController.login);
router.post("/register", authController.register);
router.post("/resetPasswordLink", authController.resetPasswordLink);
router.post("/resetPassword", authController.resetPassword);
router.get("/checkusername/:username", authController.checkUserName);

module.exports = router;
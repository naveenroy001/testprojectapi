require("dotenv").config();
const DB = require('../config/sequelize');
const { QueryTypes } = require('sequelize');
const User = require('../models/user.model');
const PasswordReset = require('../models/forgotPassword.model');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const emailer = require('../config/emailer');
const saltRounds = 10;


exports.checkUserName = async function(req, res) {
    let username = req.params.username;
    let userlist = await DB.query("SELECT id FROM users WHERE username = '" + username + "'", { type: QueryTypes.SELECT });
    console.log(userlist);
    if (userlist.length > 0) {
        res.status(200).send({ "status": false, "message": "username is already exists" });
    } else {
        res.status(200).send({ "status": true, "message": "username is available" });
    }

}



exports.register = function(req, res) {
    var plainpass = req.body.password;
    var password = bcrypt.hashSync(req.body.password, saltRounds);

    let user = {
        "name": req.body.name,
        "username": req.body.username,
        "email": req.body.email,
        "password": password,
        "company_name": req.body.company_name,
        "gst_no": req.body.gst_no
    }

    User.create(user).then((data) => {
            var token = jwt.sign({ id: data.id }, process.env.SECRET, {
                expiresIn: 86400 // expires in 24 hours
            });

            sendRegistrationMail(req.body.name, req.body.email, req.body.username, plainpass);

            let userDetails = {
                "name": user.name,
                "username": user.username,
                "email": user.email,
                "company_name": user.company_name,
                "gst_no": user.gst_no
            }

            res.status(200).send({ "status": true, "message": "User created successfully", "_token": token, "userDetails": userDetails });


        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while creating the user."
            });
        })

}

exports.login = async function(req, res) {
    const user = await User.findOne({ where: { username: req.body.username, is_active: 1 } });
    if (user != null) {
        console.log(user);
        var hashedPass = user.dataValues.password;
        var checkPass = bcrypt.compareSync(req.body.password, hashedPass);
        if (checkPass) {
            var token = jwt.sign({ id: user.dataValues.id }, process.env.SECRET, {
                expiresIn: 86400 // expires in 24 hours
            });
            const userDetail = await User.scope('withoutPassword').findOne({ where: { id: user.dataValues.id } });
            res.status(200).send({ "status": true, "message": "User Logged in successfully", "_token": token, "userDetails": userDetail });
        } else {
            res.status(401).send({ "status": false, "message": "Invalid username or password" });
        }
    } else {
        res.status(401).send({ "status": false, "message": "Invalid username or password" })
    }
}


exports.resetPasswordLink = async function(req, res) {

    var emailAddress = req.body.email;
    const user = await User.findOne({ where: { "email": emailAddress } });

    if (user != null) {
        let reset = {
            "email": emailAddress,
            "token": genrateRandomString(100)
        }

        PasswordReset.create(reset).then((data) => {
                sentPasswordResetMail(data.email, data.token);
                res.send({ "status": true, "message": "A password reset link has been sent to your email" });
            })
            .catch((err) => {
                res.status(500).send({
                    message: err.message || "Some error occurred while initiating password Reset"
                });
            })
    } else {
        res.status(200).send({ "status": false, "message": "We haven't found your account details" });
    }

}

exports.resetPassword = async function(req, res) {

    var emailAdd = req.body.email;
    var reset_token = req.body.token;
    var resetRecord = await DB.query("SELECT * From password_resets WHERE email = :email and token = :token and DATE(created_at) = CURDATE() ", {
        replacements: { email: emailAdd, token: reset_token },
        type: QueryTypes.SELECT
    })



    if (resetRecord.length > 0) {
        var newPassword = bcrypt.hashSync(req.body.password, saltRounds);
        User.update({ password: newPassword }, { where: { email: emailAdd } }).then(() => {
            res.status(200).send({ "status": true, "message": "Your password has been changed successfully" });
        }).catch((err) => {
            res.status(500).send({
                message: err.message || "Some error occurred while reset password"
            });
        })
    } else {
        res.status(200).send({ "status": false, "message": "Password reset session has been expired or invalid" });
    }


}


function sendRegistrationMail(name, email, username, password) {
    var message = "Hi " + name + ", <br><br> Your account has been created successfully;<br><br>Username : " + username + "<br>Password : " + password + "<br><br>Thank You";
    var mailOptions = {
        from: 'naveenroy001@gmail.com',
        to: email,
        subject: 'Test Project | Registration Successful',
        html: message
    };
    emailer.sendMail(mailOptions);
}


function sentPasswordResetMail(email, token) {
    var appUrl = process.env.APP_URL;
    var message = '<h3><b>Hello!</b></h3>You are receiving this email because we received a password reset request for your account.<br><br><a href="' + appUrl + '/password/reset/' + token + '">Reset Password</a><br><br>This password reset link will expire at 12 AM.'
    var mailOptions = {
        from: 'naveenroy001@gmail.com',
        to: email,
        subject: 'Test Project | Reset Password Notification',
        html: message
    };
    emailer.sendMail(mailOptions);
}

function genrateRandomString(len) {
    const rnd = (len, chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') => [...Array(len)].map(() => chars.charAt(Math.floor(Math.random() * chars.length))).join('')
    return rnd(len);
}
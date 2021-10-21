require("dotenv").config();
var jwt = require('jsonwebtoken');

function verifyToken(req, res, next) {
    var token = req.headers['authorization'];
    realtoken = "";
    if (!token)
        return res.status(403).send({ status: false, message: 'Unauthorized access' });
    else {
        if (token.split(" ")[0] === "Bearer") realtoken = token.split(" ")[1];
        else {
            return res.status(500).send({ status: false, message: 'Failed to authenticate token.' });
        }
    }

    jwt.verify(realtoken, process.env.SECRET, function(err, decoded) {
        if (err) return res.status(500).send({ status: false, message: 'Failed to authenticate token.' });

        // if everything good, save to request for use in other routes
        req.userId = decoded.id;
        next();
    });
}

module.exports = verifyToken;
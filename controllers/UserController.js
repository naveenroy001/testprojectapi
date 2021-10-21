var User = require('../models/user.model');

exports.findall = async function(req, res) {

    const users = await User.scope('withoutPassword').findAll({ where: { is_active: 1 } });
    if (users.length > 0 && users != null)
        res.status(200).send({ "status": true, "message": "users fetched successfully", results: users })
    else {
        res.status(500).send({
            message: err.message || "Some error occurred while fetching users."
        });
    }
}

exports.checklogin = function(req, res) {
    res.status(200).send({ "status": true, "message": "users checked successfully" })
}
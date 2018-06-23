var express = require('express');

var router = express.Router();

router.get('/login', (req, res) => {
    res.render('account/login', {layout: 'main.hbs'});
})

router.get('/register', (req, res) => {
    res.render('account/register', {layout: 'main.hbs'});
})

module.exports = router;
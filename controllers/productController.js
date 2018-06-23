var express = require('express'),
    productRepos = require('../repos/productRepos');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('product/detail', {layout: 'main.hbs'});
});

module.exports = router;
var express = require('express'),
    productRepos = require('../repos/productRepos');

var router = express.Router();

router.get('/', (req, res) => {
    productRepos.loadAll().then(rows => {
        var vm = {
            products: rows
        };
        res.render('product/byCat', vm);
    });
});

module.exports = router;
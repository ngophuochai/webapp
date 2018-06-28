var express = require('express');

var productRepos = require('../repos/productRepos');

var router = express.Router();

router.get('/', (req, res) => {
    var p1 = productRepos.loadDayLimit(10);
    var p2 = productRepos.loadQuantitySoldLimit(10);
    var p3 = productRepos.loadViewsLimit(10);

    Promise.all([p1, p2, p3]).then(([rows1, rows2, rows3]) => {
        var vm = {
            productsDay: rows1,
            productsQuantitySold: rows2, 
            productsViews: rows3,
        }
        res.render('home/index', vm);
    })
})

module.exports = router;
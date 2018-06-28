var express = require('express'),
    productRepos = require('../repos/productRepos'),
    categoryRepos = require('../repos/categoryRepos'),
    producerRepos = require('../repos/producerRepos');

var router = express.Router();

router.get('/detail/:proID', (req, res) => {
    var proID = req.params.proID;
    if (isNaN(proID)) {
        res.statusCode = 404;
        res.render('error/index');
    } else {
        productRepos.single(proID).then(rows => {
            if (rows.length > 0) {
                var p = rows[0];
                var p1 = productRepos.loadLikeCategory(rows[0].Category, 5);
                var p2 = productRepos.loadLikeProducer(rows[0].Producer, 5);
                Promise.all([p, p1, p2]).then(([rows1, rows2, rows3]) => {
                    var vm = {
                        product: rows1,
                        productsCat5: rows2,
                        productsPer5: rows3
                    }
                    res.render('product/detail', vm);
                })
            }
            else {
                res.statusCode = 404;
                res.render('error/index');
            }
        })
    }
});

router.get('/category/:catID', (req, res) => {
    var catID = req.params.catID;

    var page = req.query.page;
    if (!page) page = 1;
    if (page < 1) page = 1;

    var offset = (page - 1) * 6;

    var p1 = productRepos.loadPageCat(catID, offset);
    var p2 = productRepos.countCat(catID);
    var c = categoryRepos.single(catID);

    Promise.all([p1, p2, c]).then(([rows, count_rows, rows_c]) => {
        var total = count_rows[0].total;
        var nPages = total / 6;
        if (total % 6 > 0)
            nPages++;

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurrentPage: i === +page,
            });
        }

        var pageLeft = +page - 1;
        var pageRight = +page + 1;

        if (pageLeft < 1) pageLeft = 1;
        if (pageRight > nPages) pageRight = page;

        var vm = {
            products: rows,
            noProducts: rows.length === 0,
            page_numbers: numbers,
            valueLeft: pageLeft,
            valueRight: pageRight,
            category: rows_c[0],
        };
        res.render('product/category', vm);
    })
})

router.get('/producer/:perID', (req, res) => {
    var perID = req.params.perID;

    var page = req.query.page;
    if (!page) page = 1;
    if (page < 1) page = 1;

    var offset = (page - 1) * 6;

    var p1 = productRepos.loadPagePer(perID, offset);
    var p2 = productRepos.countPer(perID);
    var p = producerRepos.single(perID);

    Promise.all([p1, p2, p]).then(([rows, count_rows, rows_p]) => {
        var total = count_rows[0].total;
        var nPages = total / 6;
        if (total % 6 > 0)
            nPages++;

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurrentPage: i === +page,
            });
        }

        var pageLeft = +page - 1;
        var pageRight = +page + 1;

        if (pageLeft < 1) pageLeft = 1;
        if (pageRight > nPages) pageRight = page;

        var vm = {
            products: rows,
            noProducts: rows.length === 0,
            page_numbers: numbers,
            valueLeft: pageLeft,
            valueRight: pageRight,
            producer: rows_p[0]
        };
        res.render('product/producer', vm);
    })
})


module.exports = router;
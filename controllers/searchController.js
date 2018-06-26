var express = require('express'),
    productRepos = require('../repos/productRepos'),
    categoryRepos = require('../repos/categoryRepos'),
    producerRepos = require('../repos/producerRepos');

var router = express.Router();

router.get('/', (req, res) => {
    var pro = {
        name: req.query.name,
        catID: req.query.category,
        perID: req.query.producer
    }

    var page = req.query.page;
    if (!page) page = 1;
    if (page < 1) page = 1;

    var offset = (page - 1) * 8;

    var p1 = productRepos.loadPageSearch(pro, offset);
    var p2 = productRepos.countSearch(pro);
    var c = categoryRepos.loadAll();
    var p = producerRepos.loadAll();

    Promise.all([p1, p2, c, p]).then(([rows, count_rows, rows_c, rows_p]) => {
        var total = count_rows[0].total;
        var nPages = total / 8;
        if (total % 8 > 0)
            nPages++;

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurrentPage: i === +page,
                product: pro,
            });
        }

        var cats = [];
        for (i = 0; i < rows_c.length; i++) {
            cats.push({
                value: rows_c[i],
                isSelected: +rows_c[i].ID === +pro.catID,
            })
        }

        var pers = [];
        for (i = 0; i < rows_p.length; i++) {
            pers.push({
                value: rows_p[i],
                isSelected: +rows_p[i].ID === +pro.perID,
            })
        }

        var pageLeft = +page - 1;
        var pageRight = +page + 1;

        if (pageLeft < 1) pageLeft = 1;
        if (pageRight > nPages) pageRight = page;

        var vm = {
            product: pro,
            products: rows,
            noProducts: rows.length === 0,
            page_numbers: numbers,
            valueLeft: pageLeft,
            valueRight: pageRight,
            categories: cats,
            producers: pers,
        };
        res.render('search/index', vm);
    })
})

module.exports = router;
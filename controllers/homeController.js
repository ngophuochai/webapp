var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('main/index', {layout: 'main.hbs'});
})

router.get('/login', (req, res) => {
    res.render('main/login', {layout: 'main.hbs'});
})

router.get('/product', (req, res) => {
    res.render('main/product', {layout: 'main.hbs'});
})

router.get('/register', (req, res) => {
    res.render('main/register', {layout: 'main.hbs'});
})

router.get('/search', (req, res) => {
    res.render('main/search', {layout: 'main.hbs'});
})

router.get('/store', (req, res) => {
    res.render('main/store', {layout: 'main.hbs'});
})

module.exports = router;
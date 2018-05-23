var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('admin/index', {layout: 'admin.hbs'});
})

router.get('/addProduct', (req, res) => {
    res.render('admin/addProduct', {layout: 'admin.hbs'});
})

router.get('/editProduct', (req, res) => {
    res.render('admin/editProduct', {layout: 'admin.hbs'});
})

router.get('/manageOrder', (req, res) => {
    res.render('admin/manageOrder', {layout: 'admin.hbs'});
})

router.get('/manageProducer', (req, res) => {
    res.render('admin/manageProducer', {layout: 'admin.hbs'});
})

router.get('/manageProduct', (req, res) => {
    res.render('admin/manageProduct', {layout: 'admin.hbs'});
})

router.get('/manageType', (req, res) => {
    res.render('admin/manageType', {layout: 'admin.hbs'});
})

module.exports = router;
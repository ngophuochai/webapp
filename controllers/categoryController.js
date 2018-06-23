var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('category/index', {layout: 'main.hbs'});
})

module.exports = router;
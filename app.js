var express = require('express');
var exphbs = require('express-handlebars');
var exphbs_section = require('express-handlebars-sections');
var bodyParser = require('body-parser');
var path = require('path');

var handleLayoutMDW = require('./middle-wares/handleLayout');
var handle404MDW = require('./middle-wares/handle404');

var homeController = require('./controllers/homeController');
var productController = require('./controllers/productController');
var accountController = require('./controllers/accountController');

var app = express();

app.engine('hbs', exphbs({
    defaultLayout: 'main.hbs',
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: exphbs_section()
    }
}));

app.set('view engine', 'hbs');

app.use(express.static(
	path.resolve(__dirname, 'public')
));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(handleLayoutMDW);

app.get('/', (req, res) => {
    res.redirect('/home');s
});

app.use('/home', homeController);
app.use('/home/product', productController);
app.use('/home/account', accountController);

app.use(handle404MDW);

app.listen(3000, () => {
    console.log('server running on port 3000');
});
var express = require('express');
var exphbs = require('express-handlebars');
var exphbs_section = require('express-handlebars-sections');
var bodyParser = require('body-parser');
var path = require('path');

var handleLayoutMDW = require('./middle-wares/handleLayout');

var homeController = require('./controllers/homeController');
var userController = require('./controllers/userController');
var adminController = require('./controllers/adminController');
var productController = require('./controllers/productController');

var app = express();

app.engine('hbs', exphbs({
    defaultLayout: 'main',
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
    res.redirect('/home');
});

app.use('/home', homeController);
app.use('/user', userController);
app.use('/admin', adminController);
app.use('/product', productController);

app.listen(3000, () => {
    console.log('server running on port 3000');
});
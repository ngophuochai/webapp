var db = require('../fn/db');

exports.getNumberOfItems = cart => {
    if (!cart) {
        return -1;
    }
    var n = 0;
    for (var i = cart.length - 1; i >= 0; i--) {
        n += cart[i].quantity;
    }
    return n;
}

exports.add = (cart, item) => {
    for (var i = cart.length - 1; i >= 0; i--) {
        if (cart[i].product.ID === item.product.ID) {
            cart[i].quantity += item.quantity;
            cart[i].amount = item.product.Price * cart[i].quantity
            return;
        }
    }
    cart.push(item);
}

exports.update = (cart, item) => {
    for (var i = cart.length - 1; i >= 0; i--) {
        if (cart[i].product.ID === item.product.ID) {
            cart[i].quantity = item.quantity;
            cart[i].amount = item.product.Price * cart[i].quantity
            return;
        }
    }
    return
}

exports.remove = (cart, item) => {
    items = [];
    for (var i = cart.length - 1; i >= 0; i--) {
        if (cart[i].product.ID === item.product.ID) {
            cart.pop();
            for (var j = items.length - 1; j >= 0; j--) {
                cart.push(items.pop());
            }
            return;
        }
        items.push(cart.pop());
    }
    return
}

exports.loadAll = (username) => {
    var sql = `select * from cart c, products p where c.ProID = p.ID and c.username = '${username}' order by CheckoutDay DESC`;
    return db.load(sql);
}

exports.checkout = (username, cItems, address, i) => {
    var sql = `insert into cart(username, ProID, ProQuantity, Address, CheckoutDay, Status) values('${username}', '${cItems[i].ProID}', '${cItems[i].ProQuantity}', '${address}', current_time, 'Đã giao')`;
    return db.save(sql);
}

exports.single = (id) => {
    var sql = `select * from cart c, products p where c.ProID = p.ID and c.ID = '${id}'`;
    return db.load(sql);
}
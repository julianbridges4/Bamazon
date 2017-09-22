var mysql = require("mysql");
var inquirer = require("inquirer");
var table = require("console.table");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "root",
    database: "bamazon_db"
});

connection.connect(function(err) {
    if (err) throw err;
    start();
});

function start() {
    connection.query("SELECT * FROM products;", function(err, results) {
        if (err) throw err;
        console.table(results);
        question();
    });
}

function question() {
    inquirer
        .prompt([{
            name: "id",
            type: "input",
            message: "What is the ID of the item you want to buy?"
        }, {
            name: "quantity",
            type: "input",
            message: "What amount of this item would you like to buy?",
            validate: function(value) {
                if (isNaN(value) === false) {
                    return true;
                }
                return false;
            }
        }]).then(function(answer) {
            connection.query(`SELECT stock_quantity FROM products WHERE item_id = ${answer.id};`, function(error, results, field) {
                if (error) throw error;
                if (results[0].stock_quantity >= answer.quantity) {
                    connection.query(`UPDATE products SET stock_quantity = stock_quantity - ${answer.quantity} WHERE item_id = ${answer.id};`, function(error, results, field) {
                        if (error) throw error;
                        console.log("Purchase successful!");
                        totalCost(answer);
                        start();
                    });
                } else {
                	console.log("There are not enough items to make that transation!")
                	start();
                }
            });
        });
}

function totalCost(answer) {
    connection.query(`SELECT price FROM products WHERE item_id = ${answer.id};`, function(error, results, field) {
        var cost = results[0].price * answer.quantity
        console.log(`You spent ${cost.toFixed(2)}`);
    });
}
const http = require('http');
const https = require('https');
const express = require('express');
const app = express();
const useragent = require('express-useragent');
const ejs = require('ejs');
const mysql = require('mysql') //npm install mysql
var source = "mysql://root:@127.0.0.1/db_gggame?connectionLimit=50"
var pool = mysql.createPool(source)
var cors = require('cors');

app.engine("html", ejs.renderFile);
app.use(useragent.express());
app.listen(4000);

//http://localhost:4000/list_users
app.get("/list_admins",list_Admins)
function list_Admins(require,response){
    pool.query("SELECT * FROM admin WHERE status='Y' ORDER BY username ASC", function display(error,data){
        console.log(error)
        var head = {}
        var body = data
        head["Content-Type"] = "application/json"
        response.writeHead(200,head)
        response.write(JSON.stringify(body))
        response.end()
    })
}

//http://localhost:4000/list_agents
app.get("/list_agents",list_Admins)
function list_Admins(require,response){
    pool.query("SELECT * FROM agent WHERE status='Y' ORDER BY website_name ASC", function display(error,data){
        console.log(error)
        var head = {}
        var body = data
        head["Content-Type"] = "application/json"
        response.writeHead(200,head)
        response.write(JSON.stringify(body))
        response.end()
    })
}

//http://localhost:4000/list_users
app.get("/list_users",list_Users)
function list_Users(require,response){
    pool.query("SELECT * FROM member WHERE status='Y' ORDER BY user_code ASC", function display(error,data){
        console.log(error)
        var head = {}
        var body = data
        head["Content-Type"] = "application/json"
        response.writeHead(200,head)
        response.write(JSON.stringify(body))
        response.end()
    })
}




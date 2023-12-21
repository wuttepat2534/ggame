const http = require('http');
const https = require('https');
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const useragent = require('express-useragent');
const ejs = require('ejs');
const mysql = require('mysql2') //npm install mysql2
const axios = require('axios'); //npm install axios
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const md5 = require('md5');
const postsRoutes = require('./routes/posts')
const os = require('os');
const auth = require('./middleware/auth');
const sdk = require('api')('@thaibulksms/v1.0#1of51jl4qvzac3');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const logEdit = require('./controllers/logEditAll');
const FInance = require('./controllers/Finance');
//const promotion = require('./controllers/promotiontoonta')
var cors = require('cors');
const cron = require('node-cron');
const moment = require('moment-timezone')
// const fs = require('fs');
// const path = require('path');
// const FormData = require('form-data');
const server = app.listen(5000, () => console.log(`Listening on port... ${5000}`));
const socket = require('./socket');
const io = socket.init(server);

require('dotenv').config()
app.engine("html", ejs.renderFile);
app.use(useragent.express());
app.use(cors());
app.use(bodyParser.json());
app.use('/post', postsRoutes);
app.use(express.static('public'));

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

app.use(bodyParser.urlencoded({ extended: false }));

//http://localhost:5000/testApi
app.get('/testApi', async (require, response) => {
    response.send({
        message: 'AllIDAgent',
    });
    response.end();
});
//http://localhost:5000/list_idAgent
app.get('/list_idAgent', async (require, response) => {
    let sql = `SELECT * FROM member WHERE status_delete='N'`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        response.send({
            data: results
        });
        response.end();
    });
});

//http://localhost:5000/list_admins
app.post('/list_admins', auth, async (require, response) => {
    const searchKeyword = require.body.name;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    if (searchKeyword === '') {
        let sql = `SELECT id, name, username, status, contact_number FROM admin WHERE status_delete='N' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM admin WHERE status_delete='N' `
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'adminNOSearch',
                    data: results,
                    total: res[0].count
                });

                response.end();
            });
        });
    } else {
        let sql = `SELECT id, name, username, status, contact_number  FROM admin WHERE status_delete='N' AND 
        username LIKE '%${searchKeyword}%' OR name LIKE '%${searchKeyword}%' OR id LIKE '%${searchKeyword}%' OR contact_number LIKE '%${searchKeyword}%'
        LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'adminSearch',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
});


//http://localhost:5000/list_admin/1
app.get('/list_admin/:admin_id', (require, response) => {
    let admin_id = require.params.admin_id;
    let sql = `SELECT id, name, username, status FROM admin WHERE id='${admin_id}' AND status_delete='N' ORDER BY username ASC`;
    connection.query(sql, (error, results) => {

        if (error) { console.log(error) }
        response.send({
            message: "admin select",
            data: results
        });

        response.end();
    });
});

//http://localhost:5000/list_agents
app.post('/list_agents', auth, (require, response) => {
    const searchKeyword = require.body.name;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    if (searchKeyword === '') {
        let sql = `SELECT id, name, username, status, contact_number, credit FROM agent WHERE status_delete='N' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM agent WHERE status_delete='N'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'agentNoSearch',
                    data: results,
                    total: res[0].count
                });

                response.end();
            });
        });
    } else {
        let sql = `SELECT id, name, username, status, contact_number, credit FROM agent WHERE status_delete='N' AND 
        username LIKE '%${searchKeyword}%' OR name LIKE '%${searchKeyword}%' OR id LIKE '%${searchKeyword}%' OR contact_number LIKE '%${searchKeyword}%'
        LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'agent_Search',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
});

//http://localhost:5000/list_agent/1
app.get('/list_agent/:agent_id', (require, response) => {
    let agent_id = require.params.agent_id;
    let sql = `SELECT id, name, username, contact_number, credit, status FROM agent WHERE id='${agent_id}' AND status_delete='N' 
    ORDER BY username ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        response.send({
            message: "agent select",
            data: results
        });

        response.end();
    });
});

//http://localhost:5000/list_users/agent/1
app.get('/list_users/agent/:agent_id', (require, response) => {
    let agent_id = require.params.agent_id;
    let sql = `SELECT id, member_code, name, username, credit, status FROM member WHERE agent_id='${agent_id}' AND status_delete='N' 
    ORDER BY member_code ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: 'agent member all',
            data: results
        });

        response.end();
    });
});

//http://localhost:5000/list_users
app.post('/list_users', (require, response) => {
    console.log('pop');
    const searchKeyword = require.body.searchKeyword;
    const agent_id = require.body.agent_id;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    if (searchKeyword === "") {
        let sql = `SELECT * FROM member WHERE agent_id = '${agent_id}' AND status_delete='N' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM member WHERE status_delete='N'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    response.send({
                        message: 'memberSearchAll',
                        data: results,
                        total: res[0].count
                    });

                    response.end();
                });
            }
        });
    } else {
        let sql = `SELECT * FROM member WHERE agent_id = '${agent_id}' AND status_delete='N' 
        AND username LIKE '%${searchKeyword}%' OR accountName LIKE '%${searchKeyword}%' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'memberSearch',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
});

// http://localhost:5000/list_user/1
app.get('/list_user/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    let sql = `SELECT * FROM member WHERE id='${user_id}' AND status_delete='N' 
    ORDER BY member_code ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        response.send({
            message: 'member id',
            data: results
        });
        response.end();
    });
});

http://localhost:5000/list_user/1
app.get('/list_userWeb/:user_phone', (require, response) => {
    let user_phone = require.params.user_phone;
    let sql = `SELECT id, accountNumber, accountName FROM member WHERE username ='${user_phone}' AND status_delete='N'`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        response.send({
            message: 'member id',
            data: results
        });
        response.end();
    });
});

http://localhost:5000/list_userGame/1 
app.get('/list_userGame/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    let sql = `SELECT username, credit, bet_latest FROM member WHERE id='${user_id}' AND status_delete='N' 
    ORDER BY member_code ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        console.log(results);
        response.json(results[0]);
    });
});

app.post('/user/add', (require, response) => {
    let member_code = require.member_code;
    let name = require.name;
    let username = require.username;
    let password = require.password;
    let sql = `SELECT id, member_code, name, username, credit, status FROM member WHERE id='${user_id}' AND status_delete='N' 
    ORDER BY member_code ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        response.send({
            message: "member select",
            data: results
        });

        response.end();
    });
});

http://localhost:5000/games
app.get('/games', (require, response) => {
    let sql = `SELECT id, game_name, image, status FROM game WHERE status_delete='N' ORDER BY game_name ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: 'game all',
            data: results
        });

        response.end();
    });
});

http://localhost:5000/game/1
app.get('/game/:game_id', (require, response) => {
    let game_id = require.params.game_id;
    let sql = `SELECT id, game_name, image, status FROM game WHERE id='${game_id}' AND status_delete='N' ORDER BY game_name ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: 'game select',
            data: results
        });

        response.end();
    });
});

http://localhost:5000/user_play/user/1
app.get('/user_play/user/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    let sql = `SELECT user_play.id AS play_id, member.id AS member_id, member.member_code AS member_code, member.name AS name, member.credit AS credit, 
    user_play.bet AS bet, user_play.win AS win, user_play.tiles AS tiles, winline AS winline FROM user_play, member 
    WHERE user_play.member_id=member.id AND member.id='${user_id}' AND member.status='Y' ORDER BY user_play.id DESC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        response.send({
            message: "member play",
            data: results
        });

        response.end();
    });
});

http://localhost:5000/user_play/user_lay/1
app.post('/user_play/user_lay/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    let sql = `SELECT id, member_id, game_id, bet, credit, win, winline, created_at FROM user_play
    WHERE member_id = '${user_id}' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, (error, results) => {
        const dataLog = results;
        if (error) { console.log(error) }
        const totalCount = `SELECT COUNT(*) as count FROM user_play WHERE member_id = '${user_id}'`
        connection.query(totalCount, (error, res) => {
            if (error) { console.log(error); }
            response.send({
                message: 'user_playSearch',
                data: dataLog,
                total: res[0].count
            });

            response.end();
        });
    });
});

http://localhost:5000/login/admin  Login Admin
app.post('/login/admin', async (require, response, next) => {
    let username = require.body.username;
    let password = require.body.password;

    let sql = `SELECT * FROM admin WHERE username='${username}' AND status_delete='N' ORDER BY username ASC`;
    connection.query(sql, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1) {
                const error = new Error('A user with this email could not be found.');
                error.statusCode = 401;
                throw error;
            }
            const storedUser = data[0];
            const passwordMatches = await bcrypt.compare(password, storedUser.password);

            if (!passwordMatches) {
                const error = new Error('Wrong password!');
                error.statusCode = 401;
                throw error;
            }

            const token = jwt.sign(
                {
                    username: storedUser.username,
                    userId: storedUser.id,
                    name: storedUser.name
                },
                'secretfortoken',
                { expiresIn: '2h' }
            );
            response.status(201).json({ token: token, data: storedUser });
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });

});

http://localhost:5000/login/agent  Login Agent
app.post('/login/agent', async (require, response, next) => {
    let username = require.body.username;
    let password = require.body.password;
    let agent_id = require.body.agent_id
    let sql = `SELECT * FROM agent WHERE username ='${username}' AND agent_id = '${agent_id}' AND status_delete='N' ORDER BY username ASC`;
    connection.query(sql, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1) {
                const responseEnployee = await axios.post("https://dogzilla.live/post/loginEnployee", {
                    username: username,
                    password: password,
                    agent_id: agent_id,
                });
                //console.log(responseEnployee.data);
                if (responseEnployee.data.message === 'OkLogin') {
                    response.status(201).json({ token: responseEnployee.data.token, data: responseEnployee.data.data });
                } else {
                    const error = new Error('notData');
                    error.statusCode = 401;
                    throw error;
                }
            } else {
                const storedUser = data[0];
                const hashedPassword = md5(password)
                //const passwordMatches = await bcrypt.compare(password, storedUser.password);
                if (hashedPassword !== storedUser.password) {
                    const error = new Error('Wrong password!');
                    error.statusCode = 401;
                    throw error;
                }
                const token = jwt.sign(
                    {
                        username: storedUser.username,
                        userId: storedUser.id,
                        name: storedUser.name,
                        type: 'agent'
                    },
                    'secretfortoken',
                    { expiresIn: '5h' }
                );
                let update = `UPDATE agent set tokenlogin = '${token}' WHERE username = '${username}' AND agent_id = '${agent_id}' `;
                connection.query(update, async (error, results) => {
                    if (error) { console.log(error) }
                    else {
                        response.status(201).json({ token: token, data: storedUser });
                    }
                })
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });

});

http://localhost:5000/login/member  Login Member
app.post('/login/member', async (require, response, next) => {
    let phoneNumber = require.body.phoneNumber;
    let password = require.body.password;
    let agent_id = require.body.agent_id;
    //start check ip address
    const networkInterfaces = os.networkInterfaces();
    const ipAddress = Object.keys(networkInterfaces).reduce((acc, interfaceName) => {
        const interfaceInfo = networkInterfaces[interfaceName];
        const ipv4Info = interfaceInfo.find(info => info.family === 'IPv4' && !info.internal);
        if (ipv4Info) {
            acc = ipv4Info.address;
        }
        return acc;
    }, '');
    const userAgent = require.headers['user-agent'];
    let browser;
    if (userAgent.includes('Chrome')) {
        browser = 'Google Chrome';
    } else if (userAgent.indexOf('Firefox') > -1) {
        browser = 'Mozilla Firefox';
    } else if (userAgent.indexOf('Safari') > -1) {
        browser = 'Apple Safari';
    } else if (userAgent.indexOf('Opera') > -1) {
        browser = 'Opera';
    } else if (userAgent.indexOf('Edg') > -1) {
        browser = 'Microsoft Edge';
    } else if (userAgent.indexOf('Trident') > -1) {
        browser = 'Microsoft Internet Explorer';
    }
    else {
        browser = 'Google Chrome';
    }

    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');

    let sql = `SELECT id, credit, name, password, phonenumber FROM member WHERE phonenumber='${phoneNumber}' AND status_delete='N' AND agent_id = '${agent_id}'`;
    connection.query(sql, async (error, results) => {
        try {
            let update = `UPDATE member set ip_address = '${ipAddress}', browserlogin = '${browser}', updated_at = '${formattedDate}'
             WHERE id='${results[0].id}' AND agent_id = '${agent_id}' `;
            connection.query(update, async (error, results) => {
                if (error) { console.log(error) }
            })
            const data = results;
            if (data.length !== 1) {
                const error = new Error('A user with this email could not be found.');
                error.statusCode = 401;
                throw error;
            }
            const storedUser = data[0];

            const hashedPassword = md5(password)
            if (hashedPassword !== storedUser.password) {
                return response.status(401).json({ message: 'Incorrect password' });
            }
            const token = jwt.sign(
                {
                    id: storedUser.id,
                    credit: storedUser.credit,
                    passwordCode: hashedPassword,
                    phonenumber: storedUser.phonenumber,
                    type: 'member',
                },
                'secretfortoken',
                { expiresIn: '24h' }
            );
            response.status(201).json({ token: token });
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });

});

http://localhost:5000/signup  Add Admin
app.post('/signup', async (req, res, next) => {
    const name = req.body.name; //รับDataจากForm
    const username = req.body.username; //รับDataจากForm
    const password = req.body.password; //รับDataจากForm
    const contact_number = req.body.contact_number
    let sql_check = `SELECT * FROM admin WHERE username='${username}' ORDER BY username ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1) {
                const hashedPassword = await bcrypt.hash(password, 12);
                const userDetails = {
                    name: name,
                    username: username,
                    password: hashedPassword,
                };
                let sql = `INSERT INTO admin (name, username, password, contact_number, created_at, updated_at)
            value ('${userDetails.name}','${userDetails.username}','${userDetails.password}','${contact_number}',now(), now())`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    res.send({
                        message: "Data created Success"
                    });
                    res.end();
                });
            }
            else {
                res.send({
                    message: "Data Creates False"
                });
                res.end();
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
});

http://localhost:5000/signupAgent Add Agent
app.post('/signupAgent', async (req, res, next) => {
    const name = req.body.name; //รับDataจากForm
    const username = req.body.username; //รับDataจากForm
    const password = req.body.password; //รับDataจากForm
    const contact_number = req.body.contact_number
    const credit = req.body.credit;

    let sql_check = `SELECT * FROM agent WHERE username='${username}' ORDER BY username ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1) {
                const hashedPassword = await bcrypt.hash(password, 12);
                const userDetails = {
                    name: name,
                    username: username,
                    password: hashedPassword,
                };
                let sql = `INSERT INTO agent (name, username, password, contact_number, credit, created_at, updated_at) 
            value ('${userDetails.name}','${userDetails.username}','${userDetails.password}','${contact_number}','${credit}',now(), now())`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    res.send({
                        message: "Data created Success"
                    });
                    res.end();
                });
            }
            else {
                res.send({
                    message: "Data Creates False"
                });
                res.end();
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
});

http://localhost:5000/signupMember Add Member
app.post('/signupMember', async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const member_code = req.body.member_code;
    const username = req.body.username;
    const password = req.body.password;
    const credit = req.body.credit;
    const firstName = req.body.firstName;
    const lastName = req.body.lastName;
    const customerGroup = req.body.customerGroup;
    const Rank = req.body.Rank;
    const contact_number = req.body.contact_number;
    const IDLIne = req.body.IDLIne;
    const note = req.body.note;
    const currency = req.body.currency;
    const bank = req.body.bank;
    const accountName = req.body.accountName;
    const accountNumber = req.body.accountNumber;
    const listCheckBox = req.body.listCheckBox.checkbox;
    const nametpyecreate = req.body.nametpyecreate;
    const tpyeCreate = req.body.tpyeCreate;
    //const checkboxListv2 = req.body.checkboxListv2;

    let statuScheck = 'Y';
    if (listCheckBox[0] === 'เปิดใช้งาน') {
        statuScheck = 'Y'
    } else {
        statuScheck = 'N'
    }
    const hashedPassword = md5(password);
    let sql_check = `SELECT * FROM member WHERE username='${username}' OR accountNumber='${accountNumber}' AND agent_id='${agent_id}'`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length === 0 && data.length < 1) {

                let sql = `INSERT INTO member (agent_id, username_agent, member_code, name, username, password, credit, created_at, updated_at, customerGroup, userrank, lineid, status,
                    note, currency, bank, accountName, accountNumber, phonenumber, lastName, nametpyecreate) 
            value ('${agent_id}','${nametpyecreate}','${agent_id}','${firstName}','${username}','${hashedPassword}','${credit}',now(), now(), '${customerGroup}','${Rank}',
            '${IDLIne}','${statuScheck}', '${note}', '${currency}','${bank}', '${accountName}', '${accountNumber}', '${contact_number}','${lastName}','${tpyeCreate}')`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    res.send({
                        message: "Data created Success"
                    });
                    res.end();
                });
            }
            else {
                res.send({
                    message: "Data Creates False"
                });
                res.end();
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
});

//http://localhost:5000/agent/1  Update Agent
app.put('/agent/:id', async (req, res, next) => {
    const id = req.params.id;
    const idedit = req.body.idedit;
    const username = req.body.username;
    const password = req.body.password;
    const name = req.body.name;
    const status = req.body.status;
    const contact_number = req.body.contact_number;
    const credit = req.body.credit;

    try {
        let sql_before = `SELECT * FROM agent WHERE id ='${id}' ORDER BY username ASC`;
        connection.query(sql_before, async (error, resultBefore) => {
            if (error) { console.log(error) }
            else {
                if (password === '') {
                    let sql = `UPDATE agent set username = '${username}', name = '${name}', status = '${status}', contact_number = '${contact_number}', credit = '${credit}'  WHERE id='${id}'`;
                    connection.query(sql, (error, result) => {
                        if (error) { console.log(error) }
                        else {
                            let sql_before = `INSERT INTO logeditagent (edittype, idedit, agentid, name, editbefore, editafter, created_at) value 
                ('admin','${idedit}','${id}','${name}','${'name : ' + resultBefore[0].name + ' , ' + 'status : ' + resultBefore[0].status + ' , ' + 'contact_number : ' + resultBefore[0].contact_number}
                ','${'name : ' + name + ' , ' + 'status : ' + status + ' , ' + 'contact_number : ' + contact_number}',now())`;
                            connection.query(sql_before, (error, resultAfter) => {
                                if (error) { console.log(error); }
                                res.send({
                                    message: "Data Update Success",
                                });
                                res.end();
                            });
                        }
                    });
                } else {
                    const hashedPassword = await bcrypt.hash(password, 12);
                    let sql = `UPDATE agent set 
            username = '${username}', name = '${name}', status = '${status}', contact_number = '${contact_number}', credit = '${credit}', password = '${hashedPassword}' WHERE id='${id}'`;
                    connection.query(sql, (error, result) => {
                        if (error) { console.log(error) }
                        else {
                            let sql_before = `INSERT INTO logeditagent (edittype, idedit, agentid, name, editbefore, editafter, created_at) value 
                ('admin','${idedit}','${id}','${name}','${'name : ' + resultBefore[0].name + ' , ' + 'status : ' + resultBefore[0].status + ' , ' + 'contact_number : ' + resultBefore[0].contact_number}
                ','${'name : ' + name + ' , ' + 'status : ' + status + ' , ' + 'contact_number : ' + contact_number}',now())`;
                            connection.query(sql_before, (error, resultAfter) => {
                                if (error) { console.log(error); }
                                res.send({
                                    message: "Data Update Success",
                                });
                                res.end();
                            });
                        }
                    });
                }
            }
        });
    } catch (err) {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    }

});

//http://localhost:5000/admin/1  Update Admin
app.put('/admin/:id', async (req, res, next) => {
    const id = req.params.id;
    const idedit = req.body.idedit;
    const username = req.body.username;
    const name = req.body.name;
    const status = req.body.status;
    const contact_number = req.body.contact_number;
    try {
        let sql_before = `SELECT * FROM admin WHERE id ='${id}' ORDER BY username ASC`;
        connection.query(sql_before, (error, resultBefore) => {
            if (error) { console.log(error) }
            else {
                let sql = `UPDATE admin set username = '${username}',name = '${name}', status = '${status}', contact_number = '${contact_number}' WHERE id='${id}'`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    else {
                        let sql_before = `INSERT INTO logeditadmin (edittype, idedit, adminid, name, editbefore, editafter, created_at) value 
                  ('admin','${idedit}','${id}','${name}','${'name : ' + resultBefore[0].name + ' , ' + 'status : ' + resultBefore[0].status + ' , ' + 'contact_number : ' + resultBefore[0].contact_number}
                  ','${'name : ' + name + ' , ' + 'status : ' + status + ' , ' + 'contact_number : ' + contact_number}',now())`;
                        connection.query(sql_before, (error, resultAfter) => {
                            if (error) { console.log(error); }
                            res.send({
                                message: "Data Update Success",
                            });
                            res.end();
                        });
                    }
                });
            }
        });
    } catch (err) {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    }
});

//http://localhost:5000/member/1  Update Member
app.put('/member/:id', async (req, res, next) => {
    const id = req.params.id;
    const edittype = req.body.edittype;
    const idedit = req.body.idedit;
    const username = req.body.username;
    const firstName = req.body.firstName;
    const lastName = req.body.lastName;
    const customerGroup = req.body.customerGroup;
    const Rank = req.body.Rank;
    const contact_number = req.body.contact_number;
    const IDLIne = req.body.IDLIne;
    const note = req.body.note;
    const bank = req.body.bank;
    const accountName = req.body.accountName;
    const accountNumber = req.body.accountNumber;
    const listCheckBox = req.body.listCheckBox;
    const withdraw_member = req.body.withdraw_member;
    const total_top_up_amount = req.body.total_top_up_amount;
    const turnover = req.body.turnover;
    const agent_id = req.body.agent_id;

    let statuscheck = 'N';
    if (listCheckBox === 'เปิดใช้งาน') {
        statuscheck = 'Y'
    } else {
        statuscheck = 'N'
    }

    const post = {
        id: id, edittype: edittype, idedit: idedit, firstName: firstName, edittype: edittype, lastName: lastName, customerGroup: customerGroup,
        Rank: Rank, contact_number: contact_number, IDLIne: IDLIne, note: note, bank: bank, accountName: accountName, accountNumber: accountNumber,
        status: statuscheck, bank: bank,
    };

    let sql_before = `SELECT * FROM member WHERE id ='${id}'`;
    connection.query(sql_before, (error, resultBefore) => {
        try {
            if (error) { console.log(error) }
            else {
                const dataMenber = resultBefore[0]
                //console.log(post, dataMenber);
                const logFuntion = logEdit.uploadLogEditUser(post, dataMenber, note, agent_id, username);

                let sql = `UPDATE member set name = '${firstName}', username = '${contact_number}', status = '${statuscheck}',
                 lastName = '${lastName}', groupmember = '${customerGroup}', userrank = '${Rank}', phonenumber = '${contact_number}',
                lineid = '${IDLIne}', bank = '${bank}', accountName = '${accountName}', accountNumber = '${accountNumber}',
                withdraw_member = '${withdraw_member}', total_top_up_amount = '${total_top_up_amount}', turnover = '${turnover}' 
                WHERE id='${id}' AND agent_id = '${agent_id}'`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    else {
                        res.send({
                            message: "Data Update Success",
                        });
                        res.end();
                    }
                });
            }

        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
});

//http://localhost:5000/deleteMember/1  Delete users
app.put('/delete/:id', async (req, res, next) => {
    const id = req.params.id;
    const user = req.body.user;
    let sql = `UPDATE ${user} set status_delete = 'Y' WHERE id='${id}'`;
    connection.query(sql, (error, result) => {
        if (error) { console.log(error); }

        if (user === 'agent') {
            let sqlDeleteAgent = `UPDATE member set status_delete = 'Y' WHERE agent_id ='${id}'`;
            connection.query(sqlDeleteAgent, (error, result) => {
                if (error) { console.log(error); }
                res.send({
                    message: "Delete Success",
                });
                res.end();
            });
        }
        else {
            res.send({
                message: "Delete Success",
            });
            res.end();
        }
    });
});

http://localhost:5000/logEdit/1
app.post('/logEdit/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const typeLog = require.body.typeLog;

    if (typeLog === 'member') {
        let sql = `SELECT * FROM logedit WHERE idmember = '${user_id}' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, (error, results) => {
            const dataLog = results;
            if (error) { console.log(error) }
            const totalCount = `SELECT COUNT(*) as count FROM logedit WHERE idmember = '${user_id}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'user_playSearch',
                    data: dataLog,
                    total: res[0].count
                });

                response.end();
            });
        });
    }

    if (typeLog === "agent") {
        let sql = `SELECT edittype, idedit, editbefore, editafter, created_at FROM logeditagent
        WHERE agentid = '${user_id}' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, (error, results) => {
            const dataLog = results;
            if (error) { console.log(error) }
            const totalCount = `SELECT COUNT(*) as count FROM logeditagent WHERE agentid = '${user_id}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'user_playSearch',
                    data: dataLog,
                    total: res[0].count
                });

                response.end();
            });
        });
    }
    if (typeLog === 'admin') {
        let sql = `SELECT edittype, idedit, editbefore, editafter, created_at FROM logeditadmin
        WHERE adminid = '${user_id}' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, (error, results) => {
            const dataLog = results;
            if (error) { console.log(error) }
            const totalCount = `SELECT COUNT(*) as count FROM logeditadmin WHERE adminid = '${user_id}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'user_playSearch',
                    data: dataLog,
                    total: res[0].count
                });

                response.end();
            });
        });
    }
});


//getมาใช้ใน Dashboard
http://localhost:5000/getallData
app.get('/getallData', async (require, response, next) => {
    let sqlAdmin = `SELECT id FROM admin WHERE status_delete='N' ORDER BY username ASC`;
    let sqlAgent = `SELECT id FROM agent WHERE status_delete='N' ORDER BY username ASC`;
    let sqlMember = `SELECT id FROM member WHERE status_delete='N' ORDER BY username ASC`;
    let sqlGame = `SELECT * FROM game`;
    let sqlGamePlay = `SELECT * FROM loggame`;
    connection.query(sqlAdmin, (error, resultsAdmin) => {
        if (error) { console.log(error); }
        connection.query(sqlAgent, (error, resultsAgent) => {
            if (error) { console.log(error); }
            connection.query(sqlMember, (error, resultsMember) => {
                if (error) { console.log(error); }
                connection.query(sqlGame, (error, resultsGame) => {
                    if (error) { console.log(error); }
                    else {
                        connection.query(sqlGamePlay, (error, resultsGamePlay) => {
                            if (error) { console.log(error); }
                            else {
                                response.send({
                                    dataAdmin: resultsAdmin.length,
                                    dataAgent: resultsAgent.length,
                                    dataMember: resultsMember.length,
                                    Member: resultsMember,
                                    dataGame: resultsGame,
                                    logGame: resultsGamePlay,
                                });
                                response.end();
                            }
                        });
                    }
                });
            });
        });
    });
});

function tokenWebGame(dataBody) {
    const crypto = require('crypto');
    const { v5: uuidv5 } = require('uuid');
    const dataString = JSON.stringify(dataBody);
    const hash = crypto.createHash('sha256').update(dataString).digest('hex');
    const MY_NAMESPACE = '6ba7b810-9dad-11d1-80b4-00c04fd430c8';
    const uuidToken = uuidv5(hash, MY_NAMESPACE);
    return uuidToken;
}

http://localhost:5000/seamlesslogIn
app.get('/seamlesslogIn/:codeGame/:productId/:playerPlay', (require, response) => {

    const usernamePlayer = require.params.playerPlay;
    const productId = require.params.productId;
    const codeGame = require.params.codeGame;
    const agentUsername = 'victest2';
    const xApiKey = 'f47e5065-412c-40d1-9e4c-f6c248919509';
    const authHeader = `Basic ${Buffer.from(`${agentUsername}:${xApiKey}`).toString('base64')}`;

    const dataBody = {
        username: usernamePlayer,
        productId: productId,
        gameCode: codeGame,
    };
    let uuidToken = tokenWebGame(dataBody)

    const body = {
        username: usernamePlayer,
        productId: productId,
        gameCode: codeGame,
        isMobileLogin: true,
        sessionToken: uuidToken,
        betLimit: []
    };
    const config = {
        headers: {
            'Authorization': authHeader,
            'Content-Type': 'application/json'
        }
    };

    let sqlDeleteAgent = `UPDATE member set tokenplaygame = '${uuidToken}' WHERE username ='${usernamePlayer}'`;
    connection.query(sqlDeleteAgent, (error, result) => {
        if (error) { console.log(error); }
        else {
            axios.post('https://test.ambsuperapi.com/seamless/logIn', body, config)
                .then(res => {
                    console.log(res.data);
                    response.status(201).json({ data: res.data });
                })
                .catch(error => {
                    console.log(error);
                });
        }
    });
});

http://localhost:5000/listGame
app.get('/listGame/:productId', (require, response) => {
    const productId = require.params.productId;
    const agentUsername = 'victest2';
    const xApiKey = 'f47e5065-412c-40d1-9e4c-f6c248919509';
    const authHeader = `Basic ${Buffer.from(`${agentUsername}:${xApiKey}`).toString('base64')}`;

    axios.get(`https://test.ambsuperapi.com/seamless/games`, {
        params: {
            productId: productId
        },
        headers: {
            'Authorization': authHeader,
            'Content-Type': 'application/json'
        }
    })
        .then(res => {
            console.log(res.data);
            response.status(201).json({ data: res.data });
        })
        .catch(error => {
            console.log(error);
        });
});

app.post('/userplayGame', async (req, res) => {
    const username = req.body.username;
    const agent_id = req.body.agent_id;
    const nameGame = req.body.nameGame;

    let sql_member = `UPDATE member set playgameuser = '${nameGame}' WHERE username ='${username}' AND agent_id = '${agent_id}'`;
    connection.query(sql_member, async (error, results) => {
        if (error) { console.log(error); }
        res.send({
            message: 'saveNameGame',
        });
        res.end();
    });
})

//http://localhost:5000/list_webgame
app.post('/list_webgame', async (require, response) => {
    const searchKeyword = require.body.name;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    if (searchKeyword === '') {
        let sql = `SELECT * FROM gameweb LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM gameweb `
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'gameall',
                    data: results,
                    total: res[0].count
                });

                response.end();
            });
        });
    } else {
        let sql = `SELECT * FROM gameweb WHERE
        namegame LIKE '%${searchKeyword}%' OR password_img LIKE '%${searchKeyword}%'
        LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'gameallSearch',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
});

app.post('/otpRequest', async (req, res) => {
    const phone = req.body.phoneNumber
    let sql_check = `SELECT * FROM member WHERE phonenumber='${phone}' ORDER BY phonenumber ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1 || data.length < 1) {
                sdk.postV2OtpRequest({
                    key: '1771680550307989',
                    secret: 'f7452e51ee54238076d2c04a1af5aeb7',
                    msisdn: phone
                }, { accept: 'application/json' })
                    .then(data => { res.json({ dataRes: data }) })
                    .catch(err => console.error(err));
            }
            else {
                console.log('on');
                res.json({ message: "This phonenumber is not available." });
                res.end();
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
        }
    })
});

app.post('/otpRequestForgotPassword', async (req, res) => {
    const phone = req.body.phoneNumber
    let sql_check = `SELECT * FROM member WHERE phonenumber='${phone}' ORDER BY phonenumber ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length === 1 || data.length > 1) {
                sdk.postV2OtpRequest({
                    key: '1771680550307989',
                    secret: 'f7452e51ee54238076d2c04a1af5aeb7',
                    msisdn: phone
                }, { accept: 'application/json' })
                    .then(data => { res.json({ dataRes: data }) })
                    .catch(err => console.error(err));
            }
            else {
                res.json({ message: "This phonenumber is not available." });
                res.end();
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
        }
    })
});

app.post('/otpVerify', async (req, res) => {
    const token = req.body.token;
    const pin = req.body.pin;

    sdk.postV2OtpVerify({
        key: '1771680550307989',
        secret: 'f7452e51ee54238076d2c04a1af5aeb7',
        token: token,
        pin: pin,
    }, { accept: 'application/json' })
        .then(data => { res.json({ dataRes: data }) })
        .catch(err => { res.json({ dataRes: err.data.errors[0].message }) });
});

//-----------------------------------------------------------------------------------------------------------------------------
const imageUploadPath = 'public/images';
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, imageUploadPath)
    },
    filename: function (req, file, cb) {
        cb(null, `${file.fieldname}_dateVal_${Date.now()}_${file.originalname}`)
    }
})

const imageUpload = multer({
    storage: storage,
    limits: { fileSize: 5 * 1024 * 1024 },
});
app.post('/image-upload', imageUpload.single("file"), async (req, res) => { //ทดลองอัพโหลดรูปภาพขึ้น Server
    //console.log('Axios POST body: ', req.file);
    res.json({ nameImg: req.file.filename });
});

//-----------------------------------------------------------------------------------------------------------------------------
app.post('/depositToonta', async (req, res) => { //ทดลองอัพโหลดรูปภาพขึ้น Server
    // const imagePath = path.join(__dirname, 'public/images', 'testimg.jpg');
    // const imageBuffer = fs.readFileSync(imagePath);

    // const formData = new FormData();
    // formData.append('file', imageBuffer, { filename: 'test.jpg' });

    /* const financeToonta = FInance.CheckInformation()  
     .then(calculatedValues => {
         res.send({ message: calculatedValues});
     })
     .catch(error => {
         console.error(error.data);
     });*/
    try {
        const YOUR_FILE_LOCATION = 'https://drive.google.com/uc?id=1s2An3k_84jnZKLJ4Prkr0UhF0rw_zKeR';
        const Url = `https://dogzilla.live/images/${req.body.filename}`
        const restest = await axios.post(
            'https://api.slipok.com/api/line/apikey/9496',
            { url: YOUR_FILE_LOCATION },
            {
                headers: {
                    'x-authorization': 'SLIPOKCJ8CI5X',
                    'Content-Type': 'multipart/form-data',
                },
            }
        )
        // console.log(restest.data.data.receiver.account);
        const financeToonta = FInance.CheckInformation(restest.data, req.body)
            .then(calculatedValues => {
                res.send({ message: calculatedValues });
            })
            .catch(error => {
                console.error(error.data.data);
            });
    } catch (err) {
        console.log(err)
        res.json({ message: "QR Code หมดอายุ หรือ ไม่มีรายการอยู่จริง" });
    }
});

//-----------------------------------------------------------------------------------------------------------------------------

app.get('/latest-records', (req, res) => {

    const today = new Date();

    // Format the date as "yyyy-mm-dd"
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0'); // JavaScript months are 0-based, so we add 1
    const year = today.getFullYear();

    const formattedDate = `${year}-${month}-${day}`;
    console.log(formattedDate);
    const query = `SELECT numberbill FROM logfinanceuser WHERE transaction_date = ? ORDER BY numberbill DESC LIMIT 1`;

    connection.query(query, [formattedDate], (err, results) => {
        if (err) {
            console.error('Error fetching latest records: ', err);
            res.status(500).json({ error: 'Error fetching latest records' });
            return;
        }

        res.json(results);
    });
});

function automaticFunction() {
    console.log('Automatic function is running at 03:44 PM.');
    cron.schedule('53 15 * * *', () => {
        automaticFunctionTest();
    });
}

function automaticFunctionTest() {
    //const startPromotion = promotion.promotionPlayLoseMoneyBack()
}
// Schedule the function to run every day at 02:50 PM
cron.schedule('52 15 * * *', () => {
    automaticFunction();
});


//-----------------------------------------------------------------------------------------------------------------------------

/*const SleetUploadPath = 'public/images';
const storageimg = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, imageUploadPath)
    },
    filename: function (req, file, cb) {
        cb(null, `${file.fieldname}_dateVal_${Date.now()}_${file.originalname}`)
    }
})
const SleetUpload = multer({
    storage: storage,
    limits: { fileSize: 5 * 1024 * 1024 },
});

app.post('/image-uploadSleet', imageUpload.single("file"), (req, res) => { //ทดลองอัพโหลดรูปภาพขึ้น Server
    const url = 'https://verify.ptrdc.xyz/api/verify';
    const data = {
        qrcode_text: 'https://websitehui.s3.ap-southeast-1.amazonaws.com/368441991_669600238379027_8438505471397569485_n.jpg',
        key_api: 'PTRDC-JDYjFUghOPHraA1yftWuBv7',//ToonTaApiKeyTest
        ip: '',
    };
    axios.post(url, data)
        .then(response => {
            console.log(response.data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
});

app.post('/testQR', (req, res) => {
    const url = 'https://verify.ptrdc.xyz/api/verify';
    const data = {
        qrcode_text: '0046000600000101030140225202308231Bvr3VeN49LIa3twr5102TH9104289A',
        key_api: 'PTRDC-JDYjFUghOPHraA1yftWuBv7',//ToonTaApiKeyTest
        ip: '124.120.33.63',
    };
    axios.post(url, data)
        .then(response => {
            console.log(response.data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
})
//-----------------------------------------------------------------------------------------------------------------------------
*/
function getItem(key) {
    return storage[key];
}

app.post('/testToken', async (req, res) => {

    let x = 2 *

        res.send({
            wingame: formattedDateStart,
            betGame: formattedDateEnd,
        });
    res.end();

})


// function formatNumber(num) {
//     return String(num).padStart(5, '0');
// }

// app.post('/testNopicationwindaew', async (req, res) => {
//     const quantity = req.body.quantity;
//     const phonenumber = req.body.phonenumber;
//     const agent_id = req.body.agent_id;
//     const today = new Date();
//     const day = String(today.getDate()).padStart(2, '0');
//     const month = String(today.getMonth() + 1).padStart(2, '0'); // JavaScript months are 0-based, so we add 1
//     const year = today.getFullYear();
//     const formattedDate = year + month + day;
//     const formattedDateBill = `${year}-${month}-${day}`;
//     let sql_before = `SELECT * FROM member WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}'`;
//     connection.query(sql_before, async (error, resultUser) => {
//         try {
//             if (error) {
//                 console.log(error)
//             } else {
//                 let moneyUserWithDraw = resultUser[0].credit - resultUser[0].turnover
//                 if (resultUser[0].credit > quantity && quantity <= moneyUserWithDraw) {
//                     let bill = `SELECT numberbill FROM logfinanceuser WHERE transaction_date = ? AND tpyefinance = 'ถอน' ORDER BY numberbill DESC LIMIT 1`;
//                     connection.query(bill, [formattedDateBill], (error, resultBill) => {
//                         if (error) {
//                             console.log(error)
//                         } else {
//                             let billnum = 0
//                             if (resultBill.length !== 0) {
//                                 billnum = resultBill[0].numberbill + 1;
//                             } else { billnum += 1; }
//                             const formattedNumber = formatNumber(billnum);
//                             const statusWitdraw = 'ถอน';
//                             FInance.Withdrawmoney(resultUser[0], formattedDate, formattedNumber, billnum, quantity, resultUser[0].accountNumber, phonenumber, 'in_progress')
//                                 .then(calculatedValues => {
//                                     //console.log(calculatedValues);
//                                 })
//                                 .catch(error => {
//                                     console.error(error);
//                                 });

//                             const balance = quantity;
//                             let sql_Bank = `SELECT * FROM banknames WHERE bankname_name ='${resultUser[0].bank}'`;
//                             connection.query(sql_Bank, (error, resultBank) => {
//                                 if (error) {
//                                     console.log(error)
//                                 } else {
//                                     let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus,
//                                         balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber) value
//                                     ('${resultUser[0].id}','${resultUser[0].agent_id}','${resultUser[0].accountName}','${resultUser[0].accountNumber}','${phonenumber}','${'ถอน'}','${quantity}','${0}','${resultUser[0].credit}'
//                                     ,'${balance}','T${formattedDate}${formattedNumber}','${billnum}','${'ยังไม่เรียบร้อย'}',now(),now(),'${resultUser[0].bank}','${resultBank[0].images}'
//                                     ,'${resultUser[0].accountName}','${resultUser[0].accountNumber}')`;

//                                     connection.query(sql_before, (error, result) => {
//                                         if (error) {
//                                             console.log(error)
//                                         } else {
//                                             const balanceNow = resultUser[0].credit - quantity;
//                                             if (statusWitdraw === "สำเร็จ") {
//                                                 let sql = `UPDATE member set credit = '${balanceNow}', recharge_times = '${resultUser[0].recharge_times + 1}'
//                                             WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}'`;
//                                                 connection.query(sql, (error, resultAfter) => {
//                                                     if (error) {
//                                                         console.log(error);
//                                                     }
//                                                     res.send({
//                                                         message: "ถอนเงินสำเร็จ",
//                                                     });
//                                                     res.end();
//                                                 });
//                                             }
//                                             else {
//                                                 let sql = `UPDATE member set credit = '${resultUser[0].credit}', withdraw_member = '${resultUser[0].withdraw_member + quantity}', latest_withdrawal = '${quantity}'
//                                             WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}'`;
//                                                 connection.query(sql, (error, resultAfter) => {
//                                                     if (error) {
//                                                         console.log(error);
//                                                     }
//                                                     const post = [
//                                                         {username : resultUser[0].username,
//                                                         withdraw_member : quantity,
//                                                         message : "มีการแจ้งถอนเงินจำนวน"
//                                                     }
//                                                     ]
//                                                     io.emit('notify-management-withdraw', { data: post});
//                                                     res.send({
//                                                         message: "รอการอนุมัติการถอนเงิน",
//                                                     });
//                                                     res.end();
//                                                 });
//                                             }
//                                         }
//                                     });
//                                 }
//                             })
//                         }
//                     })
//                 } else {
//                     res.send({
//                         message: "ยอดเงินมีไม่เพียงพอ",
//                     });
//                 }
//             }
//         } catch (err) {
//             if (!err.statusCode) {
//                 err.statusCode = 500;
//             }
//         }
//     });

// });
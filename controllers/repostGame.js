const express = require('express');
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const md5 = require('md5');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const moment = require('moment-timezone')
const promotiontoonta = require('./promotiontoonta')
const app = express();
app.use(express.static('public'));
require('dotenv').config()

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

module.exports = class Post {
    constructor(email, password, role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }

    static uploadLogRepostGame(post) {

        const currentTimeInThailand = moment().tz('Asia/Bangkok');
        const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
        const formattedTime = currentTimeInThailand.format('HH:mm:ss');

        let browser;
        if (post.userAgent.includes('Chrome')) {
            browser = 'Google Chrome';
        } else if (post.userAgent.indexOf('Firefox') > -1) {
            browser = 'Mozilla Firefox';
        } else if (post.userAgent.indexOf('Safari') > -1) {
            browser = 'Apple Safari';
        } else if (post.userAgent.indexOf('Opera') > -1) {
            browser = 'Opera';
        } else if (post.userAgent.indexOf('Edg') > -1) {
            browser = 'Microsoft Edge';
        } else if (post.userAgent.indexOf('Trident') > -1) {
            browser = 'Microsoft Internet Explorer';
        }
        else {
            browser = 'Google Chrome';
        }
        const isMobile = /Mobile|Android/.test(post.userAgent);
        let platform = 'Mobile';
        if (isMobile) {
            platform = 'Mobile';
        } else {
            platform = 'PC';
        }

        const sql = `SELECT * FROM member WHERE username = ?`;
        connection.query(sql, [post.username], (error, result) => {
            try {
                if (error) { console.log(error) }
                else {
                    let turnoverrepostfun = turnoverrepost(post)

                    promotiontoonta.user_Leaked_promotion(post)
                    let datausername = result[0];
                    let sql_before = `INSERT INTO repostgame (iduser, username, gameid, namegame, bet, win, balance_credit, get_browser, platform, created_atdate, created_attime) value 
              ('${datausername.id}','${post.username}','${post.gameid}','${post.namegame}','${post.bet}','${post.win}','${post.balance_credit}','${browser}','${platform}','${formattedDate}','${formattedTime}')`;
                    connection.query(sql_before, (error, resultAfter) => {
                        if (error) { console.log(error); }
                        else {
                            return 'OK';
                        }
                    });
                }
            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
            }
        });
    }

    static uploadLogRepostGameAsk(post) {

        const currentTimeInThailand = moment().tz('Asia/Bangkok');
        const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
        const formattedTime = currentTimeInThailand.format('HH:mm:ss');

        let browser;
        if (post.userAgent.includes('Chrome')) {
            browser = 'Google Chrome';
        } else if (post.userAgent.indexOf('Firefox') > -1) {
            browser = 'Mozilla Firefox';
        } else if (post.userAgent.indexOf('Safari') > -1) {
            browser = 'Apple Safari';
        } else if (post.userAgent.indexOf('Opera') > -1) {
            browser = 'Opera';
        } else if (post.userAgent.indexOf('Edg') > -1) {
            browser = 'Microsoft Edge';
        } else if (post.userAgent.indexOf('Trident') > -1) {
            browser = 'Microsoft Internet Explorer';
        }
        else {
            browser = 'Google Chrome';
        }

        const isMobile = /Mobile|Android/.test(post.userAgent);
        let platform = 'Mobile';
        if (isMobile) {
            platform = 'Mobile';
        } else {
            platform = 'PC';
        }

        const sql = `SELECT * FROM member WHERE username = ?`;
        connection.query(sql, [post.username], (error, result) => {
            try {
                if (error) { console.log(error) }
                else {
                    let datausername = result[0];
                    const sql = `SELECT * FROM repostgame WHERE trans_id = ?`;
                    connection.query(sql, [post.trans_id], (error, resulttransID) => {
                        if (error) { console.log(error) }
                        else {
                            //console.log(resulttransID.length);
                            if (resulttransID.length !== 0) {
                                const postII = {
                                    username: post.username, gameid: post.gameid, bet: resulttransID[0].bet, win: post.win, balance_credit: post.balance_credit, 
                                    userAgent: post.userAgent, platform: post.platform, namegame: post.namegame
                                }
                                let turnoverrepostfun = turnoverrepost(postII)
                                promotiontoonta.user_Leaked_promotion(post)
                                let sql = `UPDATE repostgame set  win = '${post.win}', balance_credit = '${post.balance_credit}' WHERE trans_id = "${post.trans_id}"`;
                                connection.query(sql, (error, resultAfter) => {
                                    if (error) { console.log(error); }
                                    return 'OK';
                                });
                            } else {
                                promotiontoonta.user_Leaked_promotion(post)
                                let sql_before = `INSERT INTO repostgame (iduser, username, gameid, namegame, bet, win, balance_credit, get_browser, platform, trans_id, created_atdate, created_attime) value 
                                ('${datausername.id}','${post.username}','${post.gameid}','${post.namegame}','${post.bet}','${0}','${post.balance_credit}','${browser}','${platform}'
                                ,'${post.trans_id}','${formattedDate}','${formattedTime}')`;
                                connection.query(sql_before, (error, resultAfter) => {
                                    if (error) { console.log(error); }
                                    return 'OK';
                                });
                            }
                        }
                    })

                }

            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
            }
        });
    }

    /*--------------------------------------------------------------------------------- reports Game All*/
    static async valuewinbet(post) {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM repostgame WHERE created_atdate >='${post.startdate}' AND created_atdate <= '${post.endDate}'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let betvalue = 0;
                        let winvalue = 0;
                        for (let i = 0; i < results.length; i++) {
                            betvalue += results[i].bet;
                            winvalue += results[i].win;
                        }
                        let jsArray = { "bet": betvalue, "win": winvalue };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "bet": 0, "win": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async valuedailyRegisterMamber(post) {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM member WHERE created_at >='${post.startdate}' AND created_at <= '${post.endDate}'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    const totalCount = `SELECT COUNT(*) as count FROM member`
                    connection.query(totalCount, (error, res) => {
                        let value = results.length;
                        let total = res[0].count
                        let jsArray = { "membervalue": value, "allmember": total };
                        resolve(jsArray);
                    })
                }
            });
        });
    }

    static async valuedailyFinanceDeposit(post) {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = 'ฝาก' AND transaction_date >='${post.startdate}' AND transaction_date <= '${post.endDate}' AND status = 'สำเร็จ'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let depositvalue = 0;
                        for (let i = 0; i < results.length; i++) {
                            depositvalue += results[i].quantity;
                        }
                        let jsArray = { "depositvalut": depositvalue };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "depositvalut": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async valuedailyFinanceWithdraw(post) {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = 'ถอน' AND transaction_date >='${post.startdate}' AND transaction_date <= '${post.endDate}' AND status = 'สำเร็จ'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let withdrawvalue = 0;
                        for (let i = 0; i < results.length; i++) {
                            withdrawvalue += results[i].quantity;
                        }
                        let jsArray = { "withdrawvalue": withdrawvalue };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "withdrawvalue": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async valuedailyFinanceDepositTotal() {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = 'ฝาก' AND status = 'สำเร็จ'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let depositvalueTolal = 0;
                        for (let i = 0; i < results.length; i++) {
                            depositvalueTolal += results[i].quantity;
                        }
                        let jsArray = { "depositvalutTotal": depositvalueTolal };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "depositvalutTotal": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async valuedailyFinanceWithdrawTotal() {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = 'ถอน' AND status = 'สำเร็จ'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let withdrawvalueTotal = 0;
                        for (let i = 0; i < results.length; i++) {
                            withdrawvalueTotal += results[i].quantity;
                        }
                        let jsArray = { "withdrawvalueTotal": withdrawvalueTotal };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "withdrawvalueTotal": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async topwit(post) {
        return new Promise((resolve, reject) => {
            //console.log(post);
            const sql = `SELECT * FROM totalturnoverrepost WHERE day >= '${post.startdate}' AND day <= '${post.endDate}'  ORDER BY win DESC LIMIT 20`;
            connection.query(sql, (err, results) => {
                if (err) {
                    console.log(err);
                    reject(err);
                } else {
                    if (results.length !== 0) {
                        let data = [];
                        results.forEach((row, index) => {
                            //console.log(`${index + 1}. Account: ${row.usernameuser	}, Balance: ${row.lose}`);
                            data.push(row)

                        });
                        resolve(data);
                    } else {
                        let jsArray = { "topwit": "วันนี้ยังไม่มีผู้เล่น" };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async toplose(post) {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM totalturnoverrepost WHERE day >= '${post.startdate}' AND day <= '${post.endDate}' ORDER BY lose DESC LIMIT 20`;
            connection.query(sql, (err, results) => {
                if (err) {
                    console.log(err);
                    reject(err);
                } else {
                    if (results.length !== 0) {
                        let data = [];
                        results.forEach((row, index) => {
                            //console.log(`${index + 1}. Account: ${row.usernameuser	}, Balance: ${row.lose}`);
                            data.push(row)

                        });
                        resolve(data);
                    } else {
                        let jsArray = { "toplose": "วันนี้ยังไม่มีผู้เล่น" };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async topturnover(post) {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM totalturnoverrepost WHERE day >='${post.startdate}' AND day <= '${post.endDate}' ORDER BY turnover DESC LIMIT 20`;
            connection.query(sql, (err, results) => {
                if (err) {
                    console.log(err);
                    reject(err);
                } else {
                    if (results.length !== 0) {
                        let data = [];
                        results.forEach((row, index) => {
                            //console.log(`${index + 1}. Account: ${row.usernameuser	}, Balance: ${row.lose}`);
                            data.push(row)

                        });
                        resolve(data);
                    } else {
                        let jsArray = { "topturnover": "วันนี้ยังไม่มีผู้เล่น" };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async topWithdraw(post) {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM logfinancerepost WHERE transaction_date >='${post.startdate}' AND transaction_date <= '${post.endDate}' AND transaction = 'ถอน'  ORDER BY quantity DESC LIMIT 20`;
            connection.query(sql, (err, results) => {
                if (err) {
                    console.log(err);
                    reject(err);
                } else {
                    if (results.length !== 0) {
                        let data = [];
                        results.forEach((row, index) => {
                            //console.log(`${index + 1}. Account: ${row.usernameuser	}, Balance: ${row.lose}`);
                            data.push(row)
                        });
                        resolve(data);
                    } else {
                        let jsArray = { "logfinancerepost": "วันนี้ยังไม่มีผู้เล่นถอน" };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async topDeposit(post) {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM logfinancerepost WHERE transaction_date >='${post.startdate}' AND transaction_date <= '${post.endDate}' AND transaction = 'ฝาก'  ORDER BY quantity DESC LIMIT 20`;
            connection.query(sql, (err, results) => {
                if (err) {
                    console.log(err);
                    reject(err);
                } else {
                    if (results.length !== 0) {
                        let data = [];
                        results.forEach((row, index) => {
                            //console.log(`${index + 1}. Account: ${row.usernameuser	}, Balance: ${row.lose}`);
                            data.push(row)

                        });
                        resolve(data);
                    } else {
                        let jsArray = { "logfinancerepost": "วันนี้ยังไม่มีผู้เล่นฝาก" };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async totalroundplayday(post) {
        return new Promise((resolve, reject) => {
            const sql = `SELECT roundplay FROM totalturnoverrepost WHERE day >='${post.startdate}' AND day <= '${post.endDate}'`;
            connection.query(sql, (err, results) => {
                if (err) {
                    console.log(err);
                    reject(err);
                } else {
                    if (results.length !== 0) {
                        let roundplayTotal = 0;
                        for (let i = 0; i < results.length; i++) {
                            roundplayTotal += results[i].roundplay;
                        }
                        let jsArray = { "roundplayvalueTotal": roundplayTotal, 'valususerplayDay': results.length };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "roundplayvalueTotal": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }
    /*--------------------------------------------------------------------------------- reports Game All End*/

    static async turnoverrepost(post) {
        return new Promise((resolve, reject) => {
            const startDate = '2023-09-25';
            const endDate = '2023-09-30';

            // Query to retrieve tables within the date range
            const query = `SELECT usernameuser , SUM(turnover) AS turnover 
            FROM totalturnoverrepost WHERE day BETWEEN ? AND ? GROUP BY usernameuser`;

            connection.query(query, [startDate, endDate], (err, results) => {
                if (err) {
                    console.error('Error querying the database:', err);
                    connection.end();
                    return;
                }

                // Process the results
                const summedValues = {};
                results.forEach((row) => {
                    const tableName = row.table_name;
                    const totalValue = row.total_value;

                    if (summedValues[tableName]) {
                        summedValues[tableName] += totalValue;
                    } else {
                        summedValues[tableName] = totalValue;
                    }
                });

                // Print the summed values
                console.log('Summed Values:', summedValues);

                // Close the database connection
                connection.end();
            });
        })
    }
};

function turnoverrepost(post) {
    const floatwit = parseFloat(post.win);
    const floatbet = parseFloat(post.bet);
    let total = totalTurnoverrepost(post);
    let totlgameCamp = gamecamptotal(post);
    let gamelist = repostlistgame(post);
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');
    const lose = floatbet - floatwit;
    console.log(floatwit, floatbet);
    let turnoverUserGame = turnoverUser(post);
    let sql = `SELECT * FROM turnoverrepost WHERE day = '${formattedDate}' AND usernameuser = '${post.username}' AND gamecamp = '${post.gameid}'`;
    connection.query(sql, (error, results) => {
        if (error) {
            console.log(error);
            reject(error);
        } else {
            //console.log(date);
            if (results.length > 0) {
                const floatwitapi = parseFloat(results[0].win);
                const floatturnoverapi = parseFloat(results[0].turnover);
                const numberWin = floatwit + floatwitapi;
                const turnover = floatbet + floatturnoverapi;
                const numberlose = turnover - numberWin;

                let sql = `UPDATE turnoverrepost set roundplay = '${results[0].roundplay + 1}', turnover = '${turnover}', win = '${numberWin}', lose = '${numberlose}' 
                WHERE day = '${formattedDate}' AND usernameuser = '${post.username}' AND gamecamp = '${post.gameid}'`;
                connection.query(sql, (error, resultAfter) => {
                    if (error) { console.log(error); }
                    return 'OK';
                });
            } else {
                let sql_before = `INSERT INTO turnoverrepost (usernameuser, gamecamp, roundplay, turnover, win, lose, day) value 
                ('${post.username}','${post.gameid}','${1}','${floatbet}','${floatwit}','${lose}','${formattedDate}')`;
                connection.query(sql_before, (error, resultAfter) => {
                    if (error) { console.log(error); }
                    return 'OK';
                });
            }
        }
    })
}

function totalTurnoverrepost(post) {
    const floatwit = parseFloat(post.win);
    const floatbet = parseFloat(post.bet);
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');
    const lose = floatbet - floatwit;
    let sqlpercentagegame = `SELECT percentagegame FROM gameweb WHERE password_img = '${post.gameid}'`;
    let sql = `SELECT * FROM totalturnoverrepost WHERE day = '${formattedDate}' AND usernameuser = '${post.username}'`;
    connection.query(sql, (error, results) => {
        if (error) {
            console.log(error);
            reject(error);
        } else {
            connection.query(sqlpercentagegame, (error, resultspercen) => {
                console.log(post.gameid);
                const commnytotal = (floatbet - floatwit)
                const commy_agentTotal = commnytotal * (resultspercen[0].percentagegame / 100);
                const tatal_commny = commnytotal - commy_agentTotal;
                if (results.length > 0) {
                    const floatwitapi = parseFloat(results[0].win);
                    const floatturnoverapi = parseFloat(results[0].turnover);
                    const ag_winlose = parseFloat(results[0].ag_winlose);
                    const ag_total = parseFloat(results[0].ag_total);
                    const comny_total = parseFloat(results[0].comny_total);
                    const numberWin = floatwit + floatwitapi;
                    const turnover = floatbet + floatturnoverapi;
                    const numberlose = turnover - numberWin;
                    const commnytotalupdate = (resultspercen[0].percentagegame * numberlose) / 100;
                    const commy_agentTotalupdate = commy_agentTotal + ag_total
                    const tatal_commnyupdate = comny_total + tatal_commny;
                    //const lose = floatbet - floatwit;
                    let sql = `UPDATE totalturnoverrepost set  turnover = '${turnover}', win = '${numberWin}', lose = '${numberlose}', roundplay = '${results[0].roundplay + 1}', 
                    ag_winlose = '${numberlose}', ag_comm = '${0.00}', ag_total = '${commy_agentTotalupdate}', comny_total = '${tatal_commnyupdate}'
                    WHERE day = '${formattedDate}' AND usernameuser = '${post.username}'`;
                    connection.query(sql, (error, resultAfter) => {
                        if (error) { console.log(error); }
                        return 'OK';
                    });
                } else {
                    let sql_before = `INSERT INTO totalturnoverrepost (	usernameuser, turnover, win, lose, roundplay, ag_winlose, ag_comm, ag_total, comny_total ,day) value 
                    ('${post.username}','${floatbet}','${floatwit}','${lose}','${1}','${commnytotal}','${0.00}','${commy_agentTotal}','${tatal_commny}','${formattedDate}')`;
                    connection.query(sql_before, (error, resultAfter) => {
                        if (error) { console.log(error); }
                        return 'OK';
                    });
                }
            })
        }
    })
}

function gamecamptotal(post) {
    const floatwit = parseFloat(post.win);
    const floatbet = parseFloat(post.bet);
    const lose = floatbet - floatwit;
    const total = floatwit - lose;
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');
    let sqlpercentagegame = `SELECT percentagegame FROM gameweb WHERE password_img = '${post.gameid}'`;
    let sql = `SELECT * FROM gamecamptotal WHERE day = '${formattedDate}' AND namegamecamp = '${post.gameid}'`;
    connection.query(sql, (error, results) => {
        if (error) {
            console.log(error);
            reject(error);
        } else {
            connection.query(sqlpercentagegame, (error, resultspercen) => {

                const commnytotal = (floatbet - floatwit)
                const commy_agentTotal = commnytotal * (resultspercen[0].percentagegame / 100);
                const tatal_commny = commnytotal - commy_agentTotal;

                if (results.length > 0) {
                    const floatwitapi = parseFloat(results[0].win);
                    const floatturnoverapi = parseFloat(results[0].turnover);
                    const ag_winlose = parseFloat(results[0].w_l_agent);
                    const ag_total = parseFloat(results[0].tatal_agent);
                    const comny_total = parseFloat(results[0].tatal_commny);
                    const numberWin = floatwit + floatwitapi;
                    const turnover = floatbet + floatturnoverapi;
                    const numberlose = turnover - numberWin;
                    const totalnumber = numberWin - numberlose
                    //const commnytotalupdate = (resultspercen[0].percentagegame * numberlose) / 100;
                    const commy_agentTotalupdate = commy_agentTotal + ag_total
                    const tatal_commnyupdate = comny_total + tatal_commny;

                    let sql = `UPDATE gamecamptotal set grossComm = '${0.00}', turnover = '${turnover}', win = '${numberWin}', lose = '${numberlose}', commmember = '${0.00}', totalmamber = '${totalnumber}',
                    w_l_agent = '${numberlose}', comm_agent = '${0.00}', tatal_agent = '${commy_agentTotalupdate}', w_l_commny = '${numberlose}', comm_commny = '${0.00}',
                    tatal_commny = '${tatal_commnyupdate}', roundplay = '${results[0].roundplay + 1}'
                    WHERE day = '${formattedDate}' AND namegamecamp = '${post.gameid}'`;
                    connection.query(sql, (error, resultAfter) => {
                        if (error) { console.log(error); }
                        return 'OK';
                    });
                } else {
                    let sql_before = `INSERT INTO gamecamptotal (namegamecamp, grossComm, turnover, win, lose, commmember, totalmamber, w_l_agent, 
                    comm_agent, tatal_agent, w_l_commny, comm_commny, tatal_commny, roundplay, day) value 
                    ('${post.gameid}','${0.00}','${floatbet}','${floatwit}','${lose}','${0.00}','${total}','${commnytotal}','${0.00}','${commy_agentTotal}','${commnytotal}'
                    ,'${0.00}','${tatal_commny}','${1}','${formattedDate}')`;
                    connection.query(sql_before, (error, resultAfter) => {
                        if (error) { console.log(error); }
                        return 'OK';
                    });
                }
            })
        }
    })
}

function turnoverUser(post) {
    const floatbet = parseFloat(post.bet);
    let sql = `SELECT turnover_playuser FROM member WHERE username = '${post.username}' AND agent_id = '2'`;
    connection.query(sql, (error, results) => {
        if (error) {
            console.log(error);
            reject(error);
        } else {
            let sql = `UPDATE member set turnover_playuser = '${results[0].turnover_playuser + floatbet}'
            WHERE username = '${post.username}' AND agent_id = '2'`;
            connection.query(sql, (error, resultAfter) => {
                if (error) { console.log(error); }
                return 'OK';
            });
        }
    })
}

function repostlistgame(post) {
    const floatwit = parseFloat(post.win);
    const floatbet = parseFloat(post.bet);
    const winlose = floatwit - floatbet;
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');
    let a_w = 0;
    let a_l = 0;
    let c_w = 0;
    let c_l = 0;
    let sqlpercentagegame = `SELECT percentagegame FROM gameweb WHERE password_img = '${post.gameid}'`;
    connection.query(sqlpercentagegame, (error, resultspercen) => {
        if (error) {
            console.log(error);
        } else {
            if (winlose < 0){ //ผู้เล่นแพ้
                const losewin = floatbet - floatwit;
                a_w = losewin * (resultspercen[0].percentagegame / 100);
                a_l = 0;
                c_w = 0;
                c_l = losewin - (losewin * (resultspercen[0].percentagegame / 100));
            } else { //ผู้เล่นชนะ
                a_w = 0;
                a_l = winlose * (resultspercen[0].percentagegame / 100); //4.5
                c_w = winlose - (winlose * (resultspercen[0].percentagegame / 100)); //0.5
                c_l = 0;
            }

            let sql_before = `INSERT INTO repostlistgame (usernameuser, namegame, namegamecamp, currency, bet, grosscomm, 
                w_user, l_user, w_agent, l_agent, w_company, l_company, date, time) value 
                ('${post.username}','${post.namegame}','${post.gameid}','${'THB'}','${floatbet}','${0.00}','${floatwit}','${floatbet}',
                '${a_w}','${a_l}','${c_w}','${c_l}','${formattedDate}','${formattedTime}')`;
            connection.query(sql_before, (error, resultAfter) => {
                if (error) { console.log(error); }
                return 'OK';
            });
        }
    })
}

const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const os = require('os');
require('dotenv').config()
const useragent = require('express-useragent')

const repostGame = require('./repostGame')

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

function hasSimilarData(gameplayturn, input, turnover, betPlay) {
    if (gameplayturn !== "PlayAllGame") {
        const dataString = gameplayturn;
        const dataArray = dataString.split(',');
        let dataArrayGame = dataArray.some(item => input.includes(item));
        if (dataArrayGame) {
            let postTurnover = turnover - betPlay;
            if (postTurnover < 0) {
                postTurnover = 0;
                return postTurnover
            } else {
                return postTurnover
            }
        } else {
            return turnover;
        }
    } else {
        let postTurnover = turnover - betPlay;
        if (postTurnover < 0) {
            postTurnover = 0;
            return postTurnover
        } else {
            return postTurnover
        }
    }
}

//Ninja Slot/918 Kiss-------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/Ninja918/transaction  
exports.FishingNinja918 = async (req, res) => {
    const id = req.body.id;
    const productId = req.body.productId;
    const usernames = req.body.username;
    const currency = req.body.currency;
    const timestampMillis = req.body.timestampMillis;
    const txns = req.body.txns;

    //username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                if (txns[0].betAmount.playInfo === "FISHING-Transaction") {
                    const amount = txns[0].betAmount - txns[0].payoutAmount
                    const balanceNow = balanceUser + amount;
                    res.status(201).json({
                        id: id,
                        statusCode: 0,
                        productId: productId,
                        timestampMillis: timestampMillis,
                        username: usernames,
                        currency: currency,
                        balanceBefore: balanceUser,
                        balanceAfter: balanceNow
                    });
                } else if (txns[0].betAmount.playInfo === "Fishing-deposit") {
                    const amount = txns[0].betAmount - txns[0].payoutAmount
                    const balanceNow = balanceUser + amount;
                    res.status(201).json({
                        id: id,
                        statusCode: 0,
                        productId: productId,
                        timestampMillis: timestampMillis,
                        username: usernames,
                        currency: currency,
                        balanceBefore: balanceUser,
                        balanceAfter: balanceNow
                    });
                } else {
                    const amount = txns[0].betAmount
                    const balanceNow = balanceUser + amount;
                    res.status(201).json({
                        id: id,
                        statusCode: 0,
                        productId: productId,
                        timestampMillis: timestampMillis,
                        username: usernames,
                        currency: currency,
                        balanceBefore: balanceUser,
                        balanceAfter: balanceNow
                    });
                }
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/game/checkBalance 
exports.GameCheckBalance = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const sessionToken = req.body.sessionToken;
    if (sessionToken != '') {
        let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete ='N' AND tokenplaygame ='${sessionToken}'`;
        try {
            connection.query(spl, (error, results) => {
                if (error) { console.log(error) }
                else {
                    if (results.length >= 1) {
                        const balanceUser = parseFloat(results[0].credit);
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balance: balanceUser,
                            username: usernameGame
                        });
                    } else {
                        res.status(201).json({
                            id: id,
                            statusCode: 30001,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balance: 0,
                            username: usernameGame
                        });
                    }
                }
            })
        } catch (err) {
            err.statusCode = 500;
            res.json({ status: "Not Data Request Body." });
        }
    } else {
        let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete ='N'`;
        try {
            connection.query(spl, (error, results) => {
                if (error) { console.log(error) }
                else {
                    if (results.length >= 1) {
                        const balanceUser = parseFloat(results[0].credit);
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balance: balanceUser,
                            username: usernameGame
                        });
                    } else {
                        res.status(201).json({
                            id: id,
                            statusCode: 30001,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balance: 0,
                            username: usernameGame
                        });
                    }
                }
            })
        } catch (err) {
            err.statusCode = 500;
            res.json({ status: "Not Data Request Body." });
        }
    }
};

http://localhost:5000/post/game/placeBets 
exports.GamePlaceBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N' ORDER BY phonenumber ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                //console.log(results)
                let status = 0;
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const idbetPlay = txnsGame[0].id;
                let balanceNow = balanceUser - betPlay;
                //console.log(balanceUser, betPlay, 'GamePlaceBets');
                if (balanceUser >= 0 && balanceUser > betPlay) {
                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}', idplaygame  = '${idbetPlay}' 
                    WHERE phonenumber ='${usernameGame}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        if (error) { console.log(error) }
                        else {
                            res.status(201).json({
                                id: id,
                                statusCode: 0,
                                timestampMillis: timestampMillis,
                                productId: productId,
                                currency: currency,
                                balanceBefore: balanceUser,
                                balanceAfter: balanceNow,
                                username: usernameGame
                            });
                        }
                    });
                }
                else {
                    balanceNow = 0;
                    status = 10002;
                    res.status(201).json({
                        id: id,
                        statusCode: 10002,
                        timestampMillis: timestampMillis,
                        productId: productId,
                        currency: currency,
                        balanceBefore: balanceUser,
                        balanceAfter: balanceNow,
                        username: usernameGame
                    });
                }
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

function convertToTwoDecimalPlaces(number) {
    if (!isNaN(number) && Number(number) % 1 !== 0) {
        const strNumber = number.toString();
        const decimalPlaces = strNumber.split('.')[1].length;
        if (decimalPlaces > 2) {
            return Math.round(number); // แปลงเป็นจำนวนเต็ม
        }
    }
    return number; // คืนค่าเดิมถ้าไม่เข้าเงื่อนไข
}
http://localhost:5000/post/game/settleBets 
exports.GameSettleBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    const userAgent = req.headers['user-agent'];
    const userAgentt = req.useragent;
    const roundId = txnsGame[0].roundId;

    let splTest = `SELECT credit FROM member 
    WHERE phonenumber ='${usernameGame}' AND status_delete='N' AND roundId = '${roundId}' AND status = 'Y'`;

    try {
        connection.query(splTest, (error, resultsstart) => {
            if (error) { console.log(error) }
            else {
                if (resultsstart.length <= 0) {
                    let spl = `SELECT credit, turnover, gameplayturn, playgameuser, tokenplaygame, bet_latest, idplaygame FROM member 
                    WHERE phonenumber ='${usernameGame}' AND status_delete='N' AND status = 'Y'`;

                    connection.query(spl, (error, results) => {
                        if (error) { console.log(error) }
                        else {
                            const namegame = results[0].playgameuser;
                            const balanceUser = parseFloat(results[0].credit);
                            const betAmount = txnsGame[0].payoutAmount;
                            const betPlay = txnsGame[0].betAmount;
                            const idbetPlay = txnsGame[0].id;
                            let status = 0;
                            //console.log(balanceUser, betAmount, betPlay, 'GameSettleBets');
                            if (balanceUser >= 0 && balanceUser >= betPlay) {
                                if (betPlay === 0 && betAmount === betPlay) {
                                    res.status(201).json({
                                        id: id,
                                        statusCode: 0,
                                        timestampMillis: timestampMillis,
                                        productId: productId,
                                        currency: currency,
                                        balanceBefore: convertToTwoDecimalPlaces(balanceUser),
                                        balanceAfter: convertToTwoDecimalPlaces(balanceUser),
                                        username: usernameGame
                                    });
                                } else {
                                    if (results[0].idplaygame === idbetPlay){
                                        console.log(balanceUser, betPlay, betAmount, results[0].idplaygame, idbetPlay, 'NO')
                                        let balanceNow = balanceUser + betAmount;
                                        let balanceturnover = hasSimilarData(results[0].gameplayturn, productId, results[0].turnover, betPlay)
                                        const post = {
                                            username: usernameGame, gameid: productId, bet: betPlay, win: betAmount, balance_credit: balanceNow,
                                            userAgent: userAgent, platform: userAgentt, namegame: namegame, trans_id: txnsGame[0].tokenplaygame
                                        }
                                        let repost = repostGame.uploadLogRepostGame(post)
                                        const sql_update = `UPDATE member set credit='${balanceNow}', turnover='${balanceturnover}',
                                        roundId = '${roundId}' WHERE phonenumber ='${usernameGame}'`;
    
                                        connection.query(sql_update, (error, resultsGame) => {
                                            if (error) { console.log(error) }
                                            else {
                                                res.status(201).json({
                                                    id: id,
                                                    statusCode: 0,
                                                    timestampMillis: timestampMillis,
                                                    productId: productId,
                                                    currency: currency,
                                                    balanceBefore: convertToTwoDecimalPlaces(balanceUser),
                                                    balanceAfter: convertToTwoDecimalPlaces(balanceNow),
                                                    username: usernameGame
                                                });
                                            }
                                        });
                                    } else {
                                        console.log(balanceUser, betPlay, betAmount, results[0].idplaygame, idbetPlay, 'Yes')
                                        let balanceNow = (balanceUser - betPlay) + betAmount;
                                        let balanceturnover = hasSimilarData(results[0].gameplayturn, productId, results[0].turnover, betPlay)
                                        //console.log("BetUp...." + betPlay, betAmount, balanceUser, balanceNow);
                                        const post = {
                                            username: usernameGame, gameid: productId, bet: betPlay, win: betAmount, balance_credit: balanceNow,
                                            userAgent: userAgent, platform: userAgentt, namegame: namegame, trans_id: txnsGame[0].tokenplaygame
                                        }
                                        let repost = repostGame.uploadLogRepostGame(post)
                                        //console.log(balanceUser, balanceNow)
                                        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}', turnover='${balanceturnover}',
                                        roundId = '${roundId}' WHERE phonenumber ='${usernameGame}'`;
    
                                        connection.query(sql_update, (error, resultsGame) => {
                                            if (error) { console.log(error) }
                                            else {
                                                res.status(201).json({
                                                    id: id,
                                                    statusCode: 0,
                                                    timestampMillis: timestampMillis,
                                                    productId: productId,
                                                    currency: currency,
                                                    balanceBefore: convertToTwoDecimalPlaces(balanceUser),
                                                    balanceAfter: convertToTwoDecimalPlaces(balanceNow),
                                                    username: usernameGame
                                                });
                                            }
                                        });
                                    }
                                }
                            }
                            else {
                                status = 10002;
                                res.status(201).json({
                                    id: id,
                                    statusCode: 10002,
                                    timestampMillis: timestampMillis,
                                    productId: productId,
                                    // currency: currency,
                                    // balanceBefore: convertToTwoDecimalPlaces(balanceUser),
                                    // balanceAfter: convertToTwoDecimalPlaces(balanceUser),
                                    // username: usernameGame
                                });
                            }
                        }
                    })
                } else {
                    const balanceUser = parseFloat(resultsstart[0].credit);
                    res.status(201).json({
                        id: id,
                        statusCode: 0,
                        timestampMillis: timestampMillis,
                        productId: productId,
                        currency: currency,
                        balanceBefore: convertToTwoDecimalPlaces(balanceUser),
                        balanceAfter: convertToTwoDecimalPlaces(balanceUser),
                        username: usernameGame
                    });
                }
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/game/cancelBets 
exports.GameCancelBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = balanceUser + betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${txnsGame[0].betAmount}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/game/adjustBets 
exports.GameAdjustBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    //username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = balanceUser - betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${txnsGame[0].betAmount}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/game/unsettleBets 
exports.GameUnsettleBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit, tokenplaygame FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                let spl_game = `SELECT * FROM repostgame WHERE balance_credit ='${balanceUser}' AND trans_id = ${results[0].tokenplaygame} `;
                connection.query(spl_game, (error, results_game) => {
                    if (error) { console.log(error) }
                    else {
                        console.log(results_game.length)
                        let balanceAfter = (balanceUser - results_game[0].win) + results_game[0].bet
                        console.log(balanceAfter, balanceUser)
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceAfter,
                            username: usernameGame
                        });
                    }
                })
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/game/winRewards 
exports.GameWinRewards = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const betpayoutAmount = txnsGame[0].payoutAmount;
                const balanceNow = balanceUser + betpayoutAmount - betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/game/placeTips
exports.GamePayTips = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = balanceUser - betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/game/cancelTips
exports.GameTipsCancel = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = balanceUser + betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/game/voidBets
exports.GameVoidBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const betpayoutAmount = txnsGame[0].payoutAmount;
                const balanceNow = balanceUser + betpayoutAmount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

/*------------------------------------------------------------------------------------------------------------------*/
http://localhost:5000/post/CQ9/transaction/balance/:account
exports.GameCheckBalanceCQ9 = async (req, res) => {
    const usernameGame = req.params.account;
    const today = new Date();
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    data: {
                        balance: balanceUser,
                        currency: 'THB'
                    },
                    status: {
                        code: '0',
                        message: 'Success',
                        datetime: today
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/CQ9/transaction/game/bet
exports.GameBetCQ9 = async (req, res) => {
    const usernameGame = req.body.account;
    const amount = req.body.amount;
    const eventTime = req.body.eventTime;
    const gamecode = req.body.gamecode;
    const gamehall = req.body.gamehall;
    const mtcode = req.body.mtcode;
    const platform = req.body.platform;
    const roundid = req.body.roundid;
    const userAgent = req.headers['user-agent'];
    let spl = `SELECT credit, playgameuser FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const amountGame = parseFloat(amount);
                const balanceNow = balanceUser - amountGame
                const namegame = (results[0].playgameuser);
                const post = {
                    username: usernameGame, gameid: "CQ9V2", bet: amountGame, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: mtcode, namegame: namegame
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)

                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amountGame}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            data: {
                                balance: balanceNow,
                                currency: 'THB'
                            },
                            status: {
                                code: '0',
                                message: 'Success',
                                datetime: eventTime
                            }
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/CQ9/transaction/game/endround
exports.GameEndRoundCQ9 = async (req, res) => {
    const usernameGame = req.body.account;
    const createTime = req.body.createTime;
    const gamecode = req.body.gamecode;
    const gamehall = req.body.gamehall;
    const platform = req.body.platform;
    const roundid = req.body.roundid;
    const userAgent = req.headers['user-agent'];
    const jsonString = req.body.data;
    const jsonObject = JSON.parse(jsonString);
    const dataArray = JSON.parse(jsonObject.data);
    const mtcode = dataArray[0].mtcode;
    const amount = dataArray[0].amount;
    const eventtime = dataArray[0].eventtime;
    const validbet = dataArray[0].validbet;

    let spl = `SELECT credit, bet_latest FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const amountGame = parseFloat(amount);
                const balanceNow = balanceUser + amountGame

                const post = {
                    username: usernameGame, gameid: "CQ9V2", bet: results[0].bet_latest, win: amountGame, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: mtcode
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)

                const sql_update = `UPDATE member set credit='${balanceNow}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            data: {
                                balance: balanceNow,
                                currency: 'THB'
                            },
                            status: {
                                code: '0',
                                message: 'Success',
                                datetime: createTime
                            }
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/CQ9/transaction/game/rollout
exports.GameRolloutCQ9 = async (req, res) => {
    const usernameGame = req.body.account;
    const amount = req.body.amount;
    const eventTime = req.body.eventTime;
    const gamecode = req.body.gamecode;
    const gamehall = req.body.gamehall;
    const mtcode = req.body.mtcode;
    const roundid = req.body.roundid;

    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    data: {
                        balance: balanceUser,
                        currency: 'THB'
                    },
                    status: {
                        code: '0',
                        message: 'Success',
                        datetime: eventTime
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/CQ9/transaction/game/takeall
exports.GameTakeAllCQ9 = async (req, res) => {
    const usernameGame = req.body.account;
    const eventTime = req.body.eventTime;
    const gamecode = req.body.gamecode;
    const gamehall = req.body.gamehall;
    const mtcode = req.body.mtcode;
    const roundid = req.body.roundid;

    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    data: {
                        balance: balanceUser,
                        amount: 0,
                        currency: 'THB'
                    },
                    status: {
                        code: '0',
                        message: 'Success',
                        datetime: eventTime
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};
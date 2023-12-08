const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const os = require('os');
const axios = require('axios'); //npm install axios
const repostGame = require('./repostGame')
require('dotenv').config()

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

const crypto = require('crypto');

function generateRandomPassword(length) {
    const charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let password = '';

    for (let i = 0; i < length; i++) {
        const randomIndex = crypto.randomInt(0, charset.length);
        password += charset[randomIndex];
    }

    return password;
}

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

exports.saveTestGame = async (require, response) => {
    const stateGame = require.params.state;
    const user_id = require.params.user_id;
    const bet = require.params.bet;
    const game_id = require.params.game_id;
    const choose = require.params.choose;
    //const authHeader = require.body.Authorization;
    const authHeader = require.params.token;
    const passwordRound = require.body.passwordRound;
    const userAgent = require.headers['user-agent'];
    const userAgentt = require.useragent;
    //console.log(authHeader);
    const today = new Date();
    const date = today.toISOString().slice(0, 10);
    switch (stateGame) {
        case '0':
            let state_Start = stareOne(authHeader)
                .then(data => {
                    const randomPassword = generateRandomPassword(13);
                    const multipliers = [1.84, 2.76, 3.68, 4.60];
                    const allBalloonId = [0, 1, 2, 3, 4];
                    const idUser = data.id;

                    let sql_insert = `INSERT INTO user_play (member_id, game_id, bet, win, tiles, winline, winstyle, winCount, credit, created_at, game_feespin) 
                 value ('${idUser}','${game_id}','${bet}','${0}','${allBalloonId}','${0}','${randomPassword}','${0}','${data.credit}',now(), '${false}')`;
                    connection.query(sql_insert, (error, result_feesPin) => {
                        if (error) {
                            response.sendStatus(500);
                            return;
                        } else {
                            console.log(data);
                            response.json({
                                multipliers: multipliers,
                                gameVersion: 1.0,
                                balance: data.credit,
                                passwordRound: randomPassword,
                                userId: idUser
                            });
                            response.end();
                        }
                    });
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            break;
        case '3':
            const randomPassword = generateRandomPassword(13);

            const multipliers = [1.84, 2.76, 3.68, 4.60]
            const allBalloonId = [0, 1, 2, 3, 4]
            let sql_insert = `INSERT INTO user_play (member_id, game_id, bet, win, tiles, winline, winstyle, winCount, credit, created_at, game_feespin) 
                value ('${user_id}','${game_id}','${bet}','${0}','${allBalloonId}','${0}','${randomPassword}','${0}','${0}',now(), '${false}')`;
            connection.query(sql_insert, (error, result_feesPin) => {
                if (error) {
                    response.sendStatus(500);
                    return;
                } else {
                    response.json({
                        multipliers: multipliers,
                        gameVersion: 1.0,
                        passwordRound: randomPassword
                    });
                    response.end();
                }
            });
            break;
        case '1':
            let state_delete = DeleteBalloon(passwordRound)
                .then(data => {
                    const arrayBalloonid = data.allBalloonId;
                    const deleteBalloon = data.deleteBalloonId;
                    response.json({
                        allBalloonId: arrayBalloonid,
                        deleteBalloonId: deleteBalloon,
                        passwordRound: passwordRound
                    });
                    response.end();
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            break;
        case '2':
            let state_shoot = ShootBalloon(user_id, bet, choose, passwordRound)
                .then(data => {
                    const winBalloonId = data.winBalloonId;
                    const allBalloonId = data.allBalloonId;
                    const isWin = data.isWinUser;
                    const win = data.winGame;
                    const balance = data.balanceNow;

                    let spl = `SELECT * FROM member WHERE id ='${user_id}' AND status_delete='N'`;
                    try {
                        connection.query(spl, (error, results) => {
                            const post = {
                                username: results[0].username, gameid: 'DOGZILLA', bet: bet, win: win, balance_credit: balance, userAgent: userAgent, platform: userAgentt
                            }
                            let repost = repostGame.uploadLogRepostGame(post)
                        })
                    }
                    catch (err) {
                        err.statusCode = 500;
                        res.json({ status: "Not Data Request Body." });
                    }
                    response.json({
                        winBalloonId: winBalloonId,
                        allBalloonId: allBalloonId,
                        isWin: isWin,
                        win: win,
                        balance: balance
                    });
                    response.end();
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            break;
    }
};

async function stareOne(token) {
    try {
        const response = await axios.post("https://dogzilla.live/post/convertToken", {
            Authorization: token,
        });

        const jsArray = {
            id: response.data.id,
            credit: response.data.credit,
            name: response.data.name,
        };
        return jsArray;
    } catch (error) {
        console.error("Error:", error);
        throw error; // Re-throw the error to handle it elsewhere, if needed
    }
}

async function DeleteBalloon(paaswordRound) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT tiles FROM user_play WHERE winstyle='${paaswordRound}'`;
        connection.query(sql, (error, results) => {
            if (error) {
                response.sendStatus(500);
                return;
            } else {
                const allBalloonId = results[0].tiles;
                const tilesArray = allBalloonId.split(',').map(Number);

                let r = Math.random()//between 0 (inclusive) and 1 (exclusive)
                let rand = Math.floor(r * tilesArray.length);//สุ่ม index ตามจำนวนลูกโป่งที่เหลืออยู่

                deleteBalloonId = tilesArray[rand]//เก็บ id ที่ถูกลบไป
                tilesArray.splice(rand, 1)//remove from array
                const tilesString = tilesArray.join(',');

                const sql_update = `UPDATE user_play set tiles='${tilesString}' WHERE winstyle='${paaswordRound}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    const jsArray = {
                        allBalloonId: tilesArray,
                        deleteBalloonId: deleteBalloonId
                    };
                    resolve(jsArray);
                });
            }
        });
    })

}

function ShootBalloon(userId, bet, choose, paaswordRound) {
    return new Promise((resolve, reject) => {
        console.log(userId, bet, choose, paaswordRound);
        let sql_check = `SELECT * FROM member WHERE id ='${userId}' AND status_delete='N'`;
        connection.query(sql_check, (error, results_check) => {
            if (results_check.length > 0) {
                let user_credit = results_check[0].credit;
                let turnover = results_check[0].turnover;
                if (user_credit >= bet) {
                    const multipliers = [1.84, 2.76, 3.68, 4.60]//ตัวคูณตอนชนะ
                    //when shoot
                    let winBalloonId//id ของลูกโป่งที่ชนะ
                    let isWin//ชนะมั้ย
                    let win = 0//เงินที่ชนะในรอบนี้

                    user_credit -= bet//หักเงิน

                    let postTurnover = turnover -= bet;

                    if (postTurnover < 0) {
                        postTurnover = 0;
                    }

                    let sql = `SELECT tiles FROM user_play WHERE winstyle='${paaswordRound}'`;
                    connection.query(sql, (error, results) => {
                        if (error) {
                            response.sendStatus(500);
                            return;
                        } else {
                            const allBalloonId = results[0].tiles;
                            const tilesArray = allBalloonId.split(',').map(Number);

                            let r = Math.random()//between 0 (inclusive) and 1 (exclusive)
                            let rand = Math.floor(r * tilesArray.length);//สุ่ม index ตามจำนวนลูกโป่งที่เหลืออยู่

                            winBalloonId = tilesArray[rand]//เก็บ id ที่ชนะไว้
                            //tilesArray.splice(rand, 1)//remove from array
                            const tilesString = tilesArray.join(',');
                            const num = parseInt(choose, 10);
                            //console.log(winBalloonId , num)
                            let balanceturnover = hasSimilarData(results_check[0].gameplayturn, 'DOGZILLA', results_check[0].turnover, bet)
                            if (winBalloonId === num) {
                                win = bet * multipliers[tilesArray.length - 2];//win = bet*ตัวคูณตามจำนวนลูกโป่งที่เหลืออยู่
                                isWin = true;
                                user_credit += win;//บวกเงิน

                                const sql_update = `UPDATE user_play set tiles='${tilesString}', win ='${win}', winline ='${winBalloonId}', credit ='${user_credit}', bet ='${bet}'
                                WHERE winstyle='${paaswordRound}'`;
                                connection.query(sql_update, (error, resultsGame) => {
                                    if (error) { console.log(error) }
                                    else {
                                        const sql_update = `UPDATE member set credit ='${user_credit}', bet_latest ='${bet}', turnover ='${balanceturnover}'
                                        WHERE id ='${userId}'`;
                                        connection.query(sql_update, (error, resultsGame) => {
                                            if (error) { console.log(error) }
                                            else {
                                                const jsArray = {
                                                    balanceNow: user_credit,
                                                    winBalloonId: winBalloonId,
                                                    isWinUser: isWin,
                                                    winGame: win,
                                                    allBalloonId: tilesArray,
                                                };

                                                resolve(jsArray);
                                            }
                                        })
                                    }
                                });
                            }
                            else {
                                win = 0;
                                isWin = false;
                                const jsArray = {
                                    balanceNow: user_credit,
                                    winBalloonId: winBalloonId,
                                    isWinUser: isWin,
                                    winGame: win,
                                    allBalloonId: tilesArray,
                                };
                                const sql_update = `UPDATE user_play set tiles='${tilesString}', win ='${win}', winline ='${jsArray.winBalloonId}', credit ='${user_credit}', bet ='${bet}'
                                WHERE winstyle='${paaswordRound}'`;
                                connection.query(sql_update, (error, resultsGame) => {
                                    if (error) { console.log(error) }
                                    else {
                                        const sql_update = `UPDATE member set credit ='${user_credit}', bet_latest ='${bet}', turnover ='${balanceturnover}'
                                        WHERE id ='${userId}'`;
                                        connection.query(sql_update, (error, resultsGame) => {
                                            if (error) { console.log(error) }
                                            else {
                                                resolve(jsArray);
                                            }
                                        })
                                    }
                                });
                            }
                        }
                    });
                } else {
                    resolve('ยอดเงินไม่เพียงพอ')
                }
            }
        })
    })
}

function ResetData() {
    allBalloonId = [0, 1, 2, 3, 4]
    isWin = undefined
    deleteBalloonId = undefined
    winBalloonId = undefined
    let bet = undefined
    let win = 0
}


/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
exports.GameArcade = async (require, response) => {
    const stateGame = require.params.state;
    const user_id = require.params.user_id;
    const bet = require.params.bet;
    const game_id = require.params.game_id;
    const chooseFloorId = require.params.chooseFloorId;
    const multipliers = [1.20, 1.62, 2.18, 4.40, 8.91, 18.01, 72.82, 300.00]
    const authHeader = require.params.token;
    const passwordRound = require.body.passwordRound;
    const userAgent = require.headers['user-agent'];
    const userAgentt = require.useragent;
    //console.log(authHeader);
    const today = new Date();
    const date = today.toISOString().slice(0, 10);
    switch (stateGame) {
        case '0':
            let state_Start = stareOne(authHeader)
                .then(data => {
                    const randomPassword = generateRandomPassword(15);
                    const idUser = data.id;
                    let sql_check = `SELECT * FROM user_play WHERE member_id ='${idUser}' AND game_feespin ='${true}' AND game_id = '${game_id}'`;
                    connection.query(sql_check, (error, results_check) => {
                        if (results_check.length > 0) {
                            response.json({
                                balance: data.credit,
                                passwordRound: results_check[0].winstyle,
                                userId: idUser,
                                multipliers: multipliers,
                                winStreak: results_check[0].winCount,
                                gamebet: results_check[0].bet
                            });
                            response.end();
                        } else {
                            let sql_insert = `INSERT INTO user_play (member_id, game_id, bet, win, tiles, winline, winstyle, winCount, credit, created_at, game_feespin) 
                 value ('${idUser}','${game_id}','${bet}','${0}','${0}','${0}','${randomPassword}','${0}','${data.credit}',now(), '${true}')`;
                            connection.query(sql_insert, (error, result_feesPin) => {
                                if (error) {
                                    response.sendStatus(500);
                                    return;
                                } else {
                                    console.log(data);
                                    response.json({
                                        balance: data.credit,
                                        passwordRound: randomPassword,
                                        userId: idUser,
                                        multipliers: multipliers,
                                        winStreak: 0,
                                    });
                                    response.end();
                                }
                            });
                        }
                    });
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            break;
        case '1':
            let state_reset = resetGame(user_id, game_id, bet)
                .then(data => {
                    response.json({
                        passwordRound: data.randomPassword,
                        userId: user_id
                    });
                    response.end();
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            break;
        case '2':
            let state_collect = State_Choose(user_id, bet, chooseFloorId, passwordRound, multipliers)
                .then(data => {
                    console.log(data, 'win')
                    if (data.isChooseFloor === true) {
                        if (data.streak !== 'EndGame') {
                            response.json({
                                isWin: data.isChooseFloor,
                                winStreak: data.winStreak,
                                allWinFloorId: data.isWin.allWinFloorId,
                                chooseFloorId: chooseFloorId,
                                balance: data.credit,
                                win: data.win,
                            });
                            response.end();
                        } else {
                            console.log('on')
                            let state_End = EndGame(passwordRound, data.win, data.winStreak, user_id, bet, data.isChooseFloor, game_id, data.postTurnover, userAgent, userAgentt)
                                .then(dataEnd => {
                                    response.json({
                                        isWin: data.isChooseFloor,
                                        passwordRound: dataEnd.passwordRound,
                                        win: data.win,
                                        balance: dataEnd.credit,
                                        winStreak: data.winStreak,
                                        allWinFloorId: data.isWin.allWinFloorId,
                                    });
                                }).catch(error => {
                                    console.error("Error:", error);
                                });
                        }
                    } else {
                        // let state_reset = resetGame(user_id, game_id, bet, data.credit)
                        //     .then(dataReset => {
                        //         response.json({
                        //             passwordRound: dataReset.passwordRound,
                        //             balance: data.credit,
                        //             winStreak: data.winStreak,
                        //             allWinFloorId: data.isWin.allWinFloorId,
                        //             isWin: data.isChooseFloor,
                        //         });
                        //         response.end();
                        //     })
                        //     .catch(error => {
                        //         console.error("Error:", error);
                        //     });

                        let state_End = EndGame(passwordRound, 0, data.winStreak, user_id, bet, data.isChooseFloor, game_id, data.postTurnover, userAgent, userAgentt)
                            .then(dataEnd => {
                                console.log(data.isWin.allWinFloorId);
                                response.json({
                                    // isWin: data.isChooseFloor,
                                    // passwordRound: dataEnd.passwordRound,
                                    // win: data.win,
                                    // balance: dataEnd.credit,
                                    // winStreak: data.winStreak,
                                    // allWinFloorId: data.isWin.allWinFloorId,
                                    passwordRound: dataEnd.passwordRound,
                                    balance: data.credit,
                                    winStreak: data.winStreak,
                                    allWinFloorId: data.isWin.allWinFloorId,
                                    isWin: data.isChooseFloor,
                                });
                            }).catch(error => {
                                console.error("Error:", error);
                            });
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            break;
        case '3':
            let sql_check = `SELECT * FROM user_play WHERE winstyle='${passwordRound}' AND game_feespin ='${true}'`;
            connection.query(sql_check, (error, results_check) => {
                console.log(results_check[0].win);
                let state_End = EndGame(passwordRound, results_check[0].win, results_check[0].winCount, user_id, bet, results_check[0].tiles, game_id, 0, userAgent, userAgentt)
                    .then(data => {
                        console.log(data, 'run');
                        response.json({
                            passwordRound: data.passwordRound,
                            win: results_check[0].win,
                            balance: data.balance,
                            winStreak: results_check[0].winCount,
                        });
                        response.end();
                    })
                    .catch(error => {
                        console.error("Error:", error);
                    });
            });

            break;
    }
};

function State_Choose(userId, bet, chooseFloorId, paaswordRound, multipliers) {
    return new Promise((resolve, reject) => {
        const allWinFloorId = []
        let sql_check = `SELECT * FROM member WHERE id ='${userId}' AND status_delete='N'`;
        connection.query(sql_check, (error, results_check) => {
            if (results_check.length > 0) {
                let user_credit = results_check[0].credit;
                let turnover = results_check[0].turnover;
                const betGame = parseFloat(bet);

                if (user_credit >= bet && user_credit > 0) {
                    let sql_game = `SELECT * FROM user_play WHERE winstyle='${paaswordRound}' AND game_feespin = '${true}'`;
                    connection.query(sql_game, (error, sql_gameRes) => {
                        let winStreak = sql_gameRes[0].winCount;
                        let isWin//ชนะมั้ย

                        if (winStreak == 0) {
                            let credit = user_credit - betGame//หักเงิน

                            let balanceturnover = hasSimilarData(results_check[0].gameplayturn, 'DOGZILLA', results_check[0].turnover, betGame)

                            const sql_update = `UPDATE member set credit ='${credit}', bet_latest ='${bet}', turnover ='${balanceturnover}'
                            WHERE id ='${userId}'`;
                            connection.query(sql_update, (error, resultsGame) => {
                                isWin = RandomWin(allWinFloorId, paaswordRound, winStreak, betGame)
                                    .then(dataRandom => {
                                        let isChooseFloor = ChooseFloor(chooseFloorId, winStreak, paaswordRound, betGame, multipliers, allWinFloorId, sql_gameRes[0].win)
                                            .then(dataChoose => {
                                                const sql_update = `UPDATE user_play set bet = '${betGame}', credit = '${credit}', game_feespin = '${dataChoose.isWin}' 
                                                WHERE winstyle='${paaswordRound}' AND game_feespin = '${true}'`;
                                                connection.query(sql_update, (error, resultsGame) => {
                                                    const jsArray = {
                                                        streak: dataChoose.streak,
                                                        isWin: dataRandom,
                                                        isChooseFloor: dataChoose.isWin,
                                                        win: dataChoose.win,
                                                        postTurnover: balanceturnover,
                                                        credit: credit,
                                                        winStreak: dataChoose.winStreak
                                                    };
                                                    //console.log(jsArray);
                                                    resolve(jsArray)
                                                })
                                            })
                                            .catch(error => {
                                                console.error("Error:", error);
                                            });
                                    })
                                    .catch(error => {
                                        console.error("Error:", error);
                                    });
                            })
                        }
                        if (winStreak > 0) {
                            let balanceturnover = hasSimilarData(results_check[0].gameplayturn, 'DOGZILLA', results_check[0].turnover, 0)
                            let isWin = RandomWin(allWinFloorId, paaswordRound, winStreak)
                                .then(dataRandom => {
                                    let isChooseFloor = ChooseFloor(chooseFloorId, winStreak, paaswordRound, betGame, multipliers, dataRandom.allWinFloorId, sql_gameRes[0].win)
                                        .then(dataChoose => {
                                            const sql_update = `UPDATE user_play set game_feespin = '${dataChoose.isWin}' 
                                            WHERE winstyle='${paaswordRound}' AND game_feespin = '${true}'`;
                                            connection.query(sql_update, (error, resultsGame) => {
                                                const jsArray = {
                                                    streak: dataChoose.streak,
                                                    isWin: dataRandom,
                                                    isChooseFloor: dataChoose.isWin,
                                                    win: dataChoose.win,
                                                    postTurnover: balanceturnover,
                                                    credit: user_credit,
                                                    winStreak: dataChoose.winStreak
                                                };
                                                resolve(jsArray)
                                            })
                                        })
                                        .catch(error => {
                                            console.error("Error:", error);
                                        });
                                })
                                .catch(error => {
                                    console.error("Error:", error);
                                });
                        }
                        if (winStreak >= 8) {
                            const jsArray = {
                                streak: 'EndGame',
                            };
                            resolve(jsArray)
                        }
                    })
                } else {
                    resolve('ยอดเงินไม่เพียงพอ')
                }
            }
        })
    })
}

async function RandomWin(allWinFloorId, paaswordRound, winStreak, bet) {
    return new Promise(async (resolve, reject) => {
        try {
            let nWinFloor = await UpdateLevelData(winStreak);
            while (allWinFloorId.length < nWinFloor) {
                let rand = Math.floor(Math.random() * 4);
                if (allWinFloorId.indexOf(rand) == -1) {
                    allWinFloorId.push(rand);
                    if (allWinFloorId.length == nWinFloor) {
                        const sql_update = `UPDATE user_play set winline ='${allWinFloorId}' WHERE winstyle='${paaswordRound}' AND game_feespin = '${true}'`;
                        connection.query(sql_update, (error, resultsGame) => {
                            if (error) {
                                console.log(error);
                            } else {
                                const jsArray = {
                                    allWinFloorId: allWinFloorId,
                                };
                                resolve(jsArray); // คืนค่า rand เมื่อ query สำเร็จ
                            }
                        });
                    }
                }
            }
        } catch (error) {
            console.error("Error:", error);
            reject(error);
        }
    });
}

function ChooseFloor(choose, winStreak, paaswordRound, gameBet, multipliers, allWinFloorId, winGame) {
    return new Promise((resolve, reject) => {
        let isWin = false;
        let winStreakChoose = winStreak
        const wineArr = parseFloat(winStreakChoose);
        let wine = wineArr + 1;
        let matched = false;

        for (floorId of allWinFloorId) { //ลูปตามจำนวนพื้นที่ชนะ
            if (floorId == choose) { //ชนะ ถ้าเจอพื้นตรงกับที่เลือก
                matched = true;
                let win = gameBet * multipliers[wineArr];
                isWin = true;
                //let winGameT = win + winGame
                //console.log(winGameT);
                const sql_update = `UPDATE user_play set winCount ='${wine}', win ='${win}', tiles ='${choose}'
                WHERE winstyle='${paaswordRound}' AND game_feespin = '${true}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) {
                        console.log(error);
                    } else {
                        const jsArray = {
                            isWin: isWin,
                            win: win,
                            winStreak: wine,
                            streak: 'WinGame'
                        };
                        resolve(jsArray);
                    }
                });
                break; // หยุด loop for เมื่อเข้าเงื่อนไขนี้
            }
        }
        if (!matched) {
            const sql_update = `UPDATE user_play set winCount ='${wine}', win ='${0}', tiles ='${choose}'
            WHERE winstyle='${paaswordRound}' AND game_feespin = '${true}'`;
            connection.query(sql_update, (error, resultsGame) => {
                if (error) {
                    console.log(error);
                } else {
                    const jsArray = {
                        isWin: isWin,
                        win: 0,
                        winStreak: wineArr,
                        streak: 'EndGame'
                    };
                    resolve(jsArray);
                }
            });
        }
    })
}

function UpdateLevelData(winStreak) {
    return new Promise((resolve, reject) => {
        let nWinFloor = 0;
        //console.log(winStreak, nWinFloor);
        switch (winStreak) {
            case '0': nWinFloor = 3;
                break;//level 1
            case '1': nWinFloor = 3;
                break;//level 2
            case '2': nWinFloor = 3;
                break;//level 3
            case '3': nWinFloor = 2;
                break;//level 4
            case '4': nWinFloor = 2;
                break;//level 5
            case '5': nWinFloor = 2;
                break;//level 6
            case '6': nWinFloor = 1;
                break;//level 7
            case '7': nWinFloor = 1;
                break;//level 8
        }
        resolve(nWinFloor);
    })
}

function EndGame(passwordRound, winGame, winStreak, user_id, bet, isWin, game_id, postTurnover, userAgent, userAgentt) {
    return new Promise(async (resolve, reject) => {
        const win = winGame;

        //console.log(bet, winGame)
        let spl = `SELECT * FROM member WHERE id ='${user_id}' AND status_delete='N'`;
        try {
            connection.query(spl, (error, results) => {
                const post = {
                    username: results[0].username, gameid: 'DOGZILLA', bet: bet, win: win, balance_credit: results[0].credit, userAgent: userAgent, platform: userAgentt
                }
                //console.log(post);

                let repost = repostGame.uploadLogRepostGame(post)
                let credit = results[0].credit + win;

                const sql_update = `UPDATE member set credit ='${credit}', bet_latest ='${bet}' WHERE id ='${user_id}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        const sql_updateUser_play = `UPDATE user_play set game_feespin = '${false}' WHERE winstyle='${passwordRound}'`;
                        connection.query(sql_updateUser_play, (error, resultsGame) => {
                            let state_reset = resetGame(user_id, game_id, bet, credit)
                                .then(data => {
                                    //console.log(data);
                                    const jsArray = {
                                        passwordRound: data.passwordRound,
                                        win: win,
                                        balance: credit,
                                    };
                                    resolve(jsArray);
                                })
                                .catch(error => {
                                    console.error("Error:", error);
                                });
                        })
                    }
                })
            })
        }
        catch (err) {
            err.statusCode = 500;
            res.json({ status: "Not Data Request Body." });
        }
    });
}

function resetGame(user_id, game_id, bet, credit) {
    return new Promise((resolve, reject) => {
        const randomPassword = generateRandomPassword(15);
        let sql_insert = `INSERT INTO user_play (member_id, game_id, bet, win, tiles, winline, winstyle, winCount, credit, created_at, game_feespin) 
            value ('${user_id}','${game_id}','${bet}','${0}','${0}','${0}','${randomPassword}','${0}','${credit}',now(), '${true}')`;
        connection.query(sql_insert, (error, result_feesPin) => {
            if (error) {
                response.sendStatus(500);
                return;
            } else {
                const jsArray = {
                    passwordRound: randomPassword,
                };
                resolve(jsArray);
            }
        });
    })
}

const express = require('express');
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const md5 = require('md5');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const cron = require('node-cron');
const app = express();
const Finance = require('./Finance')
const moment = require('moment-timezone')

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

    static promotionPlayLoseMoneyBack(post) {
        console.log('Automatic function is running at 03:33 PM.');
        cron.schedule('54 15 * * *', () => {
            automaticFunctionTest();
        });
    }

    static promotionDeposit(quantityUser, dataUser, idPromotion, bill_number, totaltopup, nameimg, imgBank,
        statusFinance, qrcodeData, transRef, destinationAccount, destinationAccountNumber, formattedDate, formattedNumber, actualize) {
        return new Promise((resolve, reject) => {
            let ipuser = "192.168.1.1"
            if (dataUser.promotionuser.includes("ไม่ได้รับโปรโมชั่น")) {
                try {
                    let sql_Promotion = `SELECT * FROM creditpromotion WHERE id ='${idPromotion}'`;
                    connection.query(sql_Promotion, (error, resultPromotion) => {
                        if (error) {
                            console.log(error)
                        } else {
                            let balancebunus = 0
                            let data_type = resultPromotion[0].data_type; let reset = resultPromotion[0].reset;
                            let receiving_data_type = resultPromotion[0].receiving_data_type; let quantity = resultPromotion[0].quantity;
                            let data_typeI = resultPromotion[0].data_typeI; let resetI = resultPromotion[0].resetI;
                            let receiving_data_typeI = resultPromotion[0].receiving_data_typeI; let quantityI = resultPromotion[0].quantityI;
                            let data_typeII = resultPromotion[0].data_typeII; let resetII = resultPromotion[0].resetII;
                            let receiving_data_typeII = resultPromotion[0].receiving_data_typeII; let quantityII = resultPromotion[0].quantityII;

                            if (receiving_data_type !== '' && receiving_data_type !== undefined) {
                                Check_conditions(receiving_data_type, dataUser, resultPromotion[0], quantity, data_type, quantityUser, ipuser, reset).then(calculatedValues => {
                                    if (calculatedValues.status && calculatedValues.status.includes('OKPromotion')) {
                                        if (receiving_data_typeI !== '' && receiving_data_typeI !== undefined) {
                                            Check_conditions(receiving_data_typeI, dataUser, resultPromotion[0], quantityI, data_typeI, quantityUser, ipuser, resetI).then(calculatedValuesI => {

                                                if (calculatedValuesI.status && calculatedValuesI.status.includes('OKPromotion')) {

                                                    if (receiving_data_typeII !== '' && receiving_data_typeII !== undefined) {
                                                        Check_conditions(receiving_data_typeII, dataUser, resultPromotion[0], quantityII, data_typeII, quantityUser, ipuser, resetII).then(calculatedValuesII => {
                                                            if (calculatedValuesII.status && calculatedValuesII.status.includes('OKPromotion')) {
                                                                receive_Promotions(resultPromotion, dataUser, bill_number, quantityUser, formattedDate, formattedNumber,
                                                                    statusFinance, destinationAccount, destinationAccountNumber, transRef, qrcodeData, nameimg, totaltopup, ipuser, imgBank, actualize)
                                                                    .then(calculatedValues => {
                                                                        let jsArray = { status: calculatedValues.status };
                                                                        resolve(jsArray);
                                                                    })
                                                                    .catch(error => {
                                                                        console.error(error);
                                                                    });
                                                            } else {
                                                                let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                                                                resolve(jsArray);
                                                            }
                                                        }).catch(error => {
                                                            console.error(error);
                                                        });
                                                    } else {
                                                        console.log('on3')
                                                        receive_Promotions(resultPromotion, dataUser, bill_number, quantityUser, formattedDate, formattedNumber,
                                                            statusFinance, destinationAccount, destinationAccountNumber, transRef, qrcodeData, nameimg, totaltopup, ipuser, imgBank, actualize)
                                                            .then(calculatedValues => {
                                                                let jsArray = { status: calculatedValues.status };
                                                                resolve(jsArray);
                                                            })
                                                            .catch(error => {
                                                                console.error(error);
                                                            });
                                                    }
                                                } else {
                                                    console.log('on2')
                                                    let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                                                    resolve(jsArray);
                                                }
                                            }).catch(error => {
                                                console.error(error);
                                            });
                                        } else {
                                            console.log('on1.5')
                                            receive_Promotions(resultPromotion, dataUser, bill_number, quantityUser, formattedDate, formattedNumber,
                                                statusFinance, destinationAccount, destinationAccountNumber, transRef, qrcodeData, nameimg, totaltopup, ipuser, imgBank, actualize)
                                                .then(calculatedValues => {
                                                    let jsArray = { status: calculatedValues.status };
                                                    resolve(jsArray);
                                                })
                                                .catch(error => {
                                                    console.error(error);
                                                });
                                        }
                                    } else {
                                        console.log('on399')
                                        let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                                        resolve(jsArray);
                                    }
                                })
                                    .catch(error => {
                                        console.error(error);
                                    });
                            }
                            // if (resultPromotion[0].receiving_data_type === "ฝากเงินครั้งแรก") {
                            //     if (dataUser.recharge_times === 0) {
                            //         if (resultPromotion[0].typebonus === "Percent") {

                            //             balancebunus = quantity * resultPromotion[0].bunus / 100;

                            //             if (balancebunus > resultPromotion[0].maxbunus) {
                            //                 balancebunus = resultPromotion[0].maxbunus
                            //             }
                            //             const balance = quantity + balancebunus
                            //             const turnover = balancebunus * resultPromotion[0].multiplier;

                            //             let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                            //                 balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber, trans_ref, qrcodeData, nameimg) value 
                            //                 ('${dataUser.id}','${dataUser.agent_id}','${dataUser.accountName}','${dataUser.accountNumber}','${dataUser.phonenumber}','${'ฝาก'}','${quantity}','${0}','${dataUser.credit}'
                            //                 ,'${balance}','${formattedDate}${formattedNumber}','${bill_number}','${statusFinance}',now(),now(),'${dataUser.bank}','${dataUser.imgBank}'
                            //                 ,'${destinationAccount}','${destinationAccountNumber}','${transRef}', '${qrcodeData}', '${nameimg}')`;

                            //             let totalamountdaily = logTotalAmount(dataUser, formattedDate, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)
                            //             connection.query(sql_before, (error, result) => {
                            //                 if (error) {
                            //                     console.log(error)
                            //                 } else {

                            //                     let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${dataUser.recharge_times + 1}', turnover = '${turnover}',
                            //                         total_top_up_amount = '${totaltopup}', groupmember = '${rank}', promotionuser = '${resultPromotion[0].namepromotion}', passwordpromotion = '${resultPromotion[0].passwordpromotion}'
                            //                         WHERE id='${dataUser.id}'`;
                            //                     connection.query(sql, (error, resultAfter) => {
                            //                         if (error) {
                            //                             console.log(error);
                            //                         }
                            //                         let updateRepostFinance = Finance.UpdateLogRepostFinance(dataUser.username, 'ฝาก', quantity)
                            //                         addRepostPromotion(dataUser.username, resultPromotion[0].namepromotion, resultPromotion[0].passwordpromotion,
                            //                             resultPromotion[0].promotionsupport, resultPromotion[0].multiplier, resultPromotion[0].bunus);

                            //                         let jsArray = { status: "รับโปรโมชั่นเรียบร้อย" };
                            //                         resolve(jsArray);
                            //                     });

                            //                 }
                            //             });

                            //         } else {
                            //             if (quantity > resultPromotion[0].valusbunus) {
                            //                 let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                            //                 balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber, trans_ref, qrcodeData, nameimg) value 
                            //                 ('${dataUser.id}','${dataUser.agent_id}','${dataUser.accountName}','${accountNumber}','${phonenumber}','${'ฝาก'}','${quantity}','${0}','${dataUser.credit}'
                            //                 ,'${balance}','${formattedDate}${formattedNumber}','${billnum}','${statusFinance}',now(),now(),'${dataUser.bank}','${dataUser.imgBank}'
                            //                 ,'${destinationAccount}','${destinationAccountNumber}','${transRef}', '${qrcodeData}', '${nameimg}')`;
                            //                 if (statusFinance === "สำเร็จ") {
                            //                     let totalamountdaily = logTotalAmount(resultUser, formattedDate, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)

                            //                     connection.query(sql_before, (error, result) => {
                            //                         if (error) {
                            //                             console.log(error)
                            //                         } else {

                            //                             let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}', turnover = '${turnover}',
                            //                         total_top_up_amount = '${totaltopup}' groupmember = '${rank}', promotionuser = '${resultPromotion[0].namepromotion}'  
                            //                         WHERE id='${dataUser.id}'`;
                            //                             connection.query(sql, (error, resultAfter) => {
                            //                                 if (error) {
                            //                                     console.log(error);
                            //                                 }
                            //                                 let updateRepostFinance = Finance.UpdateLogRepostFinance(dataUser.username, 'ฝาก', quantity)

                            //                                 let jsArray = { status: "รับโปรโมชั่นเรียบร้อย" };
                            //                                 resolve(jsArray);
                            //                             });

                            //                         }
                            //                     });
                            //                 } else {
                            //                     let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                            //                     resolve(jsArray);
                            //                 }
                            //             }
                            //         }
                            //     } else {
                            //         let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                            //         resolve(jsArray);
                            //     }
                            // } else {
                            //     let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                            //     resolve(jsArray);
                            // }
                        }
                    })
                } catch (err) {
                    if (!err.statusCode) {
                        err.statusCode = 500;
                    }
                    next(err);
                }
            } else {
                let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                resolve(jsArray);
            }
        })
    }

    static promotionDay(quantity, dataUser, idPromotion, bill_number) {

    }

    static user_Leaked_promotion(post) {
        try {
            let sql_UserHavePromotion = `SELECT * FROM member WHERE username ='${post.username}'`;
            connection.query(sql_UserHavePromotion, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    let balanceNow = resultuserPromotion[0].credit - post.bet
                    if (resultuserPromotion[0].passwordpromotion !== "ไม่ได้รับโปรโมชั่น") {
                        if (resultuserPromotion[0].turnover !== 0) {
                            let sql_ePromotion = `SELECT * FROM creditpromotion WHERE passwordpromotion ='${resultuserPromotion[0].passwordpromotion}' AND statuspromotion = 'Y'`;
                            connection.query(sql_ePromotion, (error, resultPromotion) => {
                                if (resultPromotion.length !== 0) {
                                    if (resultPromotion[0].leakedPro === "ค่าคงที่") {
                                        if (balanceNow <= resultPromotion[0].valusbunus) {
                                            let sql = `UPDATE member set promotionuser = 'ไม่ได้รับโปรโมชั่น', passwordpromotion = 'ไม่ได้รับโปรโมชั่น', gameplayturn = 'PlayAllGame', turnover = '${0}' WHERE username ='${post.username}'`;
                                            connection.query(sql, (error, resultAfter) => {
                                                if (error) {
                                                    console.log(error);
                                                }
                                            });
                                        }
                                    } else {
                                        let sql_ePromotionRepost = `SELECT * FROM repostpromotion WHERE passwordpromotion ='${resultuserPromotion[0].passwordpromotion}' AND statuspromotion = 'Y'`;
                                        connection.query(sql_ePromotionRepost, (error, resultPromotionrepost) => {
                                            let creditUserPromotion = resultPromotionrepost[0].credit;
                                            let creditbonusPromotion = resultPromotion[0].valusbunus;
                                            let creditLeaked_promotion = (creditUserPromotion * creditbonusPromotion) / 100
                                            if (balanceNow <= creditLeaked_promotion) {
                                                let sql = `UPDATE member set promotionuser = 'ไม่ได้รับโปรโมชั่น', passwordpromotion = 'ไม่ได้รับโปรโมชั่น', gameplayturn = 'PlayAllGame', turnover = '${0}' WHERE username ='${post.username}'`;
                                                connection.query(sql, (error, resultAfter) => {
                                                    if (error) {
                                                        console.log(error);
                                                    }
                                                });
                                            }
                                        })
                                    }
                                }
                            })
                        } else {
                            let sql = `UPDATE member set promotionuser = 'ไม่ได้รับโปรโมชั่น', passwordpromotion = 'ไม่ได้รับโปรโมชั่น', gameplayturn = 'PlayAllGame', turnover = '${0}' WHERE username ='${post.username}'`;
                            connection.query(sql, (error, resultAfter) => {
                                if (error) {
                                    console.log(error);
                                }
                            });
                        }
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    }
};

function receive_Promotions(resultPromotion, dataUser, bill_number, quantity, formattedDate, formattedNumber, statusFinance, destinationAccount, destinationAccountNumber, transRef, qrcodeData, nameimg, totaltopup, ipuser, imgBank, actualize) {
    return new Promise((resolve, reject) => {
        let rank = 'NewMember';
        const currentTimeInThailand = moment().tz('Asia/Bangkok');
        const datethai = currentTimeInThailand.format('YYYY-MM-DD');
        const formattedTime = currentTimeInThailand.format('HH:mm:ss');
        switch (totaltopup) {
            case 200000:
                rank = "Bronze";
                break;
            case 1000000:
                rank = "Silver";
                break;
            case 3000000:
                rank = "Gold";
                break;
            case 10000000:
                rank = "Diamond";
                break;
            default:
                rank = "NewMember";
        }
        let balancebunus = 0
        if (resultPromotion[0].typebonus === "Percent") {
            balancebunus = (quantity * resultPromotion[0].bunus) / 100;
            if (balancebunus > resultPromotion[0].maxbunus) {
                balancebunus = resultPromotion[0].maxbunus
            }
        } else {
            balancebunus = quantity + resultPromotion[0].bunus;
            if (balancebunus > resultPromotion[0].maxbunus) {
                balancebunus = resultPromotion[0].maxbunus
            }
        }

        const balance = dataUser.credit + quantity + balancebunus;
        const creditBunus = quantity + balancebunus;
        const turnover = creditBunus * resultPromotion[0].multiplier;

        let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
            balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber, trans_ref, qrcodeData, nameimg, actualize) value 
            ('${dataUser.id}','${dataUser.agent_id}','${dataUser.accountName}','${dataUser.accountNumber}','${dataUser.phonenumber}','${'ฝาก'}','${quantity}','${0}','${dataUser.credit}'
            ,'${balance}','T${formattedDate}${formattedNumber}','${bill_number}','${statusFinance}','${datethai}','${formattedTime}','${dataUser.bank}','${imgBank}'
            ,'${destinationAccount}','${destinationAccountNumber}','${transRef}', '${qrcodeData}','${nameimg}','${actualize}')`;

        let totalamountdaily = logTotalAmount(dataUser, formattedDate, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)
        let updateRepostFinance = Finance.UpdateLogRepostFinance(dataUser.username, 'ฝาก', quantity)
        connection.query(sql_before, (error, result) => {
            if (error) {
                console.log(error)
            } else {
                console.log(balancebunus, balance, creditBunus, turnover)

                let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${dataUser.recharge_times + 1}', turnover = '${turnover}', deposit ='${quantity}',
                    total_top_up_amount = '${totaltopup}', groupmember = '${rank}', promotionuser = '${resultPromotion[0].namepromotion}', passwordpromotion = '${resultPromotion[0].passwordpromotion}'
                    , gameplayturn = '${resultPromotion[0].promotionsupport}' WHERE id='${dataUser.id}'`;
                connection.query(sql, (error, resultAfter) => {
                    if (error) {
                        console.log(error);
                    }

                    addRepostPromotion(dataUser.username, resultPromotion[0].passwordpromotion, resultPromotion[0].namepromotion,
                        resultPromotion[0].promotionsupport, resultPromotion[0].multiplier, balancebunus, creditBunus, ipuser, resultPromotion[0]);

                    let jsArray = { status: "รับโปรโมชั่นเรียบร้อย" };
                    resolve(jsArray);
                });
            }
        });

    })
}


function automaticFunctionTest() {
    console.log('Automatic function is running at 03:54 PM.');
}

function addRepostPromotion(username, passwordpromotion, namepromotion, promotionsupport, multiplier, bunus, userbalance, ipuser, resultPromotion) {
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    try {
        let sql_before = `INSERT INTO repostPromotion (username, passwordpromotion, namepromotion, promotionsupport, multiplier, bunus, created_at, 
            numbet_received, credit, ip_address, tpyepromotion, tpyebunus, 	startpromotion, endpromotion) value 
        ('${username}','${passwordpromotion}','${namepromotion}','${promotionsupport}','${multiplier}','${bunus}','${formattedDate}','${1}','${userbalance}','${ipuser}',
        'ฝาก','${resultPromotion.typebonus}','${resultPromotion.startpromotion}','${resultPromotion.endpromotion}')`;
        connection.query(sql_before, (error, resultDeposit) => {
            if (error) {
                console.log(error);
            } else {
                let success = 'Success'
            }
        });
    } catch (err) {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    }
}

function Check_conditions(conditions, datauser, resultPromotion, quantity, data_type, userbalance, ipuser, timereset) {
    return new Promise((resolve, reject) => {
        switch (conditions) {
            case 'ฝากเงินครั้งแรก':
                receiving_First_deposit(datauser).then(calculatedValues => {
                    //console.log(calculatedValues.status);
                    if (calculatedValues.status === 'OKPromotion') {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'รายวัน':
                receiving_Daily(datauser, resultPromotion, quantity, timereset).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'รายสัปดาห์':
                receiving_Weekly(datauser, resultPromotion, timereset).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'ไม่ฝากมาแล้ว x วัน':
                receiving_No_deposit(datauser, resultPromotion, quantity).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'จำนวนครั้งการฝาก':
                receiving_Number_deposits(datauser, resultPromotion, data_type).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'ฝากไม่เคยรับโปร':
                receiving_Never_Promotion(datauser, resultPromotion).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'รายเดือน':
                receiving_Monthly(datauser, resultPromotion).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'รับได้ทุกๆ x วัน':
                receiving_EveryXday(datauser, resultPromotion).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'จำนวนครั้ง':
                receiving_Number_times(datauser, resultPromotion).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'ฝาก':
                receiving_Deposit(quantity, data_type, userbalance).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'จำนวนครั้งของ IpAddress':
                receiving_IpAddress(quantity, resultPromotion, ipuser).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            case 'ยอดเงินปัจจุบัน':
                receiving_Current_Balance(datauser, data_type, quantity).then(calculatedValues => {
                    if (calculatedValues.status.includes("OKPromotion")) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }).catch(error => {
                    console.error(error);
                });
                break;
            default:

        }
    })
}


function receiving_First_deposit(dataUser) { //ฝากเงินครั้งแรก
    return new Promise((resolve, reject) => {
        if (dataUser.recharge_times === 0) {
            resolve({ status: "OKPromotion" })
        } else {
            resolve({ status: "NoPromotion" })
        }
    })
}


function receiving_Daily(dataUser, resultPromotion, quantity, timereset) { //รายวัน
    return new Promise((resolve, reject) => {

        const timeString = timereset; // เวลาที่คุณได้รับ

        const currentDate = new Date(); // วันที่ปัจจุบัน
        const [hours, minutes, seconds] = timeString.split(':').map(Number);

        currentDate.setHours(hours, minutes, seconds, 0); // ตั้งเวลาเป็น 14:00:00:000

        const nextDay = new Date(currentDate);
        nextDay.setDate(currentDate.getDate() + 1); // เพิ่ม 1 วัน

        const values = [currentDate, nextDay];

        const number = parseInt(quantity, 10); // แปลงเป็น integer
        try {
            let sql_UserHavePromotion = `SELECT * FROM repostPromotion WHERE passwordpromotion ='${resultPromotion.passwordpromotions}' AND username ='${dataUser.username}' AND
            created_at >= ? OR created_at < ?`;
            connection.query(sql_UserHavePromotion, values, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    console.log(resultuserPromotion.length, number)
                    if (resultuserPromotion.length <= number) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
}

function receiving_Weekly(dataUser, resultPromotion, quantity, timereset) { //รายสัปดาห์
    return new Promise((resolve, reject) => {

        const startDay = timereset; // ตั้งค่าวันที่ต้องการเริ่มต้น เช่น 'Monday' เป็นวันจันทร์ในภาษาอังกฤษ
        const now = moment(); // วันที่ปัจจุบัน
        const startDate = moment().day(startDay); // วันที่เริ่มต้น

        // เพิ่มหรือลดวันตามที่ต้องการ
        if (startDate.isAfter(now)) {
            startDate.subtract(7, 'days');
        }

        const endDate = startDate.clone().add(7, 'days'); // คัดลอกวันที่เริ่มต้นและเพิ่ม 7 วัน

        const startDateString = startDate.format('YYYY-MM-DD');
        const endDateString = endDate.format('YYYY-MM-DD');

        const number = parseInt(quantity, 10); // แปลงเป็น integer
        try {
            let sql_UserHavePromotion = `SELECT * FROM repostPromotion WHERE passwordpromotion ='${resultPromotion.passwordpromotions}' AND username ='${dataUser.username}' AND
            created_at >= '${startDateString}' AND created_at < '${endDateString}'`;
            connection.query(sql_UserHavePromotion, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    if (resultuserPromotion.length <= number || resultuserPromotion.length === 0) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
}

function receiving_No_deposit(datauser, resultPromotion, quantity) { //ไม่เคยฝากมาแล้ว x วัน
    return new Promise((resolve, reject) => {

        const number = parseInt(quantity, 10); // แปลงเป็น integer
        const daysAgo = number
        const today = new Date();
        today.setDate(today.getDate() - daysAgo);
        const endDate = today.toISOString().split('T')[0];
        const startDate = new Date().toISOString().split('T')[0];

        try {
            let sql_UserHavePromotion = `SELECT * FROM logfinancerepost WHERE username ='${datauser.username}'`;
            connection.query(sql_UserHavePromotion, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    if (resultuserPromotion.length !== 0) {

                        let sql_UserHavePromotion = `SELECT * FROM logfinancerepost WHERE username ='${datauser.username}' 
                        AND transaction_date BETWEEN '${endDate}' AND '${startDate}'`;

                        connection.query(sql_UserHavePromotion, (error, resultuseDate) => {
                            if (error) {
                                console.log(error)
                            } else {
                                if (resultuseDate.length === 0) {
                                    resolve({ status: "OKPromotion" })
                                } else {
                                    resolve({ status: "NoPromotion" })
                                }
                            }
                        })
                    } else {
                        resolve({ status: "OKPromotion" })
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
}

function receiving_Number_deposits(datauser, resultPromotion, quantity, data_type) { // จำนวนครั้งการฝาก
    return new Promise((resolve, reject) => {
        const number = parseInt(quantity, 10); // แปลงเป็น integer
        try {
            let sql_UserHavePromotion = `SELECT * FROM logfinancerepost WHERE username ='${datauser.username}'`;
            connection.query(sql_UserHavePromotion, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    if (data_type.includes("มากกว่า")) {
                        if (resultuserPromotion.length > number) {
                            resolve({ status: "OKPromotion" })
                        } else {
                            resolve({ status: "NoPromotion" })
                        }
                    } else if (data_type.includes("น้อยกว่า")) {
                        if (resultuserPromotion.length < number) {
                            resolve({ status: "OKPromotion" })
                        } else {
                            resolve({ status: "NoPromotion" })
                        }
                    } else {
                        if (resultuserPromotion.length === number) {
                            resolve({ status: "OKPromotion" })
                        } else {
                            resolve({ status: "NoPromotion" })
                        }
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
}

function receiving_Never_Promotion(datauser) { //ฝากไม่เคยรับโปร
    return new Promise((resolve, reject) => {
        try {
            let sql_UserHavePromotion = `SELECT * FROM repostPromotion WHERE username ='${datauser.username}'`;
            connection.query(sql_UserHavePromotion, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    if (resultuserPromotion.length === 0) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
}

function receiving_Monthly(dataUser, resultPromotion, quantity) { //รายเดือน
    return new Promise((resolve, reject) => {

        const number = parseInt(quantity, 10); // แปลงเป็น integer
        try {
            let sql_UserHavePromotion = `SELECT * FROM repostPromotion WHERE passwordpromotion ='${resultPromotion.passwordpromotions}' AND username ='${dataUser.username}' AND
            DATE_FORMAT(created_at, '%Y-%m') = DATE_FORMAT(NOW(), '%Y-%m')`;
            connection.query(sql_UserHavePromotion, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    if (resultuserPromotion.length < number || resultuserPromotion.length === 0) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
}

function receiving_EveryXday(dataUser, resultPromotion, quantity) {  //รับได้ทุกๆ x วัน
    return new Promise((resolve, reject) => {

        const number = parseInt(quantity, 10); // แปลงเป็น integer
        const formattedDateStart = new Date(resultPromotion.startpromotion).toISOString().split('T')[0];
        const formattedDateEnd = new Date(resultPromotion.endpromotion).toISOString().split('T')[0];

        try {
            let sql_UserHavePromotion = `SELECT * FROM repostPromotion WHERE passwordpromotion ='${resultPromotion.passwordpromotions}' AND username ='${dataUser.username}' AND
            created_at >= '${formattedDateStart}' AND created_at < '${formattedDateEnd}'`;
            connection.query(sql_UserHavePromotion, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    if (resultuserPromotion.length !== 0) {
                        let sql_UserHavePromotion = `SELECT * FROM repostPromotion WHERE passwordpromotion ='${resultPromotion.passwordpromotions}' AND username ='${dataUser.username}'
                        ORDER BY ABS(DATEDIFF(NOW(), created_at)) LIMIT 1`;
                        connection.query(sql_UserHavePromotion, [number], (error, resultuserDate) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_UserHavePromotion = `SELECT * FROM repostPromotion WHERE passwordpromotion ='${resultPromotion.passwordpromotions}' AND username ='${dataUser.username}' AND
                                created_at BETWEEN '${resultuserDate[0].created_at}' AND DATE_ADD('${resultuserDate[0].created_at}', INTERVAL ? DAY)`;
                                connection.query(sql_UserHavePromotion, [number], (error, resultuserPromotion) => {
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        if (resultuserPromotion.length === 0) {
                                            resolve({ status: "OKPromotion" })
                                        } else {
                                            resolve({ status: "NoPromotion" })
                                        }
                                    }
                                })
                            }
                        })


                    } else {
                        resolve({ status: "OKPromotion" })
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
}

function receiving_Number_times(datauser, resultPromotion, quantity, data_type) { //จำนวนครั้ง
    return new Promise((resolve, reject) => {
        const number = parseInt(quantity, 10);
        try {
            let sql_UserHavePromotion = `SELECT * FROM repostPromotion WHERE username ='${datauser.username}' AND passwordpromotion ='${resultPromotion.passwordpromotions}'`;
            connection.query(sql_UserHavePromotion, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    if (resultuserPromotion.length <= number) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
}

function receiving_Deposit(quantity, data_type, userbalance) { //ฝาก
    return new Promise((resolve, reject) => {
        const number = parseInt(quantity, 10);
        console.log(userbalance, number, data_type);
        if (data_type.includes("มากกว่า")) {
            if (userbalance > number) {
                resolve({ status: "OKPromotion" })
            } else {
                resolve({ status: "NoPromotion" })
            }
        } else if (data_type.includes("น้อยกว่า")) {
            if (userbalance < number) {
                resolve({ status: "OKPromotion" })
            } else {
                resolve({ status: "NoPromotion" })
            }
        } else {
            if (userbalance === number) {
                resolve({ status: "OKPromotion" })
            } else {
                resolve({ status: "NoPromotion" })
            }
        }
    })
}

function receiving_IpAddress(quantity, resultPromotion, ipuser) { //ipUser
    return new Promise((resolve, reject) => {
        const number = parseInt(quantity, 10);
        try {
            let sql_UserHavePromotion = `SELECT * FROM repostPromotion WHERE passwordpromotion ='${resultPromotion.passwordpromotions}' AND ip_address ='${ipuser}'`;
            connection.query(sql_UserHavePromotion, (error, resultuserPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    if (resultuserPromotion.length <= number) {
                        resolve({ status: "OKPromotion" })
                    } else {
                        resolve({ status: "NoPromotion" })
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
}

function receiving_Current_Balance(datauser, data_type, quantity) { //ยอดเงินปัจจุบัน
    return new Promise((resolve, reject) => {
        const number = parseInt(quantity, 10);
        if (data_type.includes("มากกว่า")) {
            if (datauser.credit > number) {
                resolve({ status: "OKPromotion" })
            } else {
                resolve({ status: "NoPromotion" })
            }
        } else if (data_type.includes("น้อยกว่า")) {
            if (datauser.credit < number) {
                resolve({ status: "OKPromotion" })
            } else {
                resolve({ status: "NoPromotion" })
            }
        } else {
            if (datauser.credit === number) {
                resolve({ status: "OKPromotion" })
            } else {
                resolve({ status: "NoPromotion" })
            }
        }
    })
}

function logTotalAmount(resultUser, formattedDateBill, type, destinationAccount, destinationAccountNumber, quantity, statusFinance) {
    let sql_deposit = `SELECT billmatched, complated, bankName, balance, imgbank FROM depositaccount WHERE accountName ='${destinationAccount}' OR accountNumber = '${destinationAccountNumber}' ORDER BY accountNumber ASC`;
    let sql_before = `SELECT * FROM totalamountdaily WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
    connection.query(sql_before, (error, resulttotal) => {
        if (error) {
            console.log(error)
        } else {
            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                if (resulttotal.length === 0) {
                    if (statusFinance === ('สำเร็จ')) {
                        //console.log(destinationAccount, destinationAccountNumber)
                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}'`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, balance, bankname, date, time, typeaction, imgbank) value 
                                ('${resultUser.agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${quantity}','${resulttotaldeposit[0].balance}','${resulttotaldeposit[0].bankName}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

                                connection.query(sql_before, (error, resultDeposit) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        let success = 'Success'
                                        return success
                                    }
                                });
                            }
                        });

                    } else {
                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated}'
                        WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, balance, bankname, date, time, typeaction, imgbank) value 
                                    ('${resultUser.agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${0}','${resulttotaldeposit[0].balance}','${resulttotaldeposit[0].bankName}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

                                connection.query(sql_before, (error, resultDeposit) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        let success = 'Success'
                                        return success
                                    }
                                });
                            }
                        });
                    }

                } else {
                    if (statusFinance === ('สำเร็จ')) {
                        let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated + quantity}',
                        balance = '${resulttotal[0].complated + quantity}' WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                        connection.query(sql, (error, resultUpdate) => {
                            if (error) {
                                console.log(error);
                            } else {
                                connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        console.log(resulttotaldeposit)
                                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                        connection.query(sql, (error, resultDeposit) => {
                                            if (error) {
                                                console.log(error);
                                            } else {
                                                let success = 'Success'
                                                return success
                                            }
                                        });
                                    }
                                })
                            }
                        });
                    } else {
                        let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated + 0}',
                        balance = '${resulttotal[0].complated + 0}' WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                        connection.query(sql, (error, resultUpdate) => {
                            if (error) {
                                console.log(error);
                            } else {
                                connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        console.log(resulttotaldeposit)
                                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billmatched + 0}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + 0}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                        connection.query(sql, (error, resultDeposit) => {
                                            if (error) {
                                                console.log(error);
                                            } else {
                                                let success = 'Success'
                                                return success
                                            }
                                        });
                                    }
                                })
                            }
                        });
                    }
                }
            })
        }
    })
}
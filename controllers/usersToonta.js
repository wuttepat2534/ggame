const express = require('express');
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const md5 = require('md5');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const useragent = require('express-useragent')
const logEdit = require('./logEditAll')
const promotiontoonta = require('./promotiontoonta')
const repostGame = require('./repostGame')
const Finance = require('./Finance')
const app = express();
const moment = require('moment-timezone')

app.use(express.static('public'));

const socket = require('../socket')

require('dotenv').config()
const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

http: //localhost:5000/signupMember Add Member//Toonta
exports.signupMember = async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const member_code = req.body.member_code;
    const username = req.body.username;
    const password = req.body.password;
    const credit = req.body.credit;
    const firstName = req.body.accountName;
    const lastName = req.body.accountName;
    const customerGroup = "NewMember";
    const Rank = "NewMember";
    const contact_number = req.body.contact_number;
    const IDLIne = "";
    const note = "สมัครจากหน้าเว็บไซต์";
    const currency = "บาท";
    const bank = req.body.bank;
    const accountName = req.body.accountName;
    const accountNumber = req.body.accountNumber;

    const nametpyecreate = "สมัครจากหน้าเว็บไซต์";
    const tpyeCreate = "หน้าเว็บ";

    let statuScheck = 'Y';

    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');

    const hashedPassword = md5(password);
    let sql_check = `SELECT * FROM member WHERE username='${username}' OR accountNumber='${accountNumber}' AND agent_id='${agent_id}'`;
    connection.query(sql_check, (error, results) => {
        try {
            if (error) {
                console.log(error)
            } else {
                const data = results;
                if (data.length === 0 || data.length < 1) {
                    let sql = `INSERT INTO member (agent_id, username_agent, member_code, name, username, password, credit, created_at, created_attime, updated_at, customerGroup, userrank, lineid, status,
                        note, currency, bank, accountName, accountNumber, phonenumber, lastName, nametpyecreate) 
                value ('${agent_id}','${nametpyecreate}','${agent_id}','${firstName}','${username}','${hashedPassword}','${credit}','${formattedDate}','${formattedTime}','${formattedDate}', '${customerGroup}','${Rank}',
                '${IDLIne}','${statuScheck}', '${note}', '${currency}','${bank}', '${accountName}', '${accountNumber}', '${contact_number}','${lastName}','${tpyeCreate}')`;
                    connection.query(sql, (error, result) => {
                        if (error) { console.log(error) }
                        res.send({
                            message: "Data created Success"
                        });
                        res.end();
                    });

                } else {
                    res.send({
                        message: "Data Creates False"
                    });
                    res.end();
                }
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
};

http: //localhost:5000/post/checkUsernameMember  Check Username Member Toonta
exports.checkUsernameMember = async (req, res, next) => {
    const username = req.body.username;
    let sql_check = `SELECT * FROM member WHERE username='${username}' ORDER BY username ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1 || data.length < 1) {
                res.send({
                    message: "This username is available."
                });
            } else {
                res.send({
                    message: "This username is not available."
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
};

http: //localhost:5000/post/creditPromotion Add creditPromotion
exports.creditPromotion = async (req, res, next) => {
    const agnetidcreate = req.body.agnetidcreate;
    const repost = req.body.repost;
    const passwordpromotion = req.body.member_sinceInfo;
    const startpromotion = req.body.startpromotion;
    const endpromotion = req.body.endpromotion;
    const typebonus = req.body.typebonus;
    const bunus = req.body.bunus;
    const maxbunus = req.body.maxbunus;
    const valusbunus = req.body.valusbunus;
    const groupuser = req.body.groupuser;
    const afterPromotion = req.body.afterPromotion;
    const receiving_data_type = req.body.receiving_data_type;
    const receiving_data_typeI = req.body.receiving_data_typeI;
    const receiving_data_typeII = req.body.receiving_data_typeII;
    const valus_receiving = req.body.valus_receiving;
    const data_type = req.body.data_type;
    const data_typeI = req.body.data_typeI;
    const data_typeII = req.body.data_typeII;
    const valus_day = req.body.valus_day;
    const numberoftimes_person = req.body.numberoftimes_person;
    const ipAddress_attempts = req.body.ipAddress_attempts;
    const reset = req.body.reset;
    const resetI = req.body.resetI;
    const resetII = req.body.resetII;
    const withdrawalType = req.body.withdrawalType;
    const withdraw_data_type = req.body.withdraw_data_type;
    const withdraw_max = req.body.withdraw_max;
    const withdraw_valus = req.body.withdraw_valus;
    const multiplier = req.body.multiplier;
    const statuspromotion = req.body.statuspromotion;
    const promotiontype = req.body.promotiontype;
    const namepromotion = req.body.namepromotion;
    const leakedPro = req.body.leakedPro;
    const withdrawalTypeII = req.body.withdrawalTypeII;
    const withdrawalTypeIII = req.body.withdrawalTypeIII;
    const withdraw_valusII = req.body.withdraw_valusII;
    const withdraw_valusIII = req.body.withdraw_valusIII;
    const statusTopup = req.body.statusTopup;
    const promotionSuppost = req.body.promotionSuppost;
    const webtype = req.body.webtype;
    const typelistsuppost = req.body.typelistsuppost;
    const quantity = req.body.quantity;
    const quantityI = req.body.quantityI;
    const quantityII = req.body.quantityII;

    //console.log(req.body)
    let sql = `INSERT INTO creditpromotion (passwordpromotion, agnetidcreate, repost, startpromotion, endpromotion, typebonus, bunus, maxbunus, valusbunus, groupuser, afterPromotion, 
        receiving_data_type, receiving_data_typeI, receiving_data_typeII, valus_receiving, data_type, data_typeI, data_typeII, valus_day, numberoftimes_person, ipAddress_attempts, 
        reset, resetI, resetII, withdrawalType, withdraw_data_type, withdraw_max, withdraw_valus, statuspromotion, promotiontype, namepromotion, leakedPro, multiplier,
        withdrawalTypeII, withdrawalTypeIII, withdraw_valusII, 	withdraw_valusIII, status_topup, promotionsupport, webtype, typelistsuppost, quantity, quantityI, quantityII) 
value ('${passwordpromotion}','${agnetidcreate}','${repost}','${startpromotion}','${endpromotion}','${typebonus}','${bunus}','${maxbunus}','${valusbunus}','${groupuser}',
 '${afterPromotion}','${receiving_data_type}','${receiving_data_typeI}','${receiving_data_typeII}','${valus_receiving}','${data_type}','${data_typeI}',
 '${data_typeII}','${valus_day}','${numberoftimes_person}','${ipAddress_attempts}','${reset}','${resetI}','${resetII}','${withdrawalType}','${withdraw_data_type}',
 '${withdraw_max}','${withdraw_valus}','${statuspromotion}','${promotiontype}','${namepromotion}','${leakedPro}','${multiplier}','${withdrawalTypeII}',
 '${withdrawalTypeIII}','${withdraw_valusII}','${withdraw_valusIII}','${statusTopup}','${promotionSuppost}','${webtype}','${typelistsuppost}','${quantity}','${quantityI}','${quantityII}')`;

    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data created Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }

    });
};

http: //localhost:5000/post/editPromotion  Edit editPromotion
exports.EditPromotion = async (req, res, next) => {
    const agnetidcreate = req.body.agnetidcreate;
    const repost = req.body.repost;
    const passwordpromotion = req.body.member_sinceInfo;
    const startpromotion = req.body.startpromotion;
    const endpromotion = req.body.endpromotion;
    const typebonus = req.body.typebonus;
    const bunus = req.body.bunus;
    const maxbunus = req.body.maxbunus;
    const valusbunus = req.body.valusbunus;
    const groupuser = req.body.groupuser;
    const afterPromotion = req.body.afterPromotion;
    const receiving_data_type = req.body.receiving_data_type;
    const receiving_data_typeI = req.body.receiving_data_typeI;
    const receiving_data_typeII = req.body.receiving_data_typeII;
    const valus_receiving = req.body.valus_receiving;
    const data_type = req.body.data_type;
    const data_typeI = req.body.data_typeI;
    const data_typeII = req.body.data_typeII;
    const valus_day = req.body.valus_day;
    const numberoftimes_person = req.body.numberoftimes_person;
    const ipAddress_attempts = req.body.ipAddress_attempts;
    const reset = req.body.reset;
    const resetI = req.body.resetI;
    const resetII = req.body.resetII;
    const withdrawalType = req.body.withdrawalType;
    const withdraw_data_type = req.body.withdraw_data_type;
    const withdraw_max = req.body.withdraw_max;
    const withdraw_valus = req.body.withdraw_valus;
    const multiplier = req.body.multiplier;
    const statuspromotion = req.body.statuspromotion;
    const promotiontype = req.body.promotiontype;
    const namepromotion = req.body.namepromotion;
    const leakedPro = req.body.leakedPro;
    const withdrawalTypeII = req.body.withdrawalTypeII;
    const withdrawalTypeIII = req.body.withdrawalTypeIII;
    const withdraw_valusII = req.body.withdraw_valusII;
    const withdraw_valusIII = req.body.withdraw_valusIII;
    const statusTopup = req.body.statusTopup;
    const promotionSuppost = req.body.promotionSuppost;
    const webtype = req.body.webtype;
    const typelistsuppost = req.body.typelistsuppost;

    let sql = `UPDATE creditpromotion set  agnetidcreate ='${agnetidcreate}', repost ='${repost}', startpromotion ='${startpromotion}', 
    endpromotion ='${endpromotion}', typebonus ='${typebonus}', bunus ='${bunus}', maxbunus ='${maxbunus}', valusbunus ='${valusbunus}', groupuser ='${groupuser}',
    afterPromotion ='${afterPromotion}', receiving_data_type ='${receiving_data_type}', receiving_data_typeI ='${receiving_data_typeI}', receiving_data_typeII ='${receiving_data_typeII}',
    valus_receiving ='${valus_receiving}', data_type ='${data_type}', data_typeI ='${data_typeI}', data_typeII ='${data_typeII}', valus_day ='${valus_day}', numberoftimes_person ='${numberoftimes_person}',
    ipAddress_attempts ='${ipAddress_attempts}', reset ='${reset}', resetI ='${resetI}', resetII ='${resetII}', withdrawalType ='${withdrawalType}', withdraw_data_type ='${withdraw_data_type}',
    withdraw_max ='${withdraw_max}', withdraw_valus ='${withdraw_valus}', statuspromotion ='${statuspromotion}', promotiontype ='${promotiontype}', namepromotion ='${namepromotion}',
    leakedPro ='${leakedPro}', multiplier ='${multiplier}', withdrawalTypeII ='${withdrawalTypeII}', withdrawalTypeIII ='${withdrawalTypeIII}', withdraw_valusII ='${withdraw_valusII}',
    withdraw_valusIII ='${withdraw_valusIII}', status_topup ='${statusTopup}', promotionsupport ='${promotionSuppost}', webtype ='${webtype}', typelistsuppost ='${typelistsuppost}' 
    WHERE passwordpromotion = '${passwordpromotion}'`;

    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data Update Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }

    });
};

http: //localhost:5000/post/creditImgPromotion Add creditImgPromotion
exports.upDateImgPromotion = (req, res) => {
    const data = JSON.parse(req.body.data);
    const {
        details,
        passwordpromotion,
        imgPromotion
    } = data;
    //let fileimg = '';
    console.log(req.file, imgPromotion);
    if (req.file === undefined) {
        let sql_update = `UPDATE creditpromotion set filename = '${imgPromotion}', details = '${details}' WHERE passwordpromotion ='${passwordpromotion}'`;
        connection.query(sql_update, (error, resultAfter) => {
            try {
                if (error) {
                    console.log(error);
                }
                res.send({
                    message: "Data created Success"
                });
                res.end();
            } catch (err) {
                if (!err.statusCode) { err.statusCode = 500; }
                next(err);
            }
        });
    } else {
        let sql_update = `UPDATE creditpromotion set filename = '${req.file.filename}', details = '${details}' WHERE passwordpromotion ='${passwordpromotion}'`;
        connection.query(sql_update, (error, resultAfter) => {
            try {
                if (error) {
                    console.log(error);
                }
                res.send({
                    message: "Data created Success"
                });
                res.end();
            } catch (err) {
                if (!err.statusCode) { err.statusCode = 500; }
                next(err);
            }
        });
    }
};


http: //localhost:5000/post/creditImgPromotion Add creditImgPromotion
exports.creditImgPromotion = (req, res) => {
    //console.log('Axios POST body: ', req.body);
    const data = JSON.parse(req.body.data);
    const {
        namepromotion,
        details,
        passwordpromotion
    } = data;
    const fileimg = req.file;

    let sql = `INSERT INTO imgpromotion (namepromotion, details, fieldname, originalname, encoding, mimetype, destination, filename, path, size) 
 value ('${namepromotion}','${details}','${fileimg.fieldname}','${fileimg.originalname}','${fileimg.encoding}','${fileimg.mimetype}','${fileimg.destination}',
 '${fileimg.filename}','${fileimg.path}','${fileimg.size}')`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            let sql_update = `UPDATE creditpromotion set filename = '${fileimg.filename}', details = '${details}' WHERE passwordpromotion ='${passwordpromotion}'`;
            connection.query(sql_update, (error, resultAfter) => {
                if (error) {
                    console.log(error);
                }
                res.send({
                    message: "Data created Success"
                });
                res.end();
            });
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

http: //localhost:5000/post/creditImgPromotion Add creditImgPromotion
exports.DeletePromotion = (req, res) => {
    const passwordpromotion = req.body.passwordpromotion;
    let sql_update = `UPDATE creditpromotion set statuspromotion = 'N' WHERE passwordpromotion ='${passwordpromotion}'`;
    connection.query(sql_update, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data Delete Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

http: //localhost:5000/post/getPromotion Add getPromotion
exports.getPromotion = (require, response) => {
    const searchKeyword = require.body.name;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    if (searchKeyword === '') {
        let sql = `SELECT * FROM creditpromotion WHERE statuspromotion = 'Y' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM creditpromotion WHERE statuspromotion = 'Y'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'Success',
                    data: results,
                    total: res[0].count
                });
                response.end();
            });
        });
    } else {
        let sql = `SELECT * FROM creditpromotion WHERE statuspromotion = 'Y' AND repost LIKE '%${searchKeyword}%' OR namepromotion LIKE '%${searchKeyword}%' OR agnetidcreate LIKE '%${searchKeyword}%' OR promotiontype LIKE '%${searchKeyword}%'
        LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'search_Success',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
};

http: //localhost:5000/post/getlistPromotion Get getPromotion
exports.getlistPromotion = (require, response) => {
    let sql = `SELECT * FROM creditpromotion WHERE statuspromotion = 'Y'`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: 'Success',
            data: results,
        });
        response.end();
    });
};

http: //localhost:5000/post/getlistPromotion Add getPromotion
exports.getOnePromotion = (require, response) => {
    const passwordpromotion = require.params.passwordpromotion;
    let sql = `SELECT * FROM creditpromotion WHERE passwordpromotion = '${passwordpromotion}' AND statuspromotion = 'Y'`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: `Promotion Password '${passwordpromotion}'`,
            data: results,
        });
        response.end();
    });
};

http: //localhost:5000/post/getImgPromotion Get getImgPromotion
exports.getImgPromotion = (req, res) => {
    let sql = `SELECT * FROM imgpromotion `;
    connection.query(sql, async (error, results) => {
        try {
            if (error) { console.log(error) }
            res.send({
                img: results
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
};


http: //localhost:5000/post/getDatafinanceUser/:id  Get getDatafinanceUser
exports.getDatafinanceUser = (req, res) => {
    const id = req.params.id;
    let sql = `SELECT accountNumber, accountName FROM member WHERE id ='${id}' AND status = 'Y' `;
    connection.query(sql, async (error, results) => {
        try {
            if (error) { console.log(error) }
            res.send({
                accountNumber: results
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });

};

function formatNumber(num) {
    return String(num).padStart(5, '0');
}

//http://localhost:5000/post/financeUser financeUserMoney
exports.financeUser = (req, res) => {
    //console.log(req.body);
    const disposittpye = req.body.disposittpye;
    const usernamedisposit = req.body.usernamedisposit;
    const type = req.body.type;
    const quantity = req.body.quantity;
    const accountNumber = req.body.accountNumber;
    const destinationAccount = req.body.destinationAccountName;
    const destinationAccountNumber = req.body.destinationAccountNumber;
    const phonenumber = req.body.phonenumber;
    const accountNumberInt = parseInt(accountNumber);
    const statusFinance = req.body.statusFinance;
    const nameimg = req.body.nameimg;
    const transRef = req.body.transRef;
    const qrcodeData = req.body.qrcodeData;
    const typePromotion = req.body.typePromotion;
    const agent_id = req.body.agent_id;
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');
    const imgBank = req.body.imgBank
    const actualize = req.body.actualize
    const nots = req.body.nots;
    let promotiontres = ''
    //console.log(statusFinance)
    let notsdipost = actualize + ' ' + nots
    const io = socket.getIO();
    try {
        let sql_LogDeposit = `SELECT * FROM logfinanceuser WHERE trans_ref ='${transRef}'`;
        connection.query(sql_LogDeposit, async (error, logDeposit_transRef) => {
            if (error) {
                console.log(error);
            } else {
                const dataLog = logDeposit_transRef;
                if (dataLog.length < 1) {
                    let sql_before = `SELECT * FROM member WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y' ORDER BY phonenumber ASC`;
                    connection.query(sql_before, (error, resultUser) => {
                        if (error) {
                            console.log(error)
                        } else {
                            //console.log(resultUser[0].accountNumber, accountNumberInt)
                            if (statusFinance === "สำเร็จ") {
                                let bill = `SELECT numberbill FROM logfinanceuser WHERE transaction_date = ?  AND tpyefinance = 'ฝาก' ORDER BY numberbill DESC LIMIT 1`;
                                connection.query(bill, [formattedDate], (error, resultBill) => {
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        let billnum = 0
                                        if (resultBill.length !== 0) {
                                            billnum = resultBill[0].numberbill + 1;
                                        } else {
                                            billnum += 1;
                                        }
                                        //console.log(resultUser[0].credit);
                                        const formattedNumber = formatNumber(billnum);
                                        const balance = quantity + resultUser[0].credit;

                                        const totaltopup = resultUser[0].total_top_up_amount + quantity;

                                        let rank = 'NewMember';
                                        if (totaltopup >= 200000) {
                                            rank = "Bronze";
                                        } else if (totaltopup >= 1000000) {
                                            rank = "Silver";
                                        } else if (totaltopup >= 3000000) {
                                            rank = "Gold";
                                        } else if (totaltopup >= 10000000) {
                                            rank = "Diamond";
                                        } else {
                                            rank = "NewMember";
                                        }

                                        if (typePromotion !== '0') {
                                            promotiontoonta.promotionDeposit(quantity, resultUser[0], typePromotion, formattedNumber, totaltopup, nameimg, imgBank, nots,
                                                statusFinance, qrcodeData, transRef, destinationAccount, destinationAccountNumber, formattedDate, formattedNumber, actualize)
                                                .then(calculatedValues => {
                                                    //console.log(calculatedValues.status)
                                                    if (calculatedValues.status === 'ไม่สามารถรับโปรโมชั่นได้') {

                                                        res.send({
                                                            message: "เติมเงินไม่สำเร็จ ไม่สามารถรับโปรโมชั่นได้",
                                                        });
                                                        res.end();

                                                    } else {
                                                        const post = [
                                                            {
                                                                username: resultUser[0].username,
                                                                deposit_member: quantity,
                                                                message: "มีการแจ้งฝากเงินจำนวน"
                                                            }]

                                                        io.emit('notify-management-deposit', { data: post });
                                                        res.send({
                                                            message: "เติมเงินสำเร็จ",
                                                        });
                                                        res.end();
                                                    }
                                                })
                                                .catch(error => {
                                                    console.error(error);
                                                });
                                        } else {
                                            //console.log('55555')
                                            let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                                balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber, 
                                                trans_ref, qrcodeData, nameimg, actualize, promotion, note) value 
                                                ('${resultUser[0].id}','${resultUser[0].agent_id}','${resultUser[0].accountName}','${accountNumber}','${phonenumber}','${'ฝาก'}','${quantity}','${0}','${resultUser[0].credit}'
                                                ,'${balance}','T${formattedDate}${formattedNumber}','${billnum}','${statusFinance}','${formattedDate}','${formattedTime}'
                                                ,'${resultUser[0].bank}','${imgBank}','${destinationAccount}','${destinationAccountNumber}','${transRef}','${qrcodeData}'
                                                ,'${nameimg}','${actualize}','${'ไม่ได้รับโปรโมชั่น'}','${nots}')`;

                                            if (statusFinance === "สำเร็จ") {
                                                logTotalAmount(resultUser, formattedDate, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)
                                                connection.query(sql_before, (error, result) => {
                                                    if (error) {
                                                        console.log(error)
                                                    } else {
                                                        //console.log(typePromotion);

                                                        let sql = `UPDATE member set credit = '${balance}', recharge_times = '${resultUser[0].recharge_times + 1}', deposit ='${quantity}',
                                                            total_top_up_amount = '${totaltopup}', groupmember = '${rank}', turnover = '${resultUser[0].turnover + quantity}' 
                                                            WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                                        connection.query(sql, (error, resultAfter) => {
                                                            if (error) {
                                                                console.log(error);
                                                            } else {
                                                                let updateRepostFinance = Finance.UpdateLogRepostFinance(resultUser[0].username, 'ฝาก', quantity)

                                                                if (disposittpye !== 'member') {
                                                                    let repostFinace = logEdit.uploadLogDipositAdmin(usernamedisposit, phonenumber, resultUser[0].credit,
                                                                        balance, nots, disposittpye, agent_id, resultUser[0].id)
                                                                }
                                                                const post = [
                                                                    {
                                                                        username: resultUser[0].username,
                                                                        deposit_member: quantity,
                                                                        message: "มีการแจ้งฝากเงินจำนวน"
                                                                    }]
                                                                const message = `ฝากเงินสำเร็จ\nลูกค้า: ${resultUser[0].accountName}\nยูสเซอร์: ${phonenumber}
จำนวนเงิน: ${quantity}
_______________________
หมายเหตุ : ยูสเซอร์ไม่ได้เลือกโปรโมชั่น
ยอดเงืนก่อน: ${resultUser[0].credit}
ยอดเงินหลังฝาก: ${balance}
เทิร์นโอเวอร์ที่ต้องทำ: ${resultUser[0].turnover + quantity}
ฝากโดย: ${notsdipost}
_______________________
เวลา: ${formattedDate} ${formattedTime}
`;
                                                                let lintNotify = logEdit.DitpositLinenoti(message)
                                                                io.emit('notify-management-deposit', { data: post });

                                                                res.send({
                                                                    message: "เติมเงินสำเร็จ"
                                                                });
                                                                res.end();
                                                            }

                                                        });

                                                    }
                                                });
                                            } else {
                                                res.send({
                                                    message: "เติมเงินไม่สำเร็จ",
                                                });
                                            }
                                        }
                                    }
                                })
                            } else {
                                res.send({
                                    message: "เติมเงินไม่สำเร็จ",
                                });
                            }
                        }
                    });
                } else {
                    res.send({
                        message: "สลิปนี้เคยถูกใช้งานแล้ว",
                    });
                    res.end();
                }
            }
        })

    } catch (err) {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    }
};

//http://localhost:5000/post/WinhdrawUser WinhdrawUserMoneyUser
exports.WinhdrawUser = (req, res) => {
    const quantity = req.body.quantity;
    const phonenumber = req.body.phonenumber;
    //const statusFinance = req.body.statusFinance;
    const agent_id = req.body.agent_id;
    const actualize = req.body.actualize;
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');

    const statusWitdraw = req.body.statusWitdraw;
    const withdrawStatus = req.body.withdrawStatus;
    const io = socket.getIO();
    //console.log(req.body);
    try {
        let sql_before = `SELECT * FROM member WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y' ORDER BY phonenumber ASC`;
        connection.query(sql_before, (error, resultUser) => {
            if (error) {
                console.log(error)
            } else {
                // if ()
                let moneyUserWithDraw = resultUser[0].credit - resultUser[0].turnover
                if (resultUser[0].credit >= quantity && resultUser[0].turnover === 0) {
                    if (resultUser[0].promotionuser.includes("ไม่ได้รับโปรโมชั่น")) { //เช็คว่าไม่ได้รับโปรโมชั่นหรือคูปอง
                        let withdrawWebUser = WinhdrawUserOn(resultUser, formattedDate, quantity, phonenumber, withdrawStatus,
                            actualize, statusWitdraw, formattedTime, agent_id)
                            .then(data => {
                                res.send({
                                    message: "รอการอนุมัติการถอนเงิน",
                                });
                                res.end();
                            })
                            .catch(error => {
                                console.error("Error:", error);
                            });
                    } else {
                        if (resultUser[0].promotionuser.includes("จบโปรโมชั่น")) {
                            if (resultUser[0].turnover === 0) {
                                let sql_Promotion = `SELECT * FROM creditpromotion WHERE passwordpromotion ='${resultUser[0].passwordpromotion}'`;
                                connection.query(sql_Promotion, (error, resultPromotion) => {
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        if (resultPromotion[0].withdrawalType === 'ถอน') {
                                            if (resultPromotion[0].withdraw_valus <= quantity) {
                                                let withdrawWebUser = WinhdrawUserOn(resultUser, formattedDate, quantity, phonenumber, withdrawStatus,
                                                    actualize, statusWitdraw, formattedTime, agent_id)
                                                    .then(data => {
                                                        let sql = `UPDATE member set turnover = '${0}', credit = '${0}'
                                                    WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                                        connection.query(sql, (error, resultAfter) => {
                                                            if (error) {
                                                                console.log(error);
                                                            } else {
                                                                res.send({
                                                                    message: "รอการอนุมัติการถอนเงิน",
                                                                });
                                                                res.end();
                                                            }
                                                        })
                                                    }).catch(error => {
                                                        console.error("Error:", error);
                                                    });
                                            } else {
                                                res.send({
                                                    message: "ยอดถอนของท่านเกินกว่าที่โปรโมชั่นกำหนด",
                                                });
                                                res.end();
                                            }
                                        } else if (resultPromotion[0].withdrawalTypeII === 'ถอน') {
                                            if (resultPromotion[0].withdraw_valusII <= quantity) {
                                                let withdrawWebUser = WinhdrawUserOn(resultUser, formattedDate, quantity, phonenumber, withdrawStatus,
                                                    actualize, statusWitdraw, formattedTime, agent_id)
                                                    .then(data => {
                                                        let sql = `UPDATE member set turnover = '${0}', credit = '${0}'
                                                    WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                                        connection.query(sql, (error, resultAfter) => {
                                                            if (error) {
                                                                console.log(error);
                                                            } else {
                                                                res.send({
                                                                    message: "รอการอนุมัติการถอนเงิน",
                                                                });
                                                                res.end();
                                                            }
                                                        })
                                                    }).catch(error => {
                                                        console.error("Error:", error);
                                                    });
                                            } else {
                                                res.send({
                                                    message: "ยอดถอนของท่านเกินกว่าที่โปรโมชั่นกำหนด",
                                                });
                                                res.end();
                                            }
                                        } else if (resultPromotion[0].withdrawalTypeIII === 'ถอน') {
                                            if (resultPromotion[0].withdraw_valusIII <= quantity) {
                                                let withdrawWebUser = WinhdrawUserOn(resultUser, formattedDate, quantity, phonenumber, withdrawStatus,
                                                    actualize, statusWitdraw, formattedTime, agent_id)
                                                    .then(data => {
                                                        let sql = `UPDATE member set turnover = '${0}', credit = '${0}'
                                                    WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                                        connection.query(sql, (error, resultAfter) => {
                                                            if (error) {
                                                                console.log(error);
                                                            } else {
                                                                res.send({
                                                                    message: "รอการอนุมัติการถอนเงิน",
                                                                });
                                                                res.end();
                                                            }
                                                        })
                                                    }).catch(error => {
                                                        console.error("Error:", error);
                                                    });
                                            } else {
                                                res.send({
                                                    message: "ยอดถอนของท่านเกินกว่าที่โปรโมชั่นกำหนด",
                                                });
                                                res.end();
                                            }
                                        } else {
                                            let withdrawWebUser = WinhdrawUserOn(resultUser, formattedDate, quantity, phonenumber, withdrawStatus,
                                                actualize, statusWitdraw, formattedTime, agent_id)
                                                .then(data => {
                                                    let sql = `UPDATE member set turnover = '${0}', credit = '${0}'
                                                WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                                    connection.query(sql, (error, resultAfter) => {
                                                        if (error) {
                                                            console.log(error);
                                                        } else {
                                                            res.send({
                                                                message: "รอการอนุมัติการถอนเงิน",
                                                            });
                                                            res.end();
                                                        }
                                                    })
                                                }).catch(error => {
                                                    console.error("Error:", error);
                                                });
                                        }
                                    }
                                })
                            }
                        } else {
                            let sql_Promotion = `SELECT * FROM creditpromotion WHERE passwordpromotion ='${resultUser[0].passwordpromotion}'`;
                            connection.query(sql_Promotion, (error, resultPromotion) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    if (resultPromotion.length === 1) {
                                        if (resultUser[0].turnover === 0) {
                                            let withdrawWebUser = WinhdrawUserOn(resultUser, formattedDate, quantity, phonenumber, withdrawStatus,
                                                actualize, statusWitdraw, formattedTime, agent_id)
                                                .then(data => {
                                                    let sql = `UPDATE member set promotionuser = 'ไม่ได้รับโปรโมชั่น', passwordpromotion = 'ไม่ได้รับโปรโมชั่น', gameplayturn = 'PlayAllGame', turnover = '${0}', credit = '${0}'
                                                WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                                    connection.query(sql, (error, resultAfter) => {
                                                        if (error) {
                                                            console.log(error);
                                                        } else {
                                                            res.send({
                                                                message: "รอการอนุมัติการถอนเงิน",
                                                            });
                                                            res.end();
                                                        }
                                                    })
                                                }).catch(error => {
                                                    console.error("Error:", error);
                                                });
                                        } else {
                                            res.send({
                                                message: "ถอนเงินไม่ได้ เนื่องจากติดโปรโมชั่น",
                                            });
                                            res.end();
                                        }
                                    } else {
                                        let sql_conpon = `SELECT * FROM coupon WHERE password_coupon ='${resultUser[0].passwordpromotion}'`;
                                        connection.query(sql_conpon, (error, resultConpon) => {
                                            if (resultConpon.length === 1) {
                                                console.log(resultUser[0].credit, resultConpon[0].valustrunover);
                                                if (resultUser[0].credit >= resultConpon[0].valustrunover) { //ผู้เล่นทำตามเงื่อนไขคูปองหรือยัง
                                                    let withdrawWebUser = WinhdrawUserOn(resultUser, formattedDate, quantity, phonenumber, withdrawStatus,
                                                        actualize, statusWitdraw, formattedTime, agent_id)
                                                        .then(data => {
                                                            if (data.credit < 10) {
                                                                let sql = `UPDATE member set promotionuser = 'ไม่ได้รับโปรโมชั่น', passwordpromotion = 'ไม่ได้รับโปรโมชั่น', gameplayturn = 'PlayAllGame', turnover = '${0}', credit = '${0}'
                                                        WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                                                connection.query(sql, (error, resultAfter) => {
                                                                    if (error) {
                                                                        console.log(error);
                                                                    } else {
                                                                        res.send({
                                                                            message: "รอการอนุมัติการถอนเงิน",
                                                                        });
                                                                        res.end();
                                                                    }
                                                                })
                                                            } else {
                                                                res.send({
                                                                    message: "รอการอนุมัติการถอนเงิน",
                                                                });
                                                                res.end();
                                                            }
                                                        }).catch(error => {
                                                            console.error("Error:", error);
                                                        });
                                                } else {
                                                    res.send({
                                                        message: "ถอนเงินไม่ได้ เนื่องจากติดโปรโมชั่น",
                                                    });
                                                    res.end();
                                                }
                                            } else {
                                                let withdrawWebUser = WinhdrawUserOn(resultUser, formattedDate, quantity, phonenumber, withdrawStatus,
                                                    actualize, statusWitdraw, formattedTime, agent_id)
                                                    .then(data => {
                                                        if (data.credit < 10) {
                                                            let sql = `UPDATE member set promotionuser = 'ไม่ได้รับโปรโมชั่น', passwordpromotion = 'ไม่ได้รับโปรโมชั่น', gameplayturn = 'PlayAllGame', turnover = '${0}'
                                                    WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                                            connection.query(sql, (error, resultAfter) => {
                                                                if (error) {
                                                                    console.log(error);
                                                                } else {
                                                                    res.send({
                                                                        message: "รอการอนุมัติการถอนเงิน",
                                                                    });
                                                                    res.end();
                                                                }
                                                            })
                                                        } else {
                                                            res.send({
                                                                message: "รอการอนุมัติการถอนเงิน",
                                                            });
                                                            res.end();
                                                        }
                                                    }).catch(error => {
                                                        console.error("Error:", error);
                                                    });
                                            }
                                        })
                                    }
                                }
                            })
                        }
                    }
                } else {
                    res.send({
                        message: "ยอดเงินมีไม่เพียงพอ",
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
};

function WinhdrawUserOn(resultUser, formattedDate, quantity, phonenumber, withdrawStatus, actualize, statusWitdraw, formattedTime, agent_id) {
    return new Promise((resolve, reject) => {
        const io = socket.getIO();
        //let totalamountdaily = logTotalAmountWithdraw(resultUser, formattedDateBill, 'ถอน', destinationAccount, destinationAccountNumber, quantity, statusFinance)
        let bill = `SELECT numberbill FROM logfinanceuser WHERE transaction_date = ? AND tpyefinance = 'ถอน' ORDER BY numberbill DESC LIMIT 1`;
        connection.query(bill, [formattedDate], (error, resultBill) => {
            if (error) {
                console.log(error)
            } else {
                let billnum = 0
                if (resultBill.length !== 0) {
                    billnum = resultBill[0].numberbill + 1;
                } else { billnum += 1; }
                const formattedNumber = formatNumber(billnum);
                //console.log(formattedNumber)
                Finance.Withdrawmoney(resultUser[0], formattedDate, formattedNumber, billnum, quantity, resultUser[0].accountNumber, phonenumber, withdrawStatus)
                    .then(calculatedValues => {
                        //console.log(calculatedValues);
                    })
                    .catch(error => {
                        console.error(error);
                    });

                const balance = quantity;
                let sql_Bank = `SELECT * FROM banknames WHERE bankname_name ='${resultUser[0].bank}'`;
                connection.query(sql_Bank, (error, resultBank) => {
                    if (error) {
                        console.log(error)
                    } else {
                        let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                    balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber, actualize) value 
                    ('${resultUser[0].id}','${resultUser[0].agent_id}','${resultUser[0].accountName}','${resultUser[0].accountNumber}','${phonenumber}','${'ถอน'}','${quantity}','${0}','${resultUser[0].credit}'
                    ,'${balance}','T${formattedDate}${formattedNumber}','${billnum}','${statusWitdraw}','${formattedDate}','${formattedTime}','${resultUser[0].bank}','${resultBank[0].images}'
                    ,'${resultUser[0].accountName}','${resultUser[0].accountNumber}','${actualize}')`;

                        connection.query(sql_before, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                const balanceNow = resultUser[0].credit - quantity;
                                if (statusWitdraw === "สำเร็จ") {

                                    const approval_person = req.body.approval_person
                                    const tpyeApproval_person = req.body.tpye_Approval_person

                                    let sql = `UPDATE member set credit = '${balanceNow}', withdraw_member = '${resultUser[0].withdraw_member + quantity}', latest_withdrawal = '${quantity}'
                                WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                    connection.query(sql, (error, resultAfter) => {
                                        if (error) {
                                            console.log(error);
                                        }

                                        let sql_Withdraw = `UPDATE logfinanceuser set trans_ref = '${approval_person}',qrcodeData = '${tpyeApproval_person}' 
                                    WHERE bill_number ='T${formattedDate}${formattedNumber}'`;
                                        connection.query(sql_Withdraw, (error, withdraw) => {
                                            let updateRepostFinance = Finance.UpdateLogRepostFinance(phonenumber, 'ถอน', quantity)
                                            res.send({
                                                message: "ถอนเงินสำเร็จ",
                                            });
                                            res.end();
                                        })
                                    });
                                } else {
                                    let sql = `UPDATE member set credit = '${balanceNow}', withdraw_member = '${resultUser[0].withdraw_member + quantity}', latest_withdrawal = '${quantity}'
                                WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status = 'Y'`;
                                    connection.query(sql, (error, resultAfter) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            const post = [
                                                {
                                                    username: resultUser[0].username,
                                                    withdraw_member: quantity,
                                                    message: "มีการแจ้งถอนเงินจำนวน"
                                                }]
                                            const message = `ลูกค้าแจ้งถอน\nลูกค้า: ${phonenumber}\nชื่อบัญชี: ${resultUser[0].accountName}\nจำนวนเงิน: ${quantity}\nเวลา: ${formattedDate} ${formattedTime}`;
                                            let lintNotify = logEdit.testLine(message, quantity, phonenumber, formattedDate, formattedTime)

                                            io.emit('notify-management-withdraw', { data: post });
                                            let jsArray = { status: "รอการอนุมัติการถอนเงิน", credit: balanceNow };
                                            resolve(jsArray);
                                        }
                                    });
                                }
                            }
                        });
                    }
                })
            }
        })
    })
}

function logTotalAmount(resultUser, formattedDateBill, type, destinationAccount, destinationAccountNumber, quantity, statusFinance) {
    //console.log(formattedDateBill, type);
    let sql_deposit = `SELECT * FROM depositaccount WHERE accountName ='${destinationAccount}' OR accountNumber = '${destinationAccountNumber}'`;
    let sql_before = `SELECT * FROM totalamountdaily WHERE DATE(date) ='${formattedDateBill}' AND typeaction = '${type}'`;
    connection.query(sql_before, (error, resulttotal) => {
        if (error) {
            console.log(error)
        } else {
            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                if (resulttotal.length === 0) {
                    if (statusFinance === ('สำเร็จ')) {
                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billMatched + quantity}', billMatched = '${resulttotaldeposit[0].billMatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}'`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, balance, bankname, date, time, typeaction, imgbank) value 
                                ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${quantity}','${resulttotaldeposit[0].balance}','${resulttotaldeposit[0].bankName}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

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
                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billMatched + quantity}', billmatched = '${resulttotaldeposit[0].billMatched + quantity}', complated = '${resulttotaldeposit[0].complated}'
                        WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, balance, bankname, date, time, typeaction, imgbank) value 
                                    ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${0}','${resulttotaldeposit[0].balance}','${resulttotaldeposit[0].bankName}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

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
                                    console.log(quantity)
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].balance + quantity}', billMatched = '${resulttotaldeposit[0].billMatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                                    WHERE accountName ='${resulttotaldeposit[0].accountName}' AND accountNumber = '${resulttotaldeposit[0].accountNumber}'`;
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
                                        //console.log(resulttotaldeposit)
                                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billMatched + 0}', billMatched = '${resulttotaldeposit[0].billMatched + quantity}', complated = '${resulttotaldeposit[0].complated + 0}'
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

function logTotalAmountWithdraw(resultUser, formattedDateBill, type, destinationAccount, destinationAccountNumber, quantity, statusFinance) {
    let sql_deposit = `SELECT billmatched, complated, bankName, balance, imgbank FROM withdrawalaccount WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
    let sql_before = `SELECT * FROM totalamountdaily WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
    connection.query(sql_before, (error, resulttotal) => {
        if (error) {
            console.log(error)
        } else {
            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                if (resulttotal.length === 0) {
                    if (statusFinance === ('สำเร็จ')) {
                        let sql = `UPDATE withdrawalaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, bankname, balance, date, time, typeaction, imgbank) value 
                                ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${quantity}','${resulttotaldeposit[0].bankName}','${resulttotaldeposit[0].balance}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

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
                        let sql = `UPDATE withdrawalaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated}'
                        WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, bankname, balance, date, time, typeaction, imgbank) value 
                                    ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${0}','${resulttotaldeposit[0].bankName}','${resulttotaldeposit[0].balance}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

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
                                        let sql = `UPDATE withdrawalaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
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
                                        let sql = `UPDATE withdrawalaccount set balance = '${resulttotaldeposit[0].billmatched + 0}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + 0}'
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

//http://localhost:5000/post/depositUserPromotion financeUserMoney
exports.depositUserPromotion = (req, res) => {
    const quantity = req.body.quantity;
    const accountNumber = req.body.accountNumber;
    const destinationAccount = req.body.destinationAccountName
    const destinationAccountNumber = req.body.destinationAccountNumber
    const phonenumber = req.body.phonenumber
    const accountNumberInt = parseInt(accountNumber);
    const statusFinance = req.body.statusFinance
    const idPromotion = req.body.idPromotion;
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');

    try {
        let sql_Promotion = `SELECT * FROM creditpromotion WHERE id ='${idPromotion}'`;
        connection.query(sql_Promotion, (error, resultPromotion) => {
            if (error) {
                console.log(error)
            } else {
                if (resultPromotion[0].receiving_data_type === "เติมเงินครั้งแรก") {
                    let sql_valusUserDeposit = `SELECT * FROM member WHERE phonenumber ='${phonenumber}'`;
                    connection.query(sql_valusUserDeposit, (error, resultvalusUserDeposit) => {
                        if (error) {
                            console.log(error)
                        } else {
                            if (resultvalusUserDeposit[0].recharge_times === 0) {
                                if (resultPromotion[0].typebonus === "Percent") {
                                    if (quantity > resultPromotion[0].valusbunus) {
                                        const balancebunus = quantity * resultPromotion[0].bunus / 100;
                                        if (balancebunus > resultPromotion[0].maxbunus) {
                                            balancebunus = resultPromotion[0].maxbunus
                                        }
                                        const balance = quantity + balancebunus
                                        let totalamountdaily = logTotalAmount(sql_valusUserDeposit, formattedDate, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)
                                        let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}' WHERE id='${id}'`;
                                        connection.query(sql, (error, result) => {
                                            if (error) {
                                                console.log(error)
                                            } else {
                                                let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                                    balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber) value 
                                                    ('${resultUser[0].id}','${resultUser[0].agent_id}','${resultUser[0].accountName}','${accountNumber}','${phonenumber}','${'ฝาก'}','${quantity}','${balancebunus}','${resultUser[0].credit}'
                                                    ,'${balance}','T${formattedDate}${formattedNumber}','${billnum}','${statusFinance}','${formattedDate}','${formattedTime}','${resultUser[0].bank}','${resultUser[0].imgBank}'
                                                    ,'${destinationAccount}','${destinationAccountNumber}')`;
                                                connection.query(sql_before, (error, resultAfter) => {
                                                    if (error) {
                                                        console.log(error);
                                                    }
                                                    res.send({
                                                        message: "ฝากเงินสำเร็จ",
                                                    });
                                                    res.end();
                                                });
                                            }
                                        });
                                    }
                                } else {
                                    if (quantity > resultPromotion[0].valusbunus) {
                                        const balancebunus = quantity * resultPromotion[0].bunus;
                                        const balance = quantity + balancebunus
                                        let totalamountdaily = logTotalAmount(sql_valusUserDeposit, formattedDateBill, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)
                                        let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}' WHERE id='${id}'`;
                                        connection.query(sql, (error, result) => {
                                            if (error) {
                                                console.log(error)
                                            } else {
                                                let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                                    balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber) value 
                                                    ('${resultUser[0].id}','${resultUser[0].agent_id}','${resultUser[0].accountName}','${accountNumber}','${phonenumber}','${'ฝาก'}','${quantity}','${balancebunus}','${resultUser[0].credit}'
                                                    ,'${balance}','T${formattedDate}${formattedNumber}','${billnum}','${statusFinance}',now(),now(),'${resultUser[0].bank}','${resultUser[0].imgBank}'
                                                    ,'${destinationAccount}','${destinationAccountNumber}')`;

                                                connection.query(sql_before, (error, resultAfter) => {
                                                    if (error) {
                                                        console.log(error);
                                                    }
                                                    res.send({
                                                        message: "ฝากเงินสำเร็จ",
                                                    });
                                                    res.end();
                                                });
                                            }
                                        });
                                    }
                                }
                            } else {
                                res.send({
                                    message: "คุณไม่สามารถรับโปรโมชั่นนี่ได้",
                                });
                            }
                        }
                    });
                } else {
                    res.send({
                        message: "เลขบัญชีไม่ถูกต้อง",
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
};

function dateConvert(datedata) {
    const dateString = datedata;
    const date = new Date(dateString);

    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');

    const formattedDate = `${year}-${month}-${day}`;
    return formattedDate
}
//http://localhost:5000/post/getDataDepositStatementBank getDataStatementBankUsers
exports.getDataDepositStatementBank = (req, res) => {
    const depositwithdrawal = req.body.depositwithdrawal;
    const searchKeyword = req.body.searchKeyword;
    const searchPhones = req.body.searchPhone;
    const pageSize = req.body.pageSize;
    const pageNumber = req.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = req.body.dataDate;
    const enddate = req.body.endDate;
    const agent_ID = req.body.agent_ID;
    // Format the date as "ddmmyyyy"
    const today = new Date();
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0'); // JavaScript months are 0-based, so we add 1
    const year = today.getFullYear();
    const formattedDateBill = `${year}-${month}-${day}`;
    //console.log(searchKeyword, searchPhones);
    //console.log(depositwithdrawal, date, enddate);
    if (searchPhones === '' && searchKeyword === '') {
        //console.log(pageSize, pageNumber);
        try {
            let sql_deposit = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <='${enddate}' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
            connection.query(sql_deposit, (error, resultDeposit) => {
                if (error) {
                    console.log(error)
                } else {
                    let sql_statusTrue = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='สำเร็จ' AND transaction_date >='${date}' AND transaction_date <='${enddate}' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
                    connection.query(sql_statusTrue, (error, resultstatusTrue) => {
                        if (error) {
                            console.log(error)
                        } else {
                            let sql_statusFalse = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='ไม่สำเร็จ' AND transaction_date >='${date}' AND transaction_date <='${enddate}' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
                            connection.query(sql_statusFalse, (error, resultstatusFalse) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    let sql_statusUnbound = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='ที่ยังไม่ผูก' AND transaction_date >='${date}' AND transaction_date <='${enddate}' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
                                    connection.query(sql_statusUnbound, (error, resultstatusUnbound) => {
                                        if (error) {
                                            console.log(error)
                                        } else {
                                            let sql_statusWait = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='รอ' AND transaction_date >='${date}' AND transaction_date <='${enddate}' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
                                            connection.query(sql_statusWait, (error, resultstatusWait) => {
                                                if (error) {
                                                    console.log(error)
                                                } else {
                                                    let sql_statusNotready = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='ยังไม่เรียบร้อย' AND transaction_date >='${date}' AND transaction_date <='${enddate}' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
                                                    connection.query(sql_statusNotready, (error, resultstatusNotready) => {
                                                        if (error) {
                                                            console.log(error)
                                                        } else {
                                                            const totalCount = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <='${enddate}'`
                                                            connection.query(totalCount, (error, restotal) => {
                                                                if (error) {
                                                                    console.log(error);
                                                                } else {
                                                                    //let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date >='${date}' AND date <='${enddate}' AND typeaction = '${depositwithdrawal}'`;
                                                                    let sql = `
                                                                    SELECT
                                                                        accountName,
                                                                        accountNumber,
                                                                        bankname,
                                                                        imgbank,
                                                                        SUM(billmatched) AS billmatched,
                                                                        SUM(complated) AS complated,
                                                                        SUM(balance) AS balance
                                                                    FROM
                                                                        totalamountdaily
                                                                    WHERE
                                                                        date >= '${date}' AND date <= '${enddate}' AND agentid = '${agent_ID}' AND typeaction = '${depositwithdrawal}'
                                                                    GROUP BY
                                                                        accountName, accountNumber, bankname, imgbank
                                                                    LIMIT ${pageSize} OFFSET ${offset}`;
                                                                    connection.query(sql, (error, results) => {
                                                                        //console.log(agent_ID);
                                                                        res.send({
                                                                            dataDeposit: resultDeposit,
                                                                            datastatusTrue: resultstatusTrue,
                                                                            datastatusFalse: resultstatusFalse,
                                                                            dataUnbound: resultstatusUnbound,
                                                                            datastatusWait: resultstatusWait,
                                                                            datastatusNotready: resultstatusNotready,
                                                                            valusDataDeposit: resultDeposit.length,
                                                                            valusDatastatusTrue: resultstatusTrue.length,
                                                                            valusDatastatusFalse: resultstatusFalse.length,
                                                                            valusdataUnbound: resultstatusUnbound.length,
                                                                            valusdatastatusWait: resultstatusWait.length,
                                                                            valusdatastatusNotready: resultstatusNotready.length,
                                                                            total: restotal.length,
                                                                            accountreport: results
                                                                        });
                                                                        res.end();
                                                                    });
                                                                }
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        }
                                    });
                                }
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

    } else if (searchPhones !== "" && searchKeyword === "" && searchPhones !== undefined) {
        if (searchPhones.length === 10) {
            try {
                let sql_deposit = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND phonenumber LIKE ?
                LIMIT ? OFFSET ?`;
                const searchPattern = `%${searchPhones}%`;
                const values = [depositwithdrawal, date, enddate, searchPattern, pageSize, offset];
                connection.query(sql_deposit, values, (error, resultDeposit) => {
                    if (error) {
                        console.log(error)
                    } else {
                        let sql_statusTrue = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                        AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                        const searchPattern = `%${searchPhones}%`;
                        const values = [depositwithdrawal, date, enddate, "สำเร็จ", searchPattern, pageSize, offset];
                        connection.query(sql_statusTrue, values, (error, resultstatusTrue) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_statusFalse = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                                AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                const searchPattern = `%${searchPhones}%`;
                                const values = [depositwithdrawal, date, enddate, "ไม่สำเส็จ", searchPattern, pageSize, offset];
                                connection.query(sql_statusFalse, values, (error, resultstatusFalse) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        let sql_statusUnbound = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                                AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                        const searchPattern = `%${searchPhones}%`;
                                        const values = [depositwithdrawal, date, enddate, "ที่ยังไม่ผูก", searchPattern, pageSize, offset];
                                        connection.query(sql_statusUnbound, values, (error, resultstatusUnbound) => {
                                            if (error) {
                                                console.log(error)
                                            } else {
                                                let sql_statusWait = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                                        AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                                const searchPattern = `%${searchPhones}%`;
                                                const values = [depositwithdrawal, date, enddate, "รอ", searchPattern, pageSize, offset];
                                                connection.query(sql_statusWait, values, (error, resultstatusWait) => {
                                                    if (error) {
                                                        console.log(error)
                                                    } else {
                                                        let sql_statusNotready = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                                            AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                                        const searchPattern = `%${searchPhones}%`;
                                                        const values = [depositwithdrawal, date, enddate, "ยังไม่เรียบร้อย", searchPattern, pageSize, offset];
                                                        connection.query(sql_statusNotready, values, (error, resultstatusNotready) => {
                                                            if (error) {
                                                                console.log(error);
                                                            } else {
                                                                //let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND date = '${enddate}' AND typeaction = '${depositwithdrawal}'`;
                                                                let sql = `
                                                                    SELECT
                                                                        accountName,
                                                                        accountNumber,
                                                                        bankname,
                                                                        imgbank,
                                                                        SUM(billmatched) AS billmatched,
                                                                        SUM(complated) AS complated,
                                                                        SUM(balance) AS balance
                                                                    FROM
                                                                        totalamountdaily
                                                                    WHERE
                                                                        date >= '${date}' AND date <= '${enddate}' AND agentid = '${agent_ID}' AND typeaction = '${depositwithdrawal}'
                                                                    GROUP BY
                                                                        accountName, accountNumber, bankname, imgbank
                                                                    LIMIT ${pageSize} OFFSET ${offset}`;
                                                                connection.query(sql, (error, results) => {
                                                                    //console.log(resultDeposit);
                                                                    res.send({
                                                                        dataDeposit: resultDeposit,
                                                                        datastatusTrue: resultstatusTrue,
                                                                        datastatusFalse: resultstatusFalse,
                                                                        dataUnbound: resultstatusUnbound,
                                                                        datastatusWait: resultstatusWait,
                                                                        datastatusNotready: resultstatusNotready,
                                                                        valusDataDeposit: resultDeposit.length,
                                                                        valusDatastatusTrue: resultstatusTrue.length,
                                                                        valusDatastatusFalse: resultstatusFalse.length,
                                                                        valusdataUnbound: resultstatusUnbound.length,
                                                                        valusdatastatusWait: resultstatusWait.length,
                                                                        valusdatastatusNotready: resultstatusNotready.length,
                                                                        total: resultDeposit.length,
                                                                        accountreport: results
                                                                    });
                                                                    res.end();
                                                                });
                                                            }
                                                        });
                                                    }
                                                });
                                            }
                                        });
                                    }
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
        } else {
            //let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND typeaction = '${depositwithdrawal}'`;
            let sql = `
            SELECT
                accountName,
                accountNumber,
                bankname,
                imgbank,
                SUM(billmatched) AS billmatched,
                SUM(complated) AS complated,
                SUM(balance) AS balance
            FROM
                totalamountdaily
            WHERE
                date >= '${date}' AND date <= '${enddate}' AND agentid = '${agent_ID}' AND typeaction = '${depositwithdrawal}'
            GROUP BY
                accountName, accountNumber, bankname, imgbank
            LIMIT ${pageSize} OFFSET ${offset}`;
            connection.query(sql, (error, results) => {
                res.send({
                    dataDeposit: [],
                    datastatusTrue: [],
                    datastatusFalse: [],
                    dataUnbound: [],
                    datastatusWait: [],
                    datastatusNotready: [],
                    valusDataDeposit: 0,
                    valusDatastatusTrue: 0,
                    valusDatastatusFalse: 0,
                    valusdataUnbound: 0,
                    valusdatastatusWait: 0,
                    valusdatastatusNotready: 0,
                    total: 0,
                    accountreport: results
                });
                res.end();
            });
        }

    } else if (searchKeyword !== '' && searchPhones === '') {
        try {
            let sql_deposit = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND accountName LIKE '%${searchKeyword}%' 
            OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
            connection.query(sql_deposit, (error, resultDeposit) => {
                if (error) {
                    console.log(error)
                } else {
                    let sql_statusTrue = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='สำเร็จ'
                            AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
                    connection.query(sql_statusTrue, (error, resultstatusTrue) => {
                        if (error) {
                            console.log(error)
                        } else {
                            let sql_statusFalse = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='ไม่สำเส็จ'
                                    AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
                            connection.query(sql_statusFalse, (error, resultstatusFalse) => {
                                if (error) {
                                    console.log(error)
                                }
                                else {
                                    let sql_statusUnbound = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='ที่ยังไม่ผูก'
                                    AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%'LIMIT ${pageSize} OFFSET ${offset}`;
                                    connection.query(sql_statusUnbound, (error, resultstatusUnbound) => {
                                        if (error) {
                                            console.log(error)
                                        } else {
                                            let sql_statusWait = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='รอ'
                                                    AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
                                            connection.query(sql_statusWait, (error, resultstatusWait) => {
                                                if (error) {
                                                    console.log(error)
                                                } else {
                                                    let sql_statusNotready = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='ยังไม่เรียบร้อย'
                                                            AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
                                                    connection.query(sql_statusNotready, (error, resultstatusNotready) => {
                                                        if (error) {
                                                            console.log(error)
                                                        } else {
                                                            //let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND typeaction = '${depositwithdrawal}'`;
                                                            let sql = `
                                                            SELECT
                                                                accountName,
                                                                accountNumber,
                                                                bankname,
                                                                imgbank,
                                                                SUM(billmatched) AS billmatched,
                                                                SUM(complated) AS complated,
                                                                SUM(balance) AS balance
                                                            FROM
                                                                totalamountdaily
                                                            WHERE
                                                                date >= '${date}' AND date <= '${enddate}' AND agentid = '${agent_ID}' AND typeaction = '${depositwithdrawal}'
                                                            GROUP BY
                                                                accountName, accountNumber, bankname, imgbank
                                                            LIMIT ${pageSize} OFFSET ${offset}`;
                                                            connection.query(sql, (error, results) => {
                                                                res.send({
                                                                    dataDeposit: resultDeposit,
                                                                    datastatusTrue: resultstatusTrue,
                                                                    datastatusFalse: resultstatusFalse,
                                                                    dataUnbound: resultstatusUnbound,
                                                                    datastatusWait: resultstatusWait,
                                                                    datastatusNotready: resultstatusNotready,
                                                                    valusDataDeposit: resultDeposit.length,
                                                                    valusDatastatusTrue: resultstatusTrue.length,
                                                                    valusDatastatusFalse: resultstatusFalse.length,
                                                                    valusdataUnbound: resultstatusUnbound.length,
                                                                    valusdatastatusWait: resultstatusWait.length,
                                                                    valusdatastatusNotready: resultstatusNotready.length,
                                                                    total: resultDeposit.length,
                                                                    accountreport: results
                                                                });
                                                                res.end();
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        }
                                    });
                                }
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
    } else {
        if (searchPhones !== "" && searchPhones !== undefined) {
            if (searchPhones.length === 10) {
                try {
                    let sql_deposit = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND accountName LIKE ?
                    OR accountNumber ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                    const searchPattern = `%${searchPhones}%`;
                    const values = [depositwithdrawal, date, enddate, searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                    connection.query(sql_deposit, values, (error, resultDeposit) => {
                        if (error) {
                            console.log(error)
                        } else {
                            let sql_statusTrue = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                                    AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                            const searchPattern = `%${searchPhones}%`;
                            const values = [depositwithdrawal, date, enddate, "สำเร็จ", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                            connection.query(sql_statusTrue, values, (error, resultstatusTrue) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    let sql_statusFalse = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                                    AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                    const searchPattern = `%${searchPhones}%`;
                                    const values = [depositwithdrawal, date, enddate, "ไม่สำเส็จ", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                                    connection.query(sql_statusFalse, values, (error, resultstatusFalse) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            let sql_statusUnbound = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                                            AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                            const searchPattern = `%${searchPhones}%`;
                                            const values = [depositwithdrawal, date, enddate, "ที่ยังไม่ผูก", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                                            connection.query(sql_statusUnbound, values, (error, resultstatusUnbound) => {
                                                if (error) {
                                                    console.log(error)
                                                } else {
                                                    let sql_statusWait = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                                                            AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                                    const searchPattern = `%${searchPhones}%`;
                                                    const values = [depositwithdrawal, date, enddate, "รอ", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                                                    connection.query(sql_statusWait, values, (error, resultstatusWait) => {
                                                        if (error) {
                                                            console.log(error)
                                                        } else {
                                                            let sql_statusNotready = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >= ? AND transaction_date <= ? AND status = ?
                                                                AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                                            const searchPattern = `%${searchPhones}%`;
                                                            const values = [depositwithdrawal, date, enddate, "ยังไม่เรียบร้อย", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                                                            connection.query(sql_statusNotready, values, (error, resultstatusNotready) => {
                                                                if (error) {
                                                                    console.log(error);
                                                                } else {
                                                                    //let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND date = '${enddate}' AND typeaction = '${depositwithdrawal}'`;
                                                                    let sql = `
                                                                        SELECT
                                                                            accountName,
                                                                            accountNumber,
                                                                            bankname,
                                                                            imgbank,
                                                                            SUM(billmatched) AS billmatched,
                                                                            SUM(complated) AS complated,
                                                                            SUM(balance) AS balance
                                                                        FROM
                                                                            totalamountdaily
                                                                        WHERE
                                                                            date >= '${date}' AND date <= '${enddate}' AND agentid = '${agent_ID}' AND typeaction = '${depositwithdrawal}'
                                                                        GROUP BY
                                                                            accountName, accountNumber, bankname, imgbank
                                                                        LIMIT ${pageSize} OFFSET ${offset}`;
                                                                    connection.query(sql, (error, results) => {
                                                                        res.send({
                                                                            dataDeposit: resultDeposit,
                                                                            datastatusTrue: resultstatusTrue,
                                                                            datastatusFalse: resultstatusFalse,
                                                                            dataUnbound: resultstatusUnbound,
                                                                            datastatusWait: resultstatusWait,
                                                                            datastatusNotready: resultstatusNotready,
                                                                            valusDataDeposit: resultDeposit.length,
                                                                            valusDatastatusTrue: resultstatusTrue.length,
                                                                            valusDatastatusFalse: resultstatusFalse.length,
                                                                            valusdataUnbound: resultstatusUnbound.length,
                                                                            valusdatastatusWait: resultstatusWait.length,
                                                                            valusdatastatusNotready: resultstatusNotready.length,
                                                                            total: resultDeposit.length,
                                                                            accountreport: results
                                                                        });
                                                                        res.end();
                                                                    });
                                                                }
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        }
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
            } else {
                //let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND typeaction = '${depositwithdrawal}'`;
                let sql = `
                SELECT
                    accountName,
                    accountNumber,
                    bankname,
                    imgbank,
                    SUM(billmatched) AS billmatched,
                    SUM(complated) AS complated,
                    SUM(balance) AS balance
                FROM
                    totalamountdaily
                WHERE
                    date >= '${date}' AND date <= '${enddate}' AND agentid = '${agent_ID}' AND typeaction = '${depositwithdrawal}'
                GROUP BY
                    accountName, accountNumber, bankname, imgbank
                LIMIT ${pageSize} OFFSET ${offset}`;
                connection.query(sql, (error, results) => {
                    res.send({
                        dataDeposit: [],
                        datastatusTrue: [],
                        datastatusFalse: [],
                        dataUnbound: [],
                        datastatusWait: [],
                        datastatusNotready: [],
                        valusDataDeposit: 0,
                        valusDatastatusTrue: 0,
                        valusDatastatusFalse: 0,
                        valusdataUnbound: 0,
                        valusdatastatusWait: 0,
                        valusdatastatusNotready: 0,
                        total: 0,
                        accountreport: results
                    });
                    res.end();
                });
            }
        }
    }
};

//http://localhost:5000/post/getDepositaccount/:agent_id getDepositaccount
exports.getDepositaccount = (req, res) => {
    const agent_id = req.params.agent_id;
    let sql = `SELECT * FROM depositaccount WHERE webname = "${agent_id}" AND activestatus = "เปิดใช้งาน"`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        res.send({
            data: results
        });
        res.end();
    });
}

//http://localhost:5000/post/getOneDepositaccount getOneDepositaccount
exports.getOneDepositaccount = (req, res) => {
    const numberAccount = req.params.numberAccount;
    let sql = `SELECT * FROM depositaccount WHERE accountNumber = ${numberAccount}`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        res.send({
            data: results
        });

        res.end();
    });
}

http: //localhost:5000/post/creditPromotion Add creditPromotion
exports.createDepositaccount = async (req, res, next) => {
    const agent_ID = req.body.agent_ID;
    const account_name = req.body.account_name;
    const amount = req.body.Amount;
    const bank = req.body.bank;
    const nameAccount = req.body.nameAccount;
    const leakedPro = req.body.leakedPro;
    const numberAccount = req.body.numberAccount;
    const imgbank = req.body.imgbank;
    const active = req.body.active;
    let sql = `INSERT INTO depositaccount (bankName, status, accountNumber, algorithm, activestatus, accountRocked, autorocker, imgbank, accountName, nameAccount) 
 value ('${bank}','${"แก้ไขไม่ได้ เนื่องจากผูก Api"}','${numberAccount}','${leakedPro}','${active}','${"Test"}','${amount}','${imgbank}','${account_name}','${nameAccount}')`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data created Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

http: //localhost:5000/post/updateDepositaccount UpdateDepositaccount
exports.updateDepositaccount = async (req, res, next) => {
    const account_name = req.body.account_name;
    const amount = req.body.Amount;
    const bank = req.body.bank;
    const nameAccount = req.body.nameAccount;
    const imgbank = req.body.imgbank;
    const numberAccount = req.body.numberAccount;

    let sql = `UPDATE depositaccount set bankName = '${bank}', autorocker = '${amount}', imgbank = '${imgbank}', accountName = '${account_name}', nameAccount = '${nameAccount}' 
    WHERE accountNumber ='${numberAccount}'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data update Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }

    });
};

http: //localhost:5000/post/createWithdrawalaccount Add createWithdrawalaccount
exports.createWithdrawalaccount = async (req, res, next) => {
    const agent_ID = req.body.agent_ID;
    const account_name = req.body.account_name;
    const bank = req.body.bank;
    const nameAccount = req.body.nameAccount;
    const leakedPro = req.body.leakedPro;
    const numberAccount = req.body.numberAccount;
    const imgbank = req.body.imgbank;
    const active = req.body.active;
    const checkboxLcondition = req.body.checkboxLcondition;
    const checkboxListauto = req.body.checkboxListauto;
    const checkboxListbillPage = req.body.checkboxListbillPage;
    const checkboxListsavings = req.body.checkboxListsavings;
    const checkboxPromotion = req.body.checkboxPromotion;
    const groupBronze = req.body.groupBronze;
    const groupDiamond = req.body.groupDiamond;
    const groupGold = req.body.groupGold;
    const groupNewMember = req.body.groupNewMember;
    const groupSilver = req.body.groupSilver;
    const withdrawOver = req.body.withdrawOver;

    let sql = `INSERT INTO withdrawalaccount (bankName, status, accountNumber, algorithm, activestatus, imgbank, accountName, nameAccount, groupNewMember, groupBronze, groupSilver, groupGold,
        groupDiamond, auto_withdrawal, savingaccount, use_condition, for_promotion, billingpage, withdraw_over) 
 value ('${bank}','${"แก้ไขไม่ได้ เนื่องจากผูก Api"}','${numberAccount}','${leakedPro}','${active}','${imgbank}','${account_name}','${nameAccount}','${groupNewMember}','${groupBronze}',
 '${groupSilver}','${groupGold}','${groupDiamond}','${checkboxListauto}','${checkboxListsavings}','${checkboxLcondition}','${checkboxPromotion}','${checkboxListbillPage}','${withdrawOver}')`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data created Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

http: //localhost:5000/post/updateWithdrawalaccount UpdateWithdrawalaccount
exports.updateWithdrawalaccount = async (req, res, next) => {
    const agent_ID = req.body.agent_ID;
    const account_name = req.body.account_name;
    const bank = req.body.bank;
    const nameAccount = req.body.nameAccount;
    const leakedPro = req.body.leakedPro;
    const numberAccount = req.body.numberAccount;
    const imgbank = req.body.imgbank;
    const active = req.body.active;
    const checkboxLcondition = req.body.checkboxLcondition;
    const checkboxListauto = req.body.checkboxListauto;
    const checkboxListbillPage = req.body.checkboxListbillPage;
    const checkboxListsavings = req.body.checkboxListsavings;
    const checkboxPromotion = req.body.checkboxPromotion;
    const groupBronze = req.body.groupBronze;
    const groupDiamond = req.body.groupDiamond;
    const groupGold = req.body.groupGold;
    const groupNewMember = req.body.groupNewMember;
    const groupSilver = req.body.groupSilver;
    const withdrawOver = req.body.withdrawOver;

    let sql = `UPDATE withdrawalaccount set bankName = '${bank}', imgbank = '${imgbank}', accountName = '${account_name}', nameAccount = '${nameAccount}',
    auto_withdrawal = '${checkboxListauto}', savingaccount = '${checkboxListsavings}', use_condition = '${checkboxLcondition}', for_promotion = '${checkboxPromotion}', billingpage = '${checkboxListbillPage}', withdraw_over = '${withdrawOver}', 
    groupNewMember = '${groupNewMember}', groupBronze = '${groupBronze}', groupSilver = '${groupSilver}', groupGold = '${groupGold}', groupDiamond = '${groupDiamond}', activestatus = '${active}'
    WHERE accountNumber ='${numberAccount}'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data update Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

//http://localhost:5000/post/getWithdrawalaccount getWithdrawalaccount
exports.getWithdrawalaccount = (req, res) => {
    let sql = `SELECT * FROM withdrawalaccount`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        res.send({
            data: results
        });
        res.end();
    });
}

//http://localhost:5000/post/getOneWithdrawalaccount getOneWithdrawalaccount
exports.getOneWithdrawalaccount = (req, res) => {
    const numberAccount = req.params.numberAccount;
    let sql = `SELECT * FROM withdrawalaccount WHERE accountNumber = ${numberAccount}`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        res.send({
            data: results
        });
        res.end();
    });
}

http: //localhost:5000/post/addUserGroupInformation Add addUserGroupInformation
exports.addUserGroupInformation = async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const color = req.body.color;
    const password = req.body.password;
    const minimumWithdrawal = req.body.minimumWithdrawal;
    const withdrawalday = req.body.withdrawalday;
    const nameaccoun = req.body.nameaccoun;
    const minimumDeposit = req.body.minimumDeposit;
    const withdrawalsperday = req.body.withdrawalsperday;
    const groupmaster = req.body.groupmaster;
    const secondaryaccount = req.body.secondaryaccount;
    const secondaryaccountII = req.body.secondaryaccountII;
    const secondaryaccountIII = req.body.secondaryaccountIII;
    const account_number = req.body.account_number;

    let sql_depositaccount = `SELECT * FROM depositaccount WHERE accountNumber = "${account_number}"`;
    connection.query(sql_depositaccount, (error, results) => {
        if (error) { console.log(error) } else {
            let sql = `INSERT INTO mastergroup (agent_id, color, password, minwithdrawal, withdrawalday, nameaccoun, mindeposit, withdrawalsperday, groupmaster,
                depositaccount, secondaryaccount, secondaryaccountII, secondaryaccountIII, account_name, account_number, imgbank) 
                value ('${agent_id}','${color}','${password}','${minimumWithdrawal}','${withdrawalday}','${nameaccoun}','${minimumDeposit}','${withdrawalsperday}','${groupmaster}',
                '${results[0].accountName}','${secondaryaccount}','${secondaryaccountII}','${secondaryaccountIII}','${results[0].accountName}','${account_number}','${results[0].imgbank}')`;
            connection.query(sql, (error, result) => {
                try {
                    if (error) { console.log(error) }
                    res.send({
                        message: "Data created Success"
                    });
                    res.end();
                } catch (err) {
                    if (!err.statusCode) {
                        err.statusCode = 500;
                    }
                    next(err);
                }
            });
        }
    });
};

http: //localhost:5000/post/PutUserGroupInformation Put PutUserGroupInformation
exports.PutUserGroupInformation = async (req, res, next) => {
    const id = req.body.id;
    const agent_id = req.body.agent_id;
    const color = req.body.color;
    const password = req.body.password;
    const minimumWithdrawal = req.body.minimumWithdrawal;
    const withdrawalday = req.body.withdrawalday;
    const nameaccoun = req.body.nameaccoun;
    const minimumDeposit = req.body.minimumDeposit;
    const withdrawalsperday = req.body.withdrawalsperday;
    const groupmaster = req.body.groupmaster;
    const secondaryaccount = req.body.secondaryaccount;
    const secondaryaccountII = req.body.secondaryaccountII;
    const secondaryaccountIII = req.body.secondaryaccountIII;
    const account_number = req.body.account_number;
    //console.log(account_number)
    let sql_depositaccount = `SELECT * FROM depositaccount WHERE accountNumber = "${account_number}"`;

    connection.query(sql_depositaccount, (error, results) => {
        if (error) { console.log(error) } else {
            let sql = `UPDATE mastergroup set agent_id = '${agent_id}', color = '${color}', password = '${password}', minwithdrawal = '${minimumWithdrawal}',
            withdrawalday = '${withdrawalday}', nameaccoun = '${nameaccoun}', mindeposit = '${minimumDeposit}', withdrawalsperday = '${withdrawalsperday}', groupmaster = '${groupmaster}', depositaccount = '${results[0].accountName}', 
            secondaryaccount = '${secondaryaccount}', secondaryaccountII = '${secondaryaccountII}', secondaryaccountIII = '${secondaryaccountIII}', account_name = '${results[0].accountName}', account_number = '${account_number}', imgbank = '${results[0].imgbank}'
        WHERE id ='${id}'`;

            connection.query(sql, (error, result) => {
                try {
                    if (error) { console.log(error) }
                    res.send({
                        message: "Data Edit Success"
                    });
                    res.end();
                } catch (err) {
                    if (!err.statusCode) {
                        err.statusCode = 500;
                    }
                    next(err);
                }
            });
        }
    });
};

http: //localhost:5000/post/DeleteUserGroupInformation Put DeleteUserGroupInformation
exports.DeleteUserGroupInformation = async (req, res, next) => {
    const id = req.body.id;
    let sql = `UPDATE mastergroup set status_delete = '${'Y'}' WHERE id ='${id}'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Delete Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
};


//http://localhost:5000/post/getGroupccount/:agent_id getGroupccount
exports.getGroup = (require, response) => {
    const agent_id = require.body.agent_id;
    const searchKeyword = require.body.searchKeyword;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    //console.log(agent_id)
    if (searchKeyword === '') {
        let sql = `SELECT * FROM mastergroup WHERE agent_id = "${agent_id}" AND status_delete='N' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM mastergroup WHERE status_delete='N' `
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    data: results,
                    total: res[0].count
                });

                response.end();
            });
        });
    } else {
        let sql_statusWait = `SELECT * FROM mastergroup WHERE tpyefinance = ? AND transaction_date = ? AND status_delete = ?
        AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchKeyword}%`;
        const values = [depositwithdrawal, date, "N", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
        connection.query(sql_statusWait, values, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                data: results,
                total: results.length
            });
            response.end();
        });
    }
}

//http://localhost:5000/post/getOneGroup getOneGroup
exports.getOneGroup = (req, res) => {
    const idGroup = req.params.idGroup;
    let sql = `SELECT * FROM mastergroup WHERE id = ${idGroup} AND status_delete='N'`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        console.log(results[0])
        res.send({
            data: results
        });
        res.end();
    });
}


http://localhost:5000/post/resetPasswordUserToonta put resetPasswordUserToonta
exports.resetPasswordUserToonta = async (require, response, next) => {
    const username = require.body.username;
    const newPassword = require.body.newPassword
    const idUser = require.body.idUser;
    const idedit = require.body.idedit;
    const typeedit = require.body.typeedit;
    const agent_id = require.body.agent_id;
    const note = require.body.note;

    const hashedPassword = md5(newPassword);
    const logFuntion = logEdit.uploadLogResetPasswordMenber(idUser, idedit, username, typeedit, note, agent_id);
    let sql = `UPDATE member set password = '${hashedPassword}' WHERE username = "${username}" AND agent_id = "${agent_id}" AND status = 'Y'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            response.send({
                message: "User Member editPassword Success"
            });
            response.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
};

http://localhost:5000/post/resetPasswordUserToontaWeb put resetPasswordUserToontaWeb
exports.resetPasswordUserToontaWeb = async (require, response, next) => {
    const username = require.body.useranme;
    const newPassword = require.body.passwordConfirm;
    const passwordOle = require.body.passwordOle;
    const typeedit = require.body.typeedit;
    const agent_id = require.body.agent_id;
    const note = require.body.note;
    const hashedPassword = md5(newPassword);
    const olePassword = md5(passwordOle);

    let sqluser = `SELECT id, password FROM member WHERE username = "${username}"`;
    connection.query(sqluser, (error, resultID) => {
        console.log(olePassword, resultID[0].password)
        if (olePassword === resultID[0].password) {
            const logFuntion = logEdit.uploadLogResetPasswordMenber(resultID[0].id, resultID[0].id, username, typeedit, note, agent_id);

            let sql = `UPDATE member set password = '${hashedPassword}' WHERE username = "${username}" AND agent_id = "${agent_id}"`;
            connection.query(sql, (error, result) => {
                try {
                    if (error) { console.log(error) }
                    response.send({
                        message: "เปลียนรหัสผ่านสำเร็จ"
                    });
                    response.end();
                } catch (err) {
                    if (!err.statusCode) {
                        err.statusCode = 500;
                    }
                    next(err);
                }
            });
        } else {
            response.send({
                message: "รหัสผ่านของคุณผิด"
            });
            response.end();
        }
    });
};

http://localhost:5000/post/putCreditUserToonta put putCreditUserToonta
exports.PutCreditUserToonta = async (require, response, next) => {
    const useranme = require.body.username;
    const idUser = require.body.idUser;
    const idedit = require.body.idedit;
    const typeedit = require.body.typeedit;
    const creditnew = require.body.credit;
    const creditBefore = require.body.creditBefore;
    const agent_id = require.body.agent_id;
    const note = require.body.note;

    const logFuntion = logEdit.uploadLogEditCredit(idUser, idedit, typeedit, creditnew, creditBefore, note, agent_id, useranme);
    let sql = `UPDATE member set  credit = '${creditnew}' WHERE username = "${useranme}" AND agent_id = "${agent_id}" AND status = 'Y'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            response.send({
                message: "User Member editPassword Success"
            });
            response.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
};

http://localhost:5000/post/PutUserTurnOver put PutUserTurnOver
exports.PutUserTurnOver = async (require, response, next) => {
    const username = require.body.username;
    const idUser = require.body.idUser;
    const idedit = require.body.idedit;
    const typeedit = require.body.typeedit;
    const turnovernew = require.body.turnover;
    const turnoverBefore = require.body.turnoverBefore;
    const agent_id = require.body.agent_id;
    const note = require.body.note;

    const logFuntion = logEdit.uploadLogEditTurnOver(idUser, idedit, typeedit, turnovernew, turnoverBefore, note, agent_id, username);
    let sql = `UPDATE member set  turnover = '${turnovernew}' WHERE username = "${username}" AND agent_id = "${agent_id}"`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            response.send({
                message: "User Member editTurnOver Success"
            });
            response.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
};

http://localhost:5000/post/banUserToonta put banUserToonta
exports.banUserToonta = async (require, response) => {
    const useranme = require.params.username;
    const notinfo = require.body.notinfo
    const idUser = require.body.idUser;
    const idedit = require.body.idedit;
    const typeedit = require.body.typeedit;
    const turnovernew = require.body.turnover;
    const turnoverBefore = require.body.turnoverBefore;
    const agent_id = require.body.agent_id;
    const logFuntion = logEdit.uploadLogBan(idUser, idedit, typeedit, turnovernew, turnoverBefore, notinfo, agent_id, useranme);

    let sql = `UPDATE member set  status = 'N', note = '${notinfo}' WHERE username = "${useranme}"`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            response.send({
                message: "User Member Ban Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
};

//http://localhost:5000/post/getTransaction_History getTransaction_History
exports.getTransaction_History = (require, response) => {
    const usernanme = require.body.username;
    const searchPhones = require.body.searchPhone;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    if (searchPhones === '') {
        let sql = `SELECT * FROM logfinanceuser WHERE phonenumber = "${usernanme}" ORDER BY transaction_date DESC LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM logfinanceuser WHERE phonenumber = "${usernanme}" `
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                else {
                    let sqlmember = `SELECT * FROM member WHERE username = "${usernanme}"`;
                    connection.query(sqlmember, async (error, resultsdataMenber) => {
                        if (error) { console.log(error); }
                        response.send({
                            data: results,
                            memberdata: resultsdataMenber,
                            total: res[0].count
                        });
                        response.end();
                    })
                }
            });
        });
    } else {
        let sql_ = `SELECT * FROM logfinanceuser WHERE phonenumber = ? AND phonenumber LIKE ? 
        ORDER BY transaction_date DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [usernanme, searchPattern, pageSize, offset];

        connection.query(sql_, values, (error, resultstatusFalse) => {
            if (error) {
                console.log(error);
            } else {
                let sqlmember = `SELECT * FROM member WHERE username = "${usernanme}"`;
                connection.query(sqlmember, async (error, resultsdataMenber) => {
                    if (error) {
                        console.log(error);
                    }
                    response.send({
                        data: resultstatusFalse,
                        datamenber: resultsdataMenber,
                        total: resultstatusFalse.length
                    });
                    response.end();
                });
            }
        });
    }
}

// http://localhost:5000/post/resetPasswordUserToonta put resetPasswordUserToonta
exports.testFuntion = async (require, response) => {
    try {
        const logFuntion = logEdit.TestTest();
    } catch (err) {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    }
};

//http://localhost:5000/post/getTransaction_History getTransaction_History
exports.getRepostGame = (require, response) => {
    const searchPhones = require.body.searchPhone;
    const searcGameCamp = require.body.searcGameCamp;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    let win = 0;
    let bet = 0
    console.log(date, endDate);
    const post = {
        startdate: date, endDate: endDate
    }
    repostGame.valuewinbet(post)
        .then(calculatedValues => {
            win = calculatedValues.win
            bet = calculatedValues.bet
        })
        .catch(error => {
            console.error(error);
        });


    setTimeout(() => {
        if (searchPhones === '' && searcGameCamp === '') {
            let sql = `SELECT * FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' ORDER BY created_atdate DESC LIMIT ${pageSize} OFFSET ${offset}`;
            connection.query(sql, async (error, results) => {
                if (error) { console.log(error); }
                const totalCount = `SELECT COUNT(*) as count FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        //console.log(results)
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count,
                            wingame: win,
                            betGame: bet,
                            startdate: date,
                            enddate: endDate
                        });
                        response.end();
                    }
                });
            });
        } else if (searchPhones !== '' && searcGameCamp === '') {
            let sql_ = `SELECT * FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND username LIKE ? ORDER BY created_atdate DESC LIMIT ? OFFSET ?`;
            const searchPattern = `%${searchPhones}%`;
            const values = [searchPattern, pageSize, offset];
            connection.query(sql_, values, (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND username = '${searchPhones}'`
                    connection.query(totalCount, (error, res) => {
                        if (error) { console.log(error); }
                        else {
                            response.send({
                                data: results,
                                valusData: results.length,
                                total: res[0].count
                            });
                            response.end();
                        }
                    })
                }
            });
        } else if (searchPhones === '' && searcGameCamp !== '') {
            //console.log(searcGameCamp, searchPhones)
            let sql_ = `SELECT * FROM repostgame WHERE created_atdate >= ? AND created_atdate <= ? AND gameid LIKE ? ORDER BY created_atdate DESC LIMIT ? OFFSET ?`;
            const searchPattern = `%${searcGameCamp}%`;
            const values = [date, endDate, searchPattern, pageSize, offset];
            connection.query(sql_, values, (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND gameid = '${searcGameCamp}'`
                    connection.query(totalCount, (error, res) => {
                        if (error) { console.log(error); }
                        else {
                            response.send({
                                data: results,
                                valusData: results.length,
                                total: res[0].count
                            });
                            response.end();
                        }
                    })
                }
            });
        } else if (searchPhones === undefined && searcGameCamp === undefined) {
            let sql = `SELECT * FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' ORDER BY created_atdate DESC LIMIT ${pageSize} OFFSET ${offset}`;
            connection.query(sql, async (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}'`
                    connection.query(totalCount, (error, res) => {
                        if (error) { console.log(error); }
                        else {
                            response.send({
                                data: results,
                                valusData: results.length,
                                total: res[0].count
                            });
                            response.end();
                        }
                    })
                }
            });
        } else if (searchPhones !== undefined && searcGameCamp === undefined) {
            let sql_ = `SELECT * FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND username LIKE ? ORDER BY created_atdate DESC LIMIT ? OFFSET ?`;
            const searchPattern = `%${searchPhones}%`;
            const values = [date, searchPattern, pageSize, offset];
            connection.query(sql_, values, (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND username = '${searchPhones}'`
                    connection.query(totalCount, (error, res) => {
                        if (error) { console.log(error); }
                        else {
                            response.send({
                                data: results,
                                valusData: results.length,
                                total: res[0].count
                            });
                            response.end();
                        }
                    })
                }
            });
        } else if (searchPhones === undefined && searcGameCamp !== undefined) {
            let sql_ = `SELECT * FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND gameid LIKE ? ORDER BY created_atdate DESC LIMIT ? OFFSET ?`;
            const values = [searcGameCamp, pageSize, offset];
            connection.query(sql_, values, (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND gameid = '${searcGameCamp}'`
                    connection.query(totalCount, (error, res) => {
                        if (error) { console.log(error); }
                        else {
                            response.send({
                                data: results,
                                valusData: results.length,
                                total: res[0].count
                            });
                            response.end();
                        }
                    })
                }
            });
        } else {
            let sql_ = `SELECT * FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND gameid LIKE '%${searcGameCamp}%' AND username LIKE ? ORDER BY created_atdate DESC LIMIT ? OFFSET ?`;
            const searchPattern = `%${searchPhones}%`;
            const values = [searchPattern, pageSize, offset];
            connection.query(sql_, values, (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND username LIKE ? AND gameid LIKE '%${searcGameCamp}%'`
                    const values = [searchPattern];
                    connection.query(totalCount, values, (error, res) => {
                        if (error) { console.log(error); }
                        else {
                            response.send({
                                data: results,
                                valusData: results.length,
                                total: res[0].count
                            });
                            response.end();
                        }
                    })
                }
            });
        }
    }, 1000);
}

//http://localhost:5000/post/getMemberRegiter getMemberRegiter
exports.getMemberRegiter = (require, response) => {
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;

    try {
        const getMemberQuery = `SELECT * FROM member WHERE created_at >= '${date}' AND created_at <= '${endDate}' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
        const getTotalCountQuery = `SELECT COUNT(*) as count FROM member WHERE created_at >= '${date}' AND created_at <= '${endDate}'`;

        connection.query(getMemberQuery, async (error, results) => {
            if (error) {
                console.log(error);
                response.status(500).send("Internal Server Error");
            } else {
                connection.query(getTotalCountQuery, async (error, totalCountResult) => {
                    if (error) {
                        console.log(error);
                        response.status(500).send("Internal Server Error");
                    } else {
                        const totalCount = totalCountResult[0].count;

                        const getDepositQuery = `SELECT * FROM member WHERE created_at >= '${date}' AND created_at <= '${endDate}' AND recharge_times >= '${1}' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;
                        const getNoDepositQuery = `SELECT * FROM member WHERE created_at >= '${date}' AND created_at <= '${endDate}' AND recharge_times = '${0}' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`;

                        connection.query(getDepositQuery, async (error, resultsDeposit) => {
                            if (error) {
                                console.log(error);
                                response.status(500).send("Internal Server Error");
                            } else {
                                connection.query(getNoDepositQuery, async (error, resultsNoDeposit) => {
                                    if (error) {
                                        console.log(error);
                                        response.status(500).send("Internal Server Error");
                                    } else {
                                        response.send({
                                            data: results,
                                            valusData: results.length,
                                            dataDeposit: resultsDeposit,
                                            valusDataDeposit: resultsDeposit.length,
                                            dataNoDeposit: resultsNoDeposit,
                                            valusNoDataDeposit: resultsNoDeposit.length,
                                            total: totalCount,
                                        });
                                        response.end();
                                    }
                                });
                            }
                        });
                    }
                });
            }
        });
    } catch (error) {
        console.log(error);
        response.status(500).send("Internal Server Error");
    }
};


//http://localhost:5000/post/getRepostDeposit getRepostDeposit
exports.getRepostDeposit = (require, response) => {
    const searchPhones = require.body.searchPhone;
    const searcKey = require.body.searcKey;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    const depositwithdrawal = require.body.depositwithdrawal;

    if (searchPhones === '' && searcKey === '') {
        let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}'  LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                else {
                    response.send({
                        data: results,
                        valusData: results.length,
                        total: res[0].count
                    });
                    response.end();
                }
            });
        });
    } else if (searchPhones !== '' && searcKey === '') {
        let sql_deposit = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date >='${date}' AND transaction_date <= '${endDate}' AND phonenumber LIKE ?
                LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [depositwithdrawal, searchPattern, pageSize, offset];
        connection.query(sql_deposit, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: results.length
                        });
                        response.end();
                    }
                })
            }
        });
    } else if (searchPhones === '' && searcKey !== '') {
        //console.log(endDate, date)
        let sql_ = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >= ? AND transaction_date <= ? AND accountName LIKE ? LIMIT ? OFFSET ?`;
        const searchPattern = `%${searcKey}%`;
        const values = [date, endDate, searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: results.length
                        });
                        response.end();
                    }
                })
            }
        });
    } else if (searchPhones === undefined && searcKey === undefined) {
        let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: results.length
                        });
                        response.end();
                    }
                })
            }
        });
    } else if (searchPhones !== undefined && searcKey === undefined) {
        let sql_ = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}' AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [date, searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: results.length
                        });
                        response.end();
                    }
                })
            }
        });
    } else if (searchPhones === undefined && searcKey !== undefined) {
        let sql_ = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}' AND accountName LIKE ? LIMIT ? OFFSET ?`;
        const values = [searcKey, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: results.length
                        });
                        response.end();
                    }
                })
            }
        });
    } else {
        //console.log(searcKey, searchPhones)
        let sql_ = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}' AND phonenumber LIKE ? AND accountName LIKE '%${searcKey}%' LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date >='${date}' AND transaction_date <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: results.length
                        });
                        response.end();
                    }
                })
            }
        });
    }
}

//http://localhost:5000/post/getRepostWebdaily getRepostWebdaily
exports.getRepostWebdaily = (require, response) => {
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    const tpyeadmin = require.body.tpyeadmin;
    const token = require.body.token

    let sql_token = `SELECT tokenlogin FROM ${tpyeadmin} WHERE tokenlogin = '${token}'`;
    connection.query(sql_token, (error, res) => {
        if (error) {
            console.log(error);
            response.status(500).send({ error: 'Database error' });
            response.end();
        }
        else {
            if (res.length >= 1 && res.length !== 0) {
                console.log(tpyeadmin, token);
                let win = 0;
                let bet = 0;
                let membervalue = 0;
                let allmember = 0;
                let depositvalut = 0;
                let withdrawvalue = 0;
                let depositvalutTotal = 0;
                let withdrawvalueTotal = 0;
                let topuserwit;
                let topuserlose;
                let topuserturnover;
                let topDeposit;
                let topWithdraw;
                let roundplayvalueTotal = 0;
                let valususerplayDay = 0;
                let lengthdeposit = 0;
                let lengthwithdra = 0;
                let memberdepositfilht = 0;
                let bunus = 0;
                const post = {
                    startdate: date, endDate: endDate
                }
                repostGame.valuewinbet(post)
                    .then(calculatedValues => {
                        win = calculatedValues.win
                        bet = calculatedValues.bet
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.valuedailyRegisterMamber(post)
                    .then(calculatedValues => {
                        membervalue = calculatedValues.membervalue
                        allmember = calculatedValues.allmember
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.valuedailyFinanceDeposit(post)
                    .then(calculatedValues => {
                        depositvalut = calculatedValues.depositvalut
                        lengthdeposit = calculatedValues.lengthdeposit
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.valuedailyFinanceWithdraw(post)
                    .then(calculatedValues => {
                        withdrawvalue = calculatedValues.withdrawvalue
                        lengthwithdra = calculatedValues.lengthwithdra
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.valuedailyFinanceDepositTotal()
                    .then(calculatedValues => {
                        depositvalutTotal = calculatedValues.depositvalutTotal;
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.valuedailyFinanceWithdrawTotal()
                    .then(calculatedValues => {
                        withdrawvalueTotal = calculatedValues.withdrawvalueTotal;
                    })
                    .catch(error => {
                        console.error(error);
                    });
                repostGame.topwit(post)
                    .then(calculatedValues => {
                        topuserwit = calculatedValues
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.toplose(post)
                    .then(calculatedValues => {
                        topuserlose = calculatedValues
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.topturnover(post)
                    .then(calculatedValues => {
                        topuserturnover = calculatedValues
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.topWithdraw(post)
                    .then(calculatedValues => {
                        topWithdraw = calculatedValues
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.topDeposit(post)
                    .then(calculatedValues => {
                        topDeposit = calculatedValues
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.totalroundplayday(post)
                    .then(calculatedValues => {
                        roundplayvalueTotal = calculatedValues.roundplayvalueTotal;
                        valususerplayDay = calculatedValues.valususerplayDay;
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.valuedailyFinanceWithdrawMember(post)
                    .then(calculatedValues => {
                        memberdepositfilht = calculatedValues.lengthwithdraMember;
                    })
                    .catch(error => {
                        console.error(error);
                    });

                repostGame.valuedailyBounnus(post)
                    .then(calculatedValuesI => {
                        repostGame.valuedailyBounnusII(post)
                            .then(calculatedValuesII => {
                                bunus = calculatedValuesI.bunus + calculatedValuesII.bunus;
                            })
                            .catch(error => {
                                console.error(error);
                            });
                    })
                    .catch(error => {
                        console.error(error);
                    });

                setTimeout(() => {
                    response.send({
                        wingame: win,
                        betGame: bet,
                        membervalueday: membervalue,
                        allmember: allmember,
                        depositvalut: depositvalut,
                        withdrawvalue: withdrawvalue,
                        depositvalutTotal: depositvalutTotal,
                        withdrawvalueTotal: withdrawvalueTotal,
                        startdate: date,
                        enddate: endDate,
                        topuserturnover: topuserturnover,
                        topuserwit: topuserwit,
                        topuserlose: topuserlose,
                        topDeposit: topDeposit,
                        topWithdraw: topWithdraw,
                        roundplayvalueTotal: roundplayvalueTotal,
                        valususerplayDay: valususerplayDay,
                        lengthdeposit: lengthdeposit,
                        lengthwithdra: lengthwithdra,
                        memberdepositfilht: memberdepositfilht,
                        bunus: bunus,
                    });
                    response.end();
                }, 500);
            } else {
                response.status(500).send({ error: 'DatabaseError' });
                response.end();
            }
        }
    })
}

//http://localhost:5000/post/getRepostDeposit getRepostDeposit
exports.getRepostTurnover = (require, response) => {
    const searchPhones = require.body.searchPhone;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    const depositwithdrawal = require.body.depositwithdrawal;
    //console.log(searchPhones, pageSize, offset, date, endDate)
    if (searchPhones === '') {
        let sql = `
        SELECT 
          usernameuser, 
          SUM(turnover) AS turnover, 
          SUM(win) AS win, 
          SUM(lose) AS lose, 
          SUM(roundplay) AS roundplay, 
          SUM(ag_winlose) AS ag_winlose, 
          SUM(ag_comm) AS ag_comm, 
          SUM(ag_total) AS ag_total, 
          SUM(comny_total) AS comny_total
        FROM totalturnoverrepost 
        WHERE day >= '${date}' AND day <= '${endDate}' 
        GROUP BY usernameuser 
        LIMIT ${pageSize} OFFSET ${offset}
      `;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                else {
                    // console.log(results)
                    response.send({
                        data: results,
                        valusData: results.length,
                        total: res[0].count,
                    });
                    response.end();
                }
            });
        });
    } else if (searchPhones !== '') {
        let sql_deposit = `SELECT usernameuser, 
            SUM(turnover) AS turnover, 
            SUM(win) AS win, 
            SUM(lose) AS lose, 
            SUM(roundplay) AS roundplay, 
            SUM(ag_winlose) AS ag_winlose, 
            SUM(ag_comm) AS ag_comm, 
            SUM(ag_total) AS ag_total, 
            SUM(comny_total) AS comny_total FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND usernameuser LIKE ? GROUP BY usernameuser
                LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [searchPattern, pageSize, offset];
        connection.query(sql_deposit, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: results.length
                        });
                        response.end();
                    }
                })
            }
        });
    }
    //else if (searchPhones === '') {
    //     let sql_ = `SELECT * FROM totalturnoverrepost WHERE day >= ? AND day <= ? AND usernameuser LIKE ? LIMIT ? OFFSET ?`;
    //     const searchPattern = `%${searchPhones}%`;
    //     const values = [date, endDate, searchPattern, pageSize, offset];
    //     connection.query(sql_, values, (error, results) => {
    //         if (error) { console.log(error); }
    //         else {
    //             const totalCount = `SELECT COUNT(*) as count FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}'`
    //             connection.query(totalCount, (error, res) => {
    //                 if (error) { console.log(error); }
    //                 else {
    //                     response.send({
    //                         data: results,
    //                         valusData: results.length,
    //                         total: res[0].count,
    //                     });
    //                     response.end();
    //                 }
    //             })
    //         }
    //     });
    // } 
    else if (searchPhones === undefined) {
        let sql = `
        SELECT 
          usernameuser, 
          SUM(turnover) AS turnover, 
          SUM(win) AS win, 
          SUM(lose) AS lose, 
          SUM(roundplay) AS roundplay, 
          SUM(ag_winlose) AS ag_winlose, 
          SUM(ag_comm) AS ag_comm, 
          SUM(ag_total) AS ag_total, 
          SUM(comny_total) AS comny_total
        FROM totalturnoverrepost 
        WHERE day >= '${date}' AND day <= '${endDate}' 
        GROUP BY usernameuser 
        LIMIT ${pageSize} OFFSET ${offset}
      `;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                else {
                    // console.log(results)
                    response.send({
                        data: results,
                        valusData: results.length,
                        total: res[0].count,
                    });
                    response.end();
                }
            });
        });
    } else if (searchPhones !== undefined) {
        let sql_deposit = `SELECT usernameuser, 
            SUM(turnover) AS turnover, 
            SUM(win) AS win, 
            SUM(lose) AS lose, 
            SUM(roundplay) AS roundplay, 
            SUM(ag_winlose) AS ag_winlose, 
            SUM(ag_comm) AS ag_comm, 
            SUM(ag_total) AS ag_total, 
            SUM(comny_total) AS comny_total FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND usernameuser LIKE ? GROUP BY usernameuser
                LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: results.length
                        });
                        response.end();
                    }
                })
            }
        });
    }
    // else if (searchPhones === undefined) {
    //     let sql_ = `SELECT * FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND usernameuser LIKE ? LIMIT ? OFFSET ?`;
    //     const values = [searchPhones, pageSize, offset];
    //     connection.query(sql_, values, (error, results) => {
    //         if (error) { console.log(error); }
    //         else {
    //             const totalCount = `SELECT COUNT(*) as count FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}'`
    //             connection.query(totalCount, (error, res) => {
    //                 if (error) { console.log(error); }
    //                 else {
    //                     response.send({
    //                         data: results,
    //                         valusData: results.length,
    //                         total: results.length
    //                     });
    //                     response.end();
    //                 }
    //             })
    //         }
    //     });
    // } 
    else {
        //console.log(searcKey, searchPhones)
        let sql_ = `SELECT * FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND usernameuser LIKE ? LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM totalturnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND usernameuser LIKE '%${searchPhones}%'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count,
                        });
                        response.end();
                    }
                })
            }
        });
    }
}

//http://localhost:5000/post/getRepostTurnoverGameCamp getRepostTurnoverGameCamp
exports.getRepostTurnoverGameCamp = (require, response) => {
    const searchPhones = require.body.searchPhone;
    const searcGameCamp = require.body.searcGameCamp;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    //console.log(searchPhones, date, endDate);
    if (searchPhones === '' && searcGameCamp === '') {

        let sql = `SELECT * FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' ORDER BY day DESC LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                else {
                    response.send({
                        data: results,
                        valusData: results.length,
                        total: res[0].count,
                        startdate: date,
                        enddate: endDate
                    });
                    response.end();
                }
            });
        });
    } else if (searchPhones !== '' && searcGameCamp === '') {
        let sql_ = `SELECT * FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND 	usernameuser  LIKE ? ORDER BY day DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND usernameuser LIKE '%${searchPhones}%'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                })
            }
        });
    } else if (searchPhones === '' && searcGameCamp !== '') {
        //console.log(searcGameCamp, searchPhones)
        let sql_ = `SELECT * FROM turnoverrepost WHERE day >= ? AND day <= ? AND gamecamp LIKE ? ORDER BY day DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searcGameCamp}%`;
        const values = [date, endDate, searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND gamecamp LIKE '%${searcGameCamp}%'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                })
            }
        });
    } else if (searchPhones === undefined && searcGameCamp === undefined) {
        let sql = `SELECT * FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' ORDER BY day DESC LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                })
            }
        });
    } else if (searchPhones !== undefined && searcGameCamp === undefined) {
        let sql_ = `SELECT * FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND usernameuser LIKE ? ORDER BY day DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [date, searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND usernameuser LIKE '%${searchPhones}%'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                })
            }
        });
    } else if (searchPhones === undefined && searcGameCamp !== undefined) {
        let sql_ = `SELECT * FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND gamecamp LIKE ? ORDER BY day DESC LIMIT ? OFFSET ?`;
        const values = [searcGameCamp, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND gamecamp LIKE '%${searcGameCamp}%'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                })
            }
        });
    } else {
        //console.log(searcGameCamp, searchPhones)
        let sql_ = `SELECT * FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND gamecamp LIKE '%${searcGameCamp}%' AND usernameuser LIKE ? ORDER BY day DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        //const searchPatternKey = `%${searcGameCamp}%`;
        const values = [searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM turnoverrepost WHERE day >='${date}' AND day <= '${endDate}' AND  gamecamp LIKE '%${searcGameCamp}%' AND usernameuser LIKE '%${searchPhones}%'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                })
            }
        });
    }
}

//http://localhost:5000/post/getRepostGameCamp getRepostGameCamp
exports.getRepostGameCamp = (require, response) => {
    const searcGameCamp = require.body.searcGameCamp;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    //console.log(searcGameCamp, date, endDate);
    if (searcGameCamp === '') {
        let sql = `
        SELECT 
          namegamecamp,
          SUM(grossComm) AS grossComm,
          SUM(turnover) AS turnover, 
          SUM(win) AS win, 
          SUM(lose) AS lose,
          SUM(commmember) AS commmember,  
          SUM(totalmamber) AS totalmamber, 
          SUM(w_l_agent) AS w_l_agent,
          SUM(comm_agent) AS comm_agent, 
          SUM(tatal_agent) AS tatal_agent, 
          SUM(w_l_commny) AS w_l_commny, 
          SUM(comm_commny) AS comm_commny,
          SUM(tatal_commny) AS tatal_commny,
          SUM(roundplay) AS roundplay
        FROM gamecamptotal 
        WHERE day >= '${date}' AND day <= '${endDate}' 
        GROUP BY namegamecamp 
        LIMIT ${pageSize} OFFSET ${offset}`;

        connection.query(sql, async (error, results) => {
            if (error) {
                console.log(error);
                response.send({ error: 'Failed to fetch data' });
                return;
            }

            const totalCount = `SELECT COUNT(*) as count FROM gamecamptotal WHERE day >='${date}' AND day <= '${endDate}'`;
            connection.query(totalCount, (error, res) => {
                if (error) {
                    console.log(error);
                    response.send({ error: 'Failed to fetch total count' });
                    return;
                }

                let sql_All = `
            SELECT 
              SUM(grossComm) AS grossComm,
              SUM(turnover) AS turnover, 
              SUM(win) AS win, 
              SUM(lose) AS lose,
              SUM(commmember) AS commmember,  
              SUM(totalmamber) AS totalmamber, 
              SUM(w_l_agent) AS w_l_agent,
              SUM(comm_agent) AS comm_agent, 
              SUM(tatal_agent) AS tatal_agent, 
              SUM(w_l_commny) AS w_l_commny, 
              SUM(comm_commny) AS comm_commny,
              SUM(tatal_commny) AS tatal_commny,
              SUM(roundplay) AS roundplay
            FROM gamecamptotal 
            WHERE day >= '${date}' AND day <= '${endDate}' 
            GROUP BY day >= '${date}' AND day <= '${endDate}'  
            LIMIT ${pageSize} OFFSET ${offset}`;

                connection.query(sql_All, async (error, results_All) => {
                    if (error) {
                        console.log(error);
                        response.send({ error: 'Failed to fetch additional data' });
                        return;
                    }
                    const combinedData = (results && results_All) ? results.concat(results_All) : (results || results_All);
                    response.send({
                        data: combinedData || [], // If no data found, send an empty array
                        valusData: combinedData ? combinedData.length : 0,
                        total: res[0].count || 0,
                        startdate: date,
                        enddate: endDate
                    });
                    response.end();
                });
            });
        });
    } else if (searcGameCamp !== '') {
        let sql_ = `SELECT * FROM gamecamptotal WHERE day >= ? AND day <= ? AND namegamecamp LIKE ? ORDER BY day DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searcGameCamp}%`;
        const values = [date, endDate, searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) {
                console.log(error);
            } else {
                const totalCount = `SELECT COUNT(*) as count FROM gamecamptotal WHERE day >='${date}' AND day <= '${endDate}' AND namegamecamp LIKE '%${searcGameCamp}%'`
                connection.query(totalCount, (error, res) => {
                    if (error) {
                        console.log(error);
                    } else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                });
            }
        });
    } else if (searcGameCamp === undefined) {
        let sql = `SELECT * FROM gamecamptotal WHERE day >='${date}' AND day <= '${endDate}' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM gamecamptotal WHERE day >='${date}' AND day <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                })
            }
        });
    } else if (searcGameCamp !== undefined) {
        let sql_ = `SELECT * FROM gamecamptotal WHERE day >='${date}' AND day <= '${endDate}' AND namegamecamp LIKE ? LIMIT ? OFFSET ?`;
        const values = [searcGameCamp, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM gamecamptotal WHERE day >='${date}' AND day <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                })
            }
        });
    } else {
        let sql_ = `SELECT * FROM gamecamptotal WHERE day >='${date}' AND day <= '${endDate}' AND namegamecamp LIKE '%${searcGameCamp}%' AND usernameuser LIKE ? LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM gamecamptotal WHERE day >='${date}' AND day <= '${endDate}'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                })
            }
        });
    }
}

exports.testtesttest = (require, response) => {
    let test = repostGame.turnoverrepost();
}
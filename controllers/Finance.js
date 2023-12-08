const express = require('express');
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const md5 = require('md5');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const axios = require('axios'); //npm install axios
const app = express();
const socketIo = require('socket.io');
const moment = require('moment-timezone')
app.use(express.static('public'));
require('dotenv').config()

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

function formatNumber(num) {
    return String(num).padStart(5, '0');
}

module.exports = class Post {
    constructor(email, password, role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }

    static CheckInformation(restest, dataUser) {
        return new Promise((resolve, reject) => {

            const resFinance = restest;
            const dataUsers = dataUser;

            let baseURL = 'https://dogzilla.live/';
            //const baseURL = 'http://localhost:5000/';

            const currentTimeInThailand = moment().tz('Asia/Bangkok');
            const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
            const formattedTime = currentTimeInThailand.format('HH:mm:ss');
            let imgBank = ''
            //console.log(dataUsers , resFinance);
            let Bank;
            switch (resFinance.data.sendingBank) {
                case '002':
                    Bank = "ธนาคารกรุงเทพ";
                    break;
                case '004':
                    Bank = "ธนาคารกสิกรไทย";
                    break;
                case '006':
                    Bank = "ธนาคารกรุงไทย";
                    break;
                case '011':
                    Bank = "ธนาคารทหารไทยธนชาต";
                    break;
                case '014':
                    Bank = "ธนาคารไทยพาณิชย์";
                    break;
                case '025':
                    Bank = "ธนาคารกรุงศรีอยุธยา";
                    break;
                case '069':
                    Bank = "ธนาคารเกียรตินาคินภัทร";
                    break;
                case '022':
                    Bank = "ธนาคารซีไอเอ็มบีไทย";
                    break;
                case '071':
                    Bank = "ธนาคารไทยเครดิตเพื่อรายย่อย";
                    break;
                case '067':
                    Bank = "ธนาคารทิสโก้";
                    break;
                case '024':
                    Bank = "ธนาคารยูโอบี";
                    break;
                case '070':
                    Bank = 'ธนาคารไอซีบีซี (ไทย)';
                    break;
                case '098':
                    Bank = "ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย";
                    break;
                case '034':
                    Bank = "ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร";
                    break;
                case '035':
                    Bank = "ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย";
                    break;
                case '030':
                    Bank = "ธนาคารออมสิน";
                    break;
                case '033':
                    Bank = 'ธนาคารอาคารสงเคราะห์';
                    break;
                default:
                    Bank = "ธนาคารไทยพาณิชย์";
            }

            const inputString = resFinance.data.sender.account.value;
            const last4Digits = inputString.replace(/\D/g, '').slice(-4);

            const inputStringUser = resFinance.data.receiver.account.value;
            const last4DigitsUser = inputStringUser.replace(/\D/g, '').slice(-4);

            //console.log(last4Digits, last4DigitsUser)
            //console.log(Bank, resFinance.data.receiver.account.value);
            if (Bank !== "ธนาคารกสิกรไทย" && Bank !== "ธนาคารกรุงศรีอยุธยา" && Bank !== "ธนาคารกรุงไทย") {
                let sql_deposit = `SELECT * FROM depositaccount WHERE activestatus = "เปิดใช้งาน" AND SUBSTRING(accountNumber, 6, 4) = '${last4DigitsUser}'`;
                connection.query(sql_deposit, (error, depositData) => {
                    try {
                        if (error) {
                            console.log(error);
                            reject("ผิดพลาด");
                        }
                        else {
                            const data = depositData;
                            if (data.length !== 0 || data.length > 0) {
                                let sql_LogDeposit = `SELECT * FROM logfinanceuser WHERE trans_ref ='${resFinance.data.transRef}'`;
                                connection.query(sql_LogDeposit, async (error, logDeposit_transRef) => {
                                    if (error) {
                                        console.log(error);
                                        reject(error);
                                    } else {
                                        const dataLog = logDeposit_transRef;
                                        if (dataLog.length < 1) {
                                            let sql_NameAccount = `SELECT * FROM member WHERE RIGHT(accountNumber, 4) LIKE ? AND bank = '${Bank}' AND phonenumber = '${dataUsers.phonenumber}'`;
                                            connection.query(sql_NameAccount, ['%' + last4Digits], async (error, nameAccount) => {
                                                if (error) {
                                                    console.log(error);
                                                    reject(error);
                                                } else {
                                                    const dataUserAccount = nameAccount;
                                                    if (dataUserAccount.length !== 0 || dataUserAccount.length > 0) {
                                                        let sql_Bank = `SELECT images FROM banknames WHERE bankname_name ='${nameAccount[0].bank}' AND status = 'Y' AND status_delete = 'N'`;
                                                        connection.query(sql_Bank, async (error, usernameAgent) => {
                                                            const response = await axios.post(baseURL + "post/financeUser", {
                                                                resFinance: resFinance,
                                                                type: dataUsers.type,
                                                                quantity: resFinance.data.amount,
                                                                accountNumber: dataUserAccount[0].accountNumber,
                                                                destinationAccountName: resFinance.data.receiver.displayName,
                                                                destinationAccountNumber: data[0].accountNumber,
                                                                phonenumber: dataUsers.phonenumber,
                                                                statusFinance: 'สำเร็จ',
                                                                nameimg: dataUsers.filename,
                                                                transRef: resFinance.data.transRef,
                                                                qrcodeData: resFinance.data.qrcodeData,
                                                                agent_id: dataUsers.agent_id,
                                                                typePromotion: dataUsers.idPromotion,
                                                                imgBank: usernameAgent[0].images,
                                                                actualize: "ฝากโดย member จากเว็บไซต์"
                                                            });
                                                            //console.log(response.data.message)
                                                            if (response.data.message === "เติมเงินสำเร็จ") {
                                                                resolve("ฝากเงินสำเสร็จ")
                                                            } else {
                                                                resolve(response.data.message)
                                                            }
                                                        })
                                                    } else {
                                                        const response = await axios.post(baseURL + "post/financeUser", {
                                                            resFinance: resFinance,
                                                            type: dataUsers.type,
                                                            quantity: resFinance.data.amount,
                                                            accountNumber: "ไม่มีเลขบัญชีในระบบ",
                                                            destinationAccountName: resFinance.data.receiver.displayName,
                                                            destinationAccountNumber: data[0].accountNumber,
                                                            phonenumber: dataUsers.phonenumber,
                                                            statusFinance: 'รอ',
                                                            nameimg: dataUsers.filename,
                                                            transRef: resFinance.data.transRef,
                                                            qrcodeData: resFinance.data.qrcodeData,
                                                            agent_id: dataUsers.agent_id,
                                                            typePromotion: dataUsers.idPromotion,
                                                            imgBank: 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-baac.png'
                                                        });
                                                        if (response.data.message === "บันทึกสำเร็จ") {
                                                            resolve("ชื่อบัญชีที่ได้ลงทะเบียนไม่ถูกต้อง กรุณาตรวจสอบ สลิปโอนเงิน ")
                                                        } else {
                                                            resolve("ล้มเหลวในการทำรายการ")
                                                        }
                                                    }
                                                }
                                            })
                                        } else {
                                            let sql_depositFlash = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                                balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber, trans_ref, qrcodeData, nameimg) value 
                                                ('${dataUsers.id}','${dataUsers.agent_id}','${dataUsers.accountName}','${dataUsers.accountNumber}','${dataUsers.phonenumber}','${'ฝาก'}','${0}','${0}','${0}'
                                                ,'${0}','${'00000'}${'00000'}','${0}','ไม่สำเร็จ','${formattedDate}','${formattedTime}','สลิปนี้เคยถูกใช้งานแล้ว','${"https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-baac.png"}'
                                                ,'${resFinance.data.receiver.displayName}','${data[0].accountNumber}','สลิปนี้เคยถูกใช้งานแล้ว', 'สลิปนี้เคยถูกใช้งานแล้ว', '${dataUsers.filename}')`;
                                            connection.query(sql_depositFlash, (error, result) => {
                                                resolve("สลิปนี้เคยถูกใช้งานแล้ว")
                                            })
                                        }
                                    }
                                })
                            } else {
                                resolve("ไม่มีชื่อบัญชีธนาคารของเว็บ Toonta ในระบบเงินฝาก")
                            }
                        }
                    } catch (err) {
                        if (!err.statusCode) {
                            err.statusCode = 500;
                        }
                    }
                })
            } else {
                //let dataaccountNumber = resFinance.data.receiver.account.value;
                let sql_deposit = `SELECT * FROM depositaccount WHERE activestatus = "เปิดใช้งาน" AND SUBSTRING(accountNumber, 6, 4) = '${last4DigitsUser}'`;
                connection.query(sql_deposit, (error, depositData) => {
                    try {
                        if (error) {
                            console.log(error);
                            reject("ผิดพลาด");
                        }
                        else {
                            //console.log(resFinance.data.receiver.account.value)
                            const data = depositData;
                            if (data.length !== 0 || data.length > 0) {
                                //console.log('on1')
                                let sql_LogDeposit = `SELECT * FROM logfinanceuser WHERE trans_ref ='${resFinance.data.transRef}'`;
                                connection.query(sql_LogDeposit, async (error, logDeposit_transRef) => {
                                    if (error) {
                                        console.log(error);
                                        reject(error);
                                    } else {
                                        const dataLog = logDeposit_transRef;
                                        if (dataLog.length < 1) {
                                            //console.log('on2')
                                            let sql_NameAccount = `SELECT * FROM member WHERE bank = '${Bank}' AND phonenumber = '${dataUsers.phonenumber}'
                                            AND SUBSTRING(accountNumber, 6, 4) = ? `;
                                            connection.query(sql_NameAccount, [last4Digits], async (error, nameAccount) => {
                                                if (error) {
                                                    console.log(error);
                                                    reject(error);
                                                } else {
                                                    const dataUserAccount = nameAccount;
                                                    if (dataUserAccount.length !== 0 || dataUserAccount.length > 0) {
                                                        let sql_Bank = `SELECT images FROM banknames WHERE bankname_name ='${nameAccount[0].bank}' AND status = 'Y' AND status_delete = 'N'`;
                                                        connection.query(sql_Bank, async (error, usernameAgent) => {
                                                            //console.log('on6')
                                                            const response = await axios.post(baseURL + "post/financeUser", {
                                                                resFinance: resFinance,
                                                                type: dataUsers.type,
                                                                quantity: resFinance.data.amount,
                                                                accountNumber: dataUsers.accountNumber,
                                                                destinationAccountName: resFinance.data.receiver.displayName,
                                                                destinationAccountNumber: data[0].accountNumber,
                                                                phonenumber: dataUsers.phonenumber,
                                                                statusFinance: 'สำเร็จ',
                                                                nameimg: dataUsers.filename,
                                                                transRef: resFinance.data.transRef,
                                                                qrcodeData: resFinance.data.qrcodeData,
                                                                agent_id: dataUsers.agent_id,
                                                                typePromotion: dataUsers.idPromotion,
                                                                imgBank: usernameAgent[0].images,
                                                                actualize: "ฝากโดย member จากเว็บไซต์"
                                                            });
                                                            if (response.data.message === "เติมเงินสำเร็จ") {
                                                                resolve("ฝากเงินสำเสร็จ")
                                                            } else {
                                                                resolve(response.data.message)
                                                            }
                                                        })
                                                    } else {
                                                        //console.log('on4')
                                                        const response = await axios.post(baseURL + "post/financeUser", {
                                                            resFinance: resFinance,
                                                            type: dataUsers.type,
                                                            quantity: resFinance.data.amount,
                                                            accountNumber: "ไม่มีเลขบัญชีในระบบ",
                                                            destinationAccountName: resFinance.data.receiver.displayName,
                                                            destinationAccountNumber: data[0].accountNumber,
                                                            phonenumber: dataUsers.phonenumber,
                                                            statusFinance: 'รอ',
                                                            nameimg: dataUsers.filename,
                                                            transRef: resFinance.data.transRef,
                                                            qrcodeData: resFinance.data.qrcodeData,
                                                            agent_id: dataUsers.agent_id,
                                                            typePromotion: dataUsers.idPromotion,
                                                            imgBank: 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-baac.png'
                                                        });
                                                        if (response.data.message === "เติมเงินไม่สำเร็จ") {
                                                            resolve("ชื่อบัญชีที่ได้ลงทะเบียนไม่ถูกต้อง กรุณาตรวจสอบ สลิปโอนเงิน ")
                                                        } else {
                                                            resolve("ล้มเหลวในการทำรายการ")
                                                        }
                                                    }
                                                }
                                            })
                                        } else {
                                            let sql_depositFlash = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                                balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber, trans_ref, qrcodeData, nameimg) value 
                                                ('${dataUsers.id}','${dataUsers.agent_id}','${dataUsers.accountName}','${dataUsers.accountNumber}','${dataUsers.phonenumber}','${'ฝาก'}','${0}','${0}','${0}'
                                                ,'${0}','${'00000'}${'00000'}','${0}','ไม่สำเร็จ','${formattedDate}','${formattedTime}','สลิปนี้เคยถูกใช้งานแล้ว','${"https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-baac.png"}'
                                                ,'${resFinance.data.receiver.displayName}','${data[0].accountNumber}','สลิปนี้เคยถูกใช้งานแล้ว', 'สลิปนี้เคยถูกใช้งานแล้ว', '${dataUsers.filename}')`;
                                            connection.query(sql_depositFlash, (error, result) => {
                                                resolve("สลิปนี้เคยถูกใช้งานแล้ว")
                                            })
                                        }
                                    }
                                })
                            } else {
                                resolve("ไม่มีชื่อบัญชีธนาคารของเว็บ Toonta ในระบบเงินฝาก")
                            }
                        }
                    } catch (err) {
                        if (!err.statusCode) {
                            err.statusCode = 500;
                        }
                    }
                })
            }
        });
    }


    static Withdrawmoney(resultUser, formattedDate, formattedNumber, billnum, quantity, accountNumber, phonenumber, status) {
        return new Promise((resolve, reject) => {
            //console.log(resultUser.bank);

            let sql_Bank = `SELECT id, images FROM banknames WHERE bankname_name ='${resultUser.bank}' AND status = 'Y' AND status_delete = 'N'`;
            connection.query(sql_Bank, (error, usernameAgent) => {
                //console.log(usernameAgent);
                try {
                    if (error) {
                        console.log(error)
                    } else {
                        let statusValus;

                        if (quantity < 1000) {
                            statusValus = 'N'
                        } else {
                            statusValus = 'Y'
                        }
                        //console.log(Bank, resultUser.agent_id, status)
                        let sql_before = `INSERT INTO withdraw (agent_id, bill_number, numberbill, quantity, accountName, accountNumber, phonenumber, transaction_date, time, bank, status_withdraw, status_value, images) value 
                        ('${resultUser.agent_id}','T${formattedDate}${formattedNumber}','${billnum}','${quantity}','${resultUser.accountName}','${accountNumber}','${phonenumber}', now(), now(),'${usernameAgent[0].id}','${status}','${statusValus}','${usernameAgent[0].images}')`;
                        connection.query(sql_before, (error, result) => {
                            let jsArray = "ระบบกำลังดำเนินการ";
                            resolve(jsArray);
                        });
                    }
                } catch (err) {
                    if (!err.statusCode) {
                        err.statusCode = 500;
                    }
                    next(err);
                }
            })
        });
    }

    static UpdateLogRepostFinance(resultUser, transaction, quantity) {

        const today = new Date();
        const day = String(today.getDate()).padStart(2, '0');
        const month = String(today.getMonth() + 1).padStart(2, '0'); // JavaScript months are 0-based, so we add 1
        const year = today.getFullYear();
        const formattedDateBill = `${year}-${month}-${day}`;

        let sql_Repost = `SELECT * FROM logfinancerepost WHERE username ='${resultUser}' AND transaction_date = '${formattedDateBill}' AND transaction = '${transaction}'`;
        connection.query(sql_Repost, (error, usernameAgent) => {
            try {
                if (error) {
                    console.log(error)
                } else {
                    if (usernameAgent.length !== 0) {
                        let sql = `UPDATE logfinancerepost set quantity = '${usernameAgent[0].quantity + quantity}' 
                        WHERE username ='${resultUser}' AND transaction_date = '${formattedDateBill}' AND transaction = '${transaction}'`;
                        connection.query(sql, (error, resultAfter) => {
                            if (error) {
                                console.log(error);
                            }
                            let jsArray = "บันทึกสำเร็จ";
                        });
                    } else {
                        let sql_before = `INSERT INTO logfinancerepost (transaction, username, quantity, transaction_date) value 
                        ('${transaction}','${resultUser}','${quantity}','${formattedDateBill}')`;
                        connection.query(sql_before, (error, result) => {
                            if (error) {
                                console.log(error);
                            }
                            let jsArray = "บันทึกสำเร็จ";
                        });
                    }
                }
            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        })
    }
};

function logFlashDeposit() {

}
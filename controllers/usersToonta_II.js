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
const moment = require('moment-timezone')
const logEdit = require('./logEditAll')
const promotiontoonta = require('./promotiontoonta')
const repostGame = require('./repostGame')
const Finance = require('./Finance')
const app = express();
app.use(express.static('public'));
require('dotenv').config()
const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

http: //localhost:5000/GetWithdrawStatus Get GetWithdrawStatus
exports.GetWithdrawStatus = async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const phonenumber = req.body.phonenumber;
    let sql_agent = `SELECT * FROM withdraw WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status_withdraw = 'in_progress'`;
    connection.query(sql_agent, (error, usernameAgent) => {
        try {
            if (error) {
                console.log(error)
            } else {
                if (usernameAgent.length !== 0) {
                    res.send({
                        message: 'sentData',
                        data: usernameAgent
                    });
                    res.end();
                } else {
                    let sql_uses = `SELECT credit,	turnover FROM member WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}'`;
                    connection.query(sql_uses, (error, usernameAgent) => {
                        if (error) {
                            console.log(error)
                        } else {
                            if (usernameAgent.length !== 0) {
                                res.send({
                                    message: 'sentDataWithDraw',
                                    data: usernameAgent
                                });
                                res.end();
                            }
                        }
                    })
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

http: //localhost:5000/GetWithdrawConfirmation Get GetWithdrawConfirmation
exports.GetWithdrawConfirmation = async (req, res, next) => {
    const pageSize = req.body.pageSize;
    const pageNumber = req.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const statusWithdraw = req.body.statusWithdraw;

    let sql_agent = `SELECT * FROM withdraw WHERE status_withdraw = '${statusWithdraw}' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql_agent, (error, usernameAgent) => {
        try {
            if (error) {
                console.log(error)
            } else {
                if (usernameAgent.length !== 0) {
                    const totalCount = `SELECT COUNT(*) as count FROM withdraw WHERE status_withdraw = '${statusWithdraw}'`
                    connection.query(totalCount, (error, resdata) => {
                        if (error) { console.log(error); }
                        else {
                            res.send({
                                message: 'sentData',
                                data: usernameAgent,
                                valusData: usernameAgent.length,
                                total: resdata[0].count
                            });
                            res.end();
                        }
                    })
                } else {
                    res.send({
                        message: 'NotConfirmation'
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

http: //localhost:5000/ConfirmationWithdraw Get ConfirmationWithdraw
exports.ConfirmationWithdraw = async (req, res, next) => {
    const bill_number = req.body.bill_number;
    const statusWithdraw = req.body.statusWithdraw;
    const noteConfirmation = req.body.noteConfirmation;
    const usernameUser = req.body.username;
    const approval_person = req.body.approval_person;
    const tpyeApproval_person = req.body.tpye_Approval_person
    const agent_id = req.body.agent_id;
    const value = req.body.value;
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');

    let sql_agent = `SELECT * FROM member WHERE username ='${usernameUser}' AND agent_id ='${agent_id}'`;
    connection.query(sql_agent, (error, userMember) => {

        const convertedCredit = parseFloat(userMember[0].credit);
        const convertedLatest_withdrawal = parseFloat(userMember[0].latest_withdrawal);
        const convertedWithdraw_member = parseFloat(userMember[0].withdraw_member);
        //console.log(value);
        let sql_Withdraw = `UPDATE withdraw set status_withdraw = '${statusWithdraw}', note = '${noteConfirmation}' WHERE bill_number ='${bill_number}'`;
        connection.query(sql_Withdraw, (error, withdraw) => {
            try {
                if (error) {
                    console.log(error)
                } else {
                    if (statusWithdraw === 'failed') {
                        let sql_Withdraw = `UPDATE logfinanceuser set status = 'ไม่สำเร็จ',trans_ref = '${approval_person}', qrcodeData = '${tpyeApproval_person}'
                        , nameimg = '${noteConfirmation}' WHERE bill_number ='${bill_number}'`;
                        connection.query(sql_Withdraw, (error, withdraw) => {
                            let sql = `UPDATE member set credit = '${convertedCredit + convertedLatest_withdrawal}', latest_withdrawal = '${0.00}',
                            withdraw_member = '${convertedWithdraw_member - convertedLatest_withdrawal}'  WHERE username ='${usernameUser}' AND agent_id ='${agent_id}'`;
                            connection.query(sql, (error, resultAfter) => {
                                if (error) {
                                    console.log(error);
                                } else {
                                    const message = `ถอนเงินไม่สำเร็จ\nลูกค้า: ${usernameUser}\nจำนวนเงิน: ${value}\nทำโดย: ${approval_person}\nเวลา: ${formattedDate} ${formattedTime}`;
                                    let lintNotify = logEdit.winhdrawLinenoti(message, value, usernameUser, formattedDate, formattedTime, approval_person)
                                    res.send({
                                        message: "รอการอนุมัติการถอนเงิน",
                                    });
                                    res.end();
                                }
                            });
                        })

                    } else {
                        let sql_Withdraw = `UPDATE logfinanceuser set status = 'สำเร็จ',trans_ref = '${approval_person}',qrcodeData = '${tpyeApproval_person}' 
                        WHERE bill_number ='${bill_number}'`;
                        connection.query(sql_Withdraw, (error, withdraw) => {
                            if (error) {
                                console.log(error);
                            } else {
                                const message = `ถอนเงินสำเร็จ\nลูกค้า: ${usernameUser}\nจำนวนเงิน: ${value}\nทำโดย: ${approval_person}\nเวลา: ${formattedDate} ${formattedTime}`;
                                let lintNotify = logEdit.winhdrawLinenoti(message, value, usernameUser, formattedDate, formattedTime, approval_person)
                                let updateRepostFinance = Finance.UpdateLogRepostFinance(usernameUser, 'ถอน', convertedLatest_withdrawal)
                                res.send({
                                    message: "ถอนเงินสำเร็จ",
                                });
                                res.end();
                            }
                        })
                    }
                }
            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        })
    })
};

//http://localhost:5000/post/apiGetAgentWeb getapiGetAgentWeb
exports.apiGetAgentWeb = (require, response) => {
    const usernanme = require.body.username;
    const agent_id = require.body.agent_id;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    if (usernanme === '') {
        let sql = `SELECT * FROM employee WHERE agent_id = "${agent_id}" AND status = "true" LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM employee WHERE agent_id = "${agent_id}" `
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                else {
                    response.send({
                        data: results,
                        total: res[0].count
                    });
                    response.end();
                }
            });
        });
    } else {
        let sql_ = `SELECT * FROM employee WHERE  agent_id = ? AND status = ? AND username LIKE ? LIMIT ? OFFSET ?`;
        const searchPattern = `%${usernanme}%`;
        const values = [agent_id, "true", searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, resultstatusFalse) => {
            if (error) { console.log(error); }
            else {
                response.send({
                    data: resultstatusFalse,
                    total: resultstatusFalse.length
                });
                response.end();
            }
        });
    }
}

http: //localhost:5000/signupEmployeeAgent Add signupEmployeeAgent
exports.signupEmployeeAgent = async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const username = req.body.username;
    const password = req.body.password;
    const name = req.body.name;
    const phonenumber = req.body.phonenumber;
    const role = req.body.role;
    const levelRole = req.body.levelRole;
    const hashedPassword = md5(password);
    let sql_agent = `SELECT username FROM employee WHERE agent_id ='${agent_id}' AND username = '${username}'`;
    connection.query(sql_agent, (error, usernameAgent) => {
        try {
            if (error) {
                console.log(error)
            } else {
                if (usernameAgent.length === 0 || usernameAgent < 1) {
                    let sql = `INSERT INTO employee (agent_id, username, password, name, phonenumber, status, created_at, login_latest, role, levelrole) 
                value ('${agent_id}','${username}','${hashedPassword}','${name}','${phonenumber}','${'true'}',now() ,now(),'${role}', '${levelRole}')`;
                    connection.query(sql, (error, result) => {
                        if (error) { console.log(error) }
                        res.send({
                            message: "Data created Success"
                        });
                        res.end();
                    });
                } else {
                    res.send({
                        message: "Data created False"
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

http: //localhost:5000/EditEmployeeAgent EditEmployeeAgent
exports.EditEmployeeAgent = async (req, res, next) => {
    const id = req.body.id;
    const username = req.body.username;
    const name = req.body.name;
    const phonenumber = req.body.phonenumber;
    const status = req.body.status;
    const role = req.body.role;
    const levelRole = req.body.levelRole;

    let sql_update = `UPDATE employee set username = '${username}', name = '${name}', phonenumber = '${phonenumber}', role = '${role}', 
    status = '${status}', levelrole = '${levelRole}' WHERE id ='${id}'`;
    connection.query(sql_update, (error, resultAfter) => {
        try {
            if (error) {
                console.log(error)
            } else {
                res.send({
                    message: "Data Update Success"
                });
                res.end();
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
};

//http://localhost:5000/post/GetOneAgentWeb getOneAgentWeb
exports.GetOneAgentWeb = (require, response) => {
    const id = require.params.id;
    let sql = `SELECT * FROM employee WHERE id = "${id}" AND status = "true"`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        else {
            response.send({
                data: results,
            });
            response.end();
        }
    });
}

//http://localhost:5000/post/DeleteAgentWeb getOneAgentWeb
exports.DeleteAgentWeb = (require, response) => {
    const id = require.body.id;
    const agent_id = require.body.agent_id

    let sql_update = `UPDATE employee set status = 'false' WHERE id ='${id}' AND agent_id ='${agent_id}'`;
    connection.query(sql_update, async (error, results) => {
        if (error) { console.log(error); }
        else {
            response.send({
                data: results,
            });
            response.end();
        }
    });
}

//http://localhost:5000/post/GetOneBank getOneBank
exports.GetOneBank = (require, response) => {
    const nameBank = require.body.nameBank;
    //console.log(nameBank)
    let sql = `SELECT * FROM banknames WHERE bankname_name = "${nameBank}" AND status = "Y"`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        else {
            response.send({
                data: results,
            });
            response.end();
        }
    });
}

//http://localhost:5000/post/loginEnployee loginEnployee
exports.LoginAgentWeb = (require, response) => {
    let username = require.body.username;
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

    let sql = `SELECT * FROM employee WHERE username='${username}' AND status='true' AND agent_id = '${agent_id}'`;
    connection.query(sql, async (error, results) => {
        try {
            //console.log(results);
            const data = results;
            if (data.length !== 1) {
                const error = new Error('notEmployee');
                error.statusCode = 401;
                response.status(201).json({ message: 'notEmployee' });
            } else {
                const storedUser = data[0];

                const hashedPassword = md5(password)
                if (hashedPassword !== storedUser.password) {
                    return response.status(401).json({ message: 'Incorrect password' });
                }
                const token = jwt.sign(
                    {
                        id: storedUser.id,
                        name: storedUser.name,
                        type: 'employee',
                    },
                    'secretfortoken',
                    { expiresIn: '5h' }
                );
                let update = `UPDATE employee set ip_address = '${ipAddress}', tokenlogin = '${token}' WHERE id='${results[0].id}' AND agent_id = '${agent_id}'`;
                connection.query(update, async (error, results) => {
                    if (error) { console.log(error) }
                    else {
                        response.status(201).json({ message: 'OkLogin', token: token, data: storedUser });
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
}

http: //localhost:5000/post/DeleteUserGroupInformation Put DeleteUserGroupInformation
exports.DeleteAccessDeposit = async (req, res, next) => {
    const id = req.body.id;
    const agent_id = req.body.agent_id
    let sql = `UPDATE depositaccount set activestatus = '${'ปิดใช้งาน'}' WHERE id ='${id}' AND agent_id = '${agent_id}'`;
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

//http://localhost:5000/post/GetStatementUser GetStatementUser
exports.GetStatementUser = (require, response) => {
    const phonenumber = require.body.phonenumber;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    let sql = `SELECT * FROM logfinanceuser WHERE phonenumber = "${phonenumber}" LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        else {
            const totalCount = `SELECT COUNT(*) as count FROM logfinanceuser WHERE phonenumber = "${phonenumber}"`
            connection.query(totalCount, (error, restotal) => {
                if (error) { console.log(error); }
                response.send({
                    data: results,
                    total: restotal[0].count
                });

                response.end();
            });
        }
    });
}

//http://localhost:5000/post/getRepostGameCamp getRepostGameCamp
exports.getRepostPromotion = (require, response) => {
    const searcPromotion = require.body.searcPromotion;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;

    if (searcPromotion === '') {
        let sql = `SELECT * FROM repostPromotion WHERE 	created_at >='${date}' AND 	created_at <= '${endDate}'  LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM repostPromotion WHERE created_at >='${date}' AND 	created_at <= '${endDate}'`
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
    } else if (searcPromotion !== '') {
        if (searcPromotion === 'AllPromotion') {
            let sql_ = `SELECT * FROM repostPromotion WHERE  LIKE ? LIMIT ? OFFSET ?`;
            const values = [pageSize, offset];
            connection.query(sql_, values, (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostPromotion`
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
            let sql_ = `SELECT * FROM repostPromotion WHERE created_at >= ? AND created_at <= ? AND namepromotion LIKE ? LIMIT ? OFFSET ?`;
            const searchPattern = `%${searcPromotion}%`;
            const values = [date, endDate, searchPattern, pageSize, offset];
            connection.query(sql_, values, (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostPromotion WHERE created_at >='${date}' AND created_at <= '${endDate}'`
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
    } else if (searcPromotion === undefined) {
        let sql = `SELECT * FROM repostPromotion WHERE created_at >='${date}' AND created_at <= '${endDate}' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM repostPromotion WHERE created_at >='${date}' AND created_at <= '${endDate}'`
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
    } else if (searcPromotion !== undefined) {
        if (searcPromotion === 'AllPromotion') {
            let sql_ = `SELECT * FROM repostPromotion WHERE  LIKE ? LIMIT ? OFFSET ?`;
            const values = [pageSize, offset];
            connection.query(sql_, values, (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostPromotion`
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
            let sql_ = `SELECT * FROM repostPromotion WHERE created_at >= ? AND created_at <= ? AND namepromotion LIKE ? LIMIT ? OFFSET ?`;
            const searchPattern = `%${searcPromotion}%`;
            const values = [date, endDate, searchPattern, pageSize, offset];
            connection.query(sql_, values, (error, results) => {
                if (error) { console.log(error); }
                else {
                    const totalCount = `SELECT COUNT(*) as count FROM repostPromotion WHERE created_at >='${date}' AND created_at <= '${endDate}'`
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
    } else {
        let sql_ = `SELECT * FROM repostPromotion WHERE created_at >='${date}' AND created_at <= '${endDate}' AND namepromotion LIKE '%${searcPromotion}%' LIKE ? LIMIT ? OFFSET ?`;
        const values = [pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM repostPromotion WHERE created_at >='${date}' AND created_at <= '${endDate}'`
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

http: //localhost:5000/post/addAbsWeb Add addAbsWeb
exports.addAbsWeb = async (req, res, next) => {
    const idwebsite_abs = req.body.idwebsite_abs;
    const abs_type = req.body.abs_type;
    const password_ads = req.body.password_ads;
    const name_abs = req.body.name_abs;
    const start_abs = req.body.start_abs;
    const end_abs = req.body.end_abs;
    const details_abs = req.body.details_abs;
    const img = req.body.img_abs
    //console.log(req.body)
    let sql = `INSERT INTO abswebsite (idwebsite_abs, abs_type, password_ads, name_abs, start_abs, end_abs, details_abs, filename) 
        value ('${idwebsite_abs}','${abs_type}','${password_ads}','${name_abs}','${start_abs}','${end_abs}','${details_abs}','${img}')`;

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

http: //localhost:5000/post/addImgAbsWeb Add addImgAbsWeb
exports.imgAbsWeb = (req, res) => {
    const data = JSON.parse(req.body.data);
    const { name_abs, password_ads } = data;
    const fileimg = req.file;

    let sql_update = `UPDATE abswebsite set filename = '${fileimg.filename}', name_abs = '${name_abs}' WHERE password_ads ='${password_ads}'`;
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
};

http: //localhost:5000/post/creditImgPromotion Add creditImgPromotion
exports.DeleteAbs = (req, res) => {
    const password_ads = req.body.password_ads;

    let sql_update = `UPDATE abswebsite set status_abs = 'N' WHERE password_ads ='${password_ads}'`;
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
exports.getAbsWebsite = (require, response) => {
    const abs_type = require.body.abs_type;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    let sql = `SELECT * FROM abswebsite WHERE status_abs = 'Y' AND abs_type = '${abs_type}' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        const totalCount = `SELECT COUNT(*) as count FROM abswebsite WHERE status_abs = 'Y' AND abs_type = '${abs_type}'`
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
};

http: //localhost:5000/post/getlistAbs:type Get getPromotion
exports.getlistAbs = (require, response) => {
    const abs_type = require.params.tpye;
    let sql = `SELECT * FROM abswebsite WHERE status_abs = 'Y' AND abs_type = '${abs_type}'`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: 'Success',
            data: results,
        });
        response.end();
    });
};

http: //localhost:5000/post/getOneAbs Add getOneAbs
exports.getOneAbs = (require, response) => {
    const password_ads = require.params.password_ads;
    let sql = `SELECT * FROM abswebsite WHERE password_ads = '${password_ads}' AND status_abs = 'Y'`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: `ABS Password '${password_ads}'`,
            data: results,
        });
        response.end();
    });
};

http: //localhost:5000/post/upDateABSAll Add upDateABSAll
exports.upDateABSAll = (req, res) => {
    const data = JSON.parse(req.body.data);
    const { name_abs, password_ads, start_abs, end_abs, imgAbs, details_abs } = data;
    //let fileimg = '';
    //console.log(req.file, imgPromotion);
    if (req.file === undefined) {
        let sql_update = `UPDATE abswebsite set filename = '${imgAbs}', name_abs = '${name_abs}', start_abs = '${start_abs}', start_abs = '${end_abs}', details_abs = '${details_abs}' 
        WHERE password_ads ='${password_ads}'`;
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
        let sql_update = `UPDATE abswebsite set filename = '${req.file.filename}', name_abs = '${name_abs}', start_abs = '${start_abs}', start_abs = '${end_abs}', details_abs = '${details_abs}' 
        WHERE password_ads ='${password_ads}'`;
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

http: //localhost:5000/post/getPromotion Add getPromotion
exports.getPromotionMember = (require, response) => {
    const username = require.body.username;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    let sql = `SELECT * FROM repostPromotion WHERE username = '${username}' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        const totalCount = `SELECT COUNT(*) as count FROM repostPromotion WHERE username = '${username}'`
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
};

http: //localhost:5000/post/creditImgPromotion Add creditImgPromotion
exports.DeleteMemberPromotion = (req, res) => {
    const username = req.body.username;
    let sql_update = `UPDATE member set promotionuser = 'ไม่ได้รับโปรโมชั่น', passwordpromotion = 'ไม่ได้รับโปรโมชั่น', gameplayturn = 'PlayAllGame' 
    WHERE username = '${username}'`;
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

http: //localhost:5000/post/updateTrasalationGroup PUT updateTrasalationGroup
exports.updateTrasalationGroup = (req, res) => {

    const idGroup = req.body.idGroup;
    const action = req.body.action
    let idGroupupdate = 0

    if (action === 'Up') {
        idGroupupdate = idGroup - 1;
    } else {
        idGroupupdate = idGroup + 1;
    }
    //console.log(idGroupupdate);

    let sql_start = `UPDATE mastergroup set id = '${0}' WHERE id = '${idGroupupdate}'`;
    connection.query(sql_start, (error, resultAfter) => {
        try {
            if (error) {
                console.log(error);
            } else {
                let sql_update = `UPDATE mastergroup set id = CASE WHEN id = '${idGroup}' THEN '${idGroupupdate}' ELSE id END WHERE id = '${idGroup}'`;
                connection.query(sql_update, (error, resultAfterI) => {
                    if (error) {
                        console.log(error);
                    } else {
                        let sql_updateII = `UPDATE mastergroup set id = CASE WHEN id = '${0}' THEN '${idGroup}' ELSE id END WHERE id = '${0}'`;
                        connection.query(sql_updateII, (error, resultAfterII) => {
                            if (error) {
                                console.log(error);
                            } else {
                                let sql = `SELECT * FROM mastergroup`;
                                connection.query(sql, (error, resultIII) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        res.send({
                                            data: resultIII,
                                        });
                                        res.end();
                                    }
                                })
                            }
                        })
                    }
                })
            }
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

http: //localhost:5000/post/addCoupon Add addCoupon
exports.addCoupon = async (req, res, next) => {
    const idwebsite_coupon = req.body.idwebsite_coupon;
    const password_coupon = req.body.password_coupon;
    const typebonus = req.body.typebonus;
    const valusbunus = req.body.valusbunus;
    const couponpassword = req.body.couponpassword;
    const namepromotion = req.body.namepromotion;
    const startcoupon = req.body.startcoupon;
    const endcoupon = req.body.endcoupon;
    const maxbunus = req.body.maxbunus;
    const withdrawalType = req.body.withdrawalType;
    const withdraw_valus = req.body.withdraw_valus;
    const valusconpon = req.body.valusconpon;
    const balance_conditions = rep.body.balance_conditions;
    let sql = `INSERT INTO coupon (id_agent, password_coupon, typebonus, valusbunus, couponpassword, statu_coupon, namepromotion, startcoupon, endcoupon, maxbunus, withdrawalType
        , valustrunover, valusconpon, coupon_balance, balance_conditions)
        value ('${idwebsite_coupon}','${password_coupon}','${typebonus}','${valusbunus}','${couponpassword}','${"Y"}','${namepromotion}','${startcoupon}','${endcoupon}','${maxbunus}',
        '${withdrawalType}','${withdraw_valus}','${valusconpon}','${valusconpon}','${balance_conditions}')`;

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

http: //localhost:5000/post/getCoupon Add getCoupon
exports.getCoupon = (require, response) => {
    const idwebsite_coupon = require.body.idwebsite_coupon;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    let sql = `SELECT * FROM coupon WHERE id_agent = '${idwebsite_coupon}' AND statu_coupon = '${'Y'}' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        const totalCount = `SELECT COUNT(*) as count FROM coupon WHERE id_agent = '${idwebsite_coupon}' AND statu_coupon = '${'Y'}'`
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
};

http: //localhost:5000/post/creditImgPromotion Add creditImgPromotion
exports.DeleteCoupon = (req, res) => {
    const password_coupon = req.body.password_coupon;
    let sql_update = `UPDATE coupon set statu_coupon = 'N' WHERE password_coupon = '${password_coupon}'`;
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

http: //localhost:5000/post/getOneCoupon GET getOneCoupon
exports.getOneCoupon = (require, response) => {
    const password_coupon = require.params.password_coupon;
    let sql = `SELECT * FROM coupon WHERE password_coupon = '${password_coupon}' AND statu_coupon = 'Y'`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: `Coupon Password '${password_coupon}'`,
            data: results,
        });
        response.end();
    });
};

http: //localhost:5000/post/upDateCoupon Update upDateCoupon
exports.upDateCoupon = async (req, res, next) => {
    const password_coupon = req.body.password_coupon;
    const typebonus = req.body.typebonus;
    const valusbunus = req.body.valusbunus;
    const couponpassword = req.body.couponpassword;
    const namepromotion = req.body.namepromotion;
    const startcoupon = req.body.startcoupon;
    const endcoupon = req.body.endcoupon;
    const maxbunus = req.body.maxbunus;
    const withdrawalType = req.body.withdrawalType;
    const withdraw_valus = req.body.withdraw_valus;
    const valusconpon = req.body.valusconpon;
    const coupon_balance = req.body.coupon_balance;
    const balance_conditions = rep.body.balance_conditions;

    let sql = `UPDATE coupon set typebonus = '${typebonus}',valusbunus = '${valusbunus}',couponpassword = '${couponpassword}',
    statu_coupon = '${"Y"}', namepromotion = '${namepromotion}', startcoupon = '${startcoupon}', endcoupon = '${endcoupon}', maxbunus = '${maxbunus}',
    withdrawalType = '${withdrawalType}', valustrunover = '${withdraw_valus}', valusconpon = '${valusconpon}', coupon_balance = '${coupon_balance}', balance_conditions = '${balance_conditions}'
    WHERE password_coupon = '${password_coupon}'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data update Success"
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

http: //localhost:5000/post/GetCouponMember POST GetCouponMember
exports.GetCouponMember = async (req, res, next) => {
    const password_coupon = req.body.password_coupon;
    const couponpassword = req.body.couponpassword;
    const username = req.body.username;
    const currentTimeInThailand = moment().tz('Asia/Bangkok');
    const formattedDate = currentTimeInThailand.format('YYYY-MM-DD');
    const formattedTime = currentTimeInThailand.format('HH:mm:ss');
    let turnover = 0;
    let sql = `SELECT * FROM member WHERE username = '${username}' AND status = 'Y'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            else {
                if (result[0].promotionuser.includes("ไม่ได้รับโปรโมชั่น")) { //เช็คว่าผู้เล่นไม่ได้ติดโปรโมชั่นอะไร
                    let sql_repost_coupon = `SELECT * FROM repost_coupon WHERE username = '${username}' AND coupon_password = '${couponpassword}'`;
                    connection.query(sql_repost_coupon, (error, result_repost_coupon) => {
                        if (result_repost_coupon.length <= 0) { //เช็คว่าผู้เล่นไม่เคยรับคูปองนี้
                            let sql_conpon = `SELECT * FROM coupon WHERE couponpassword = '${couponpassword}' AND statu_coupon = 'Y'`;
                            connection.query(sql_conpon, (error, result_coupon) => {
                                if (result_coupon.length > 0) { //เช็คว่ามีคูปองนี้อยู่
                                    if (result_coupon[0].coupon_balance > 0) {
                                        if (result_coupon[0].couponpassword === couponpassword) { //เช็คความถูกต้องของรหัสคูปอง
                                            if (result[0].credit <= result_coupon[0].balance_conditions) { //เช็คเงือนไขการรับคูปอง
                                                let creditbonus = result[0].credit + result_coupon[0].valusbunus;
                                                if (result_coupon[0].withdrawalType === 'Turnover Fixed') {
                                                    turnover = result[0].turnover + result_coupon[0].valusbunus
                                                } else {
                                                    turnover = result[0].turnover + (result_coupon[0].valusbunus * result_coupon[0].valusbunus)
                                                }
                                                const formattedDateStart = result_coupon[0].startcoupon.toISOString().substring(0, 10);
                                                const formattedDateEnd = result_coupon[0].endcoupon.toISOString().substring(0, 10);

                                                let sql_imsert_repost_coupon = `INSERT INTO repost_coupon (password_coupon, tpyebunus, valusbunus, coupon_password, namecoupon, 
                                                    startcoupon, endcoupon, created_at, time_at, credit, turnover, username)
                                                    value ('${result_coupon[0].password_coupon}','${result_coupon[0].typebonus}','${result_coupon[0].valusbunus}','${couponpassword}',
                                                    '${result_coupon[0].namepromotion}','${formattedDateStart}','${formattedDateEnd}',
                                                    '${formattedDate}','${formattedTime}','${creditbonus}','${turnover}','${username}')`;
                                                connection.query(sql_imsert_repost_coupon, (error, result_repostcoupon) => {
                                                    if (error) { console.log(error) } else {
                                                        let sql_update = `UPDATE member set credit = '${creditbonus}', bonususer = '${result_coupon[0].valusbunus}',
                                                        promotionuser = '${result_coupon[0].namepromotion}', passwordpromotion = '${result_coupon[0].password_coupon}'
                                                        WHERE username = '${username}' AND status = 'Y'`;
                                                        connection.query(sql_update, (error, result_memberupdate) => {
                                                            if (error) { console.log(error) } else {
                                                                let sql_updateConpon = `UPDATE coupon set coupon_balance = '${result_coupon[0].coupon_balance - 1}'
                                                                WHERE couponpassword = '${couponpassword}' AND statu_coupon = 'Y'`;
                                                                connection.query(sql_updateConpon, (error, result_updateConpon) => {
                                                                    if (error) { console.log(error) } else {
                                                                        res.send({
                                                                            message: "คุณรับคูปองสำเร็จ"
                                                                        });
                                                                        res.end();
                                                                    }
                                                                })
                                                            }
                                                        })
                                                    }
                                                })
                                            } else {
                                                res.send({
                                                    message: "คุณไม่สามารถใช้คูปองได้ เนื่องจากคุณไม่เข้าเงือนไขการใช้งานคูปอง"
                                                });
                                                res.end();
                                            }

                                        } else {
                                            res.send({
                                                message: "คุณไม่สามารถใช้คูปองได้ เนื่องจากคุณกรอกรหัสคูปองไม่ถูกต้อง"
                                            });
                                            res.end();
                                        }
                                    } else {
                                        res.send({
                                            message: "คุณไม่สามารถใช้คูปองได้ เนื่องจากคูปองถูกใช้ครบทุกสิทธิ์แล้ว"
                                        });
                                        res.end();
                                    }
                                } else {
                                    res.send({
                                        message: "คุณไม่สามารถใช้คูปองได้ เนื่องจากคุณกรอกรหัสคูปองไม่ถูกต้อง"
                                    });
                                    res.end();
                                }
                            })
                        } else {
                            res.send({
                                message: "คุณไม่สามารถใช้คูปองได้ เนื่องจากคุณได้ใช้คูปองนี้ไปแล้ว"
                            });
                            res.end();
                        }
                    })
                } else {
                    res.send({
                        message: "คุณไม่สามารถใช้คูปองได้ เนื่องจากคุณได้รับโปรโมชั่นหรือได้ใช้คูปองนี้ไปแล้วไว้แล้ว"
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
    });
};

//http://localhost:5000/post/getRepostCoupon getRepostCoupon
exports.getRepostCoupon = (require, response) => {
    const searcPromotion = require.body.searcPromotion;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    if (searcPromotion === '') {
        let sql = `SELECT * FROM repost_coupon WHERE created_at >='${date}' AND created_at <= '${endDate}' ORDER BY created_at DESC LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM repost_coupon WHERE created_at >='${date}' AND created_at <= '${endDate}'`
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
    } else if (searcPromotion !== '') {
        let sql_ = `SELECT * FROM repost_coupon WHERE created_at >= ? AND created_at <= ? AND username LIKE ? ORDER BY created_at DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searcPromotion}%`;
        const values = [date, endDate, searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM repost_coupon WHERE created_at >='${date}' AND created_at <= '${endDate}' AND username LIKE '%${searcPromotion}%' `
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
    } else if (searcPromotion === undefined) {
        let sql = `SELECT * FROM repost_coupon WHERE created_at >='${date}' AND created_at <= '${endDate}' ORDER BY created_at DESC LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM repost_coupon WHERE created_at >='${date}' AND created_at <= '${endDate}'`
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
    } else if (searcPromotion !== undefined) {
        let sql_ = `SELECT * FROM repost_coupon WHERE created_at >= ? AND created_at <= ? AND username LIKE ? ORDER BY created_at DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searcPromotion}%`;
        const values = [date, endDate, searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM repost_coupon WHERE created_at >='${date}' AND created_at <= '${endDate}' AND username LIKE '%${searcPromotion}%' `
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
        let sql_ = `SELECT * FROM repost_coupon WHERE created_at >= ? AND created_at <= ? AND username LIKE ? ORDER BY created_at DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searcPromotion}%`;
        const values = [date, endDate, searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM repost_coupon WHERE created_at >='${date}' AND created_at <= '${endDate}' AND username LIKE '%${searcPromotion}%' `
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

//http://localhost:5000/post/getRepostCouponPassword getRepostCouponPassword
exports.getRepostCouponPassword = (require, response) => {
    const searcCoupon = require.body.searcCoupon;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    let sql_ = `SELECT * FROM repost_coupon WHERE password_coupon = '${searcCoupon}' ORDER BY created_at DESC LIMIT ? OFFSET ?`;
    const values = [pageSize, offset];
    connection.query(sql_, values, (error, results) => {

        if (error) { console.log(error); }
        else {
            const totalCount = `SELECT COUNT(*) as count FROM repost_coupon WHERE password_coupon = '${searcCoupon}' `
            connection.query(totalCount, (error, res) => {
                try {
                    if (error) { console.log(error); }
                    else {
                        response.send({
                            data: results,
                            valusData: results.length,
                            total: res[0].count
                        });
                        response.end();
                    }
                }
                catch (err) {
                    if (!err.statusCode) {
                        err.statusCode = 500;
                    }
                    next(err);
                }
            })
        }
    });
}

//http://localhost:5000/post/getRepostDeposit getRepostDeposit
exports.getRepostGameList = (require, response) => {
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    const campGame = require.body.campGame;
    const username = require.body.username;
    //console.log(date, endDate, campGame, username)
    let sql = `SELECT 
        usernameuser,
        currency,
        namegamecamp,
        namegame,
          SUM(roundplay) AS roundplay,
          SUM(bet) AS bet, 
          SUM(w_user) AS w_user, 
          SUM(l_user) AS l_user, 
          SUM(w_agent) AS w_agent, 
          SUM(l_agent) AS l_agent, 
          SUM(w_company) AS w_company, 
          SUM(l_company) AS l_company
        FROM repostlistgame 
        WHERE date >= '${date}' AND date <= '${endDate}' AND namegamecamp = '${campGame}' AND usernameuser = '${username}' 
        GROUP BY namegame, usernameuser, currency, namegamecamp 
        LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, (error, results) => {
        try {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM repostlistgame WHERE date >='${date}' AND date <= '${endDate}' AND namegamecamp = '${campGame}' AND usernameuser = '${username}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                else {
                    //console.log(results)
                    response.send({
                        data: results,
                        valusData: results.length,
                        total: results.length,
                    });
                    response.end();
                }
            });
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
}

//http://localhost:5000/post/getRepostDeposit getRepostDeposit
exports.getRepostGameListCamp = (require, response) => {
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    const campGame = require.body.campGame;
    //console.log(date, endDate, campGame, username)
    let sql = `SELECT 
        currency,
        namegamecamp,
        namegame,
          SUM(roundplay) AS roundplay,
          SUM(bet) AS bet, 
          SUM(w_user) AS w_user, 
          SUM(l_user) AS l_user, 
          SUM(w_agent) AS w_agent, 
          SUM(l_agent) AS l_agent, 
          SUM(w_company) AS w_company, 
          SUM(l_company) AS l_company
        FROM repostlistgame 
        WHERE date >= '${date}' AND date <= '${endDate}' AND namegamecamp = '${campGame}'
        GROUP BY namegame, currency, namegamecamp 
        LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, (error, results) => {
        try {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM repostlistgame WHERE date >='${date}' AND date <= '${endDate}' AND namegamecamp = '${campGame}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                else {
                    //console.log(results)
                    response.send({
                        data: results,
                        valusData: results.length,
                        total: results.length,
                    });
                    response.end();
                }
            });
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
}

//http://localhost:5000/post/getRepostGameListGame getRepostGameListGame
exports.getRepostGameListGame = (require, response) => {
    const searchPhones = require.body.searchPhone;
    const searcGameCamp = require.body.searcGameCamp;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    const nameGame = require.body.nameGame
    let win = 0;
    let bet = 0
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
        let sql_ = `SELECT * FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' AND namegame = '${nameGame}' AND gameid = '${searcGameCamp}'
        AND  username LIKE ? ORDER BY created_atdate DESC LIMIT ? OFFSET ?`;
        const searchPattern = `%${searchPhones}%`;
        const values = [searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM repostgame WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' 
                AND gameid = '${searcGameCamp}' AND username = '${searchPhones}' AND namegame = '${nameGame}'`
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

    }, 200);
}

//http://localhost:5000/post/getRepostDeposit getRepostDeposit
exports.getRepostEdit = (require, response) => {
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;

    let sql = `SELECT * FROM logedit WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}' ORDER BY created_attime DESC LIMIT ${pageSize} OFFSET ${offset} `;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        const totalCount = `SELECT COUNT(*) as count FROM logedit WHERE created_atdate >='${date}' AND created_atdate <= '${endDate}'`
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
}

//http://localhost:5000/post/getRepostDeposit getRepostDeposit
exports.getturnoverGrach = (require, response) => {
    const date = require.body.dataDate;
    const endDate = require.body.dataEndDate;
    //console.log(date, endDate, campGame, username)
    let sql = `SELECT 
          SUM(turnover) AS turnover
        FROM totalturnoverrepost 
        WHERE day >= '${date}' AND day <= '${endDate}'
        GROUP BY day `;
    connection.query(sql, (error, results) => {
        try {
            if (error) { console.log(error); }
            else {
                let sqlGamecamp = `SELECT namegamecamp, SUM(roundplay) AS roundplay FROM gamecamptotal 
                            WHERE day >= '${date}' AND day <= '${endDate}' GROUP BY namegamecamp `;
                connection.query(sqlGamecamp, (error, resultsGame) => {
                    //console.log(resultsGame)
                    response.send({
                        data: results,
                        dataB: resultsGame,
                    });
                    response.end();
                })

            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
}

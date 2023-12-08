const express = require('express');
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const md5 = require('md5');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });

const logEdit = require('./logEditAll')

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

    static uploadLogResetPasswordMenber(id, idedit, name, type, note, agent_id) {
        const iduser = id;
        const ideditAcc = idedit;

        const sql = `SELECT * FROM ${type} WHERE id = ?`;
        connection.query(sql, [ideditAcc], (error, resultBefore) => {
            try {
                if (error) { console.log(error) }
                else {
                    let nametpyeEdit = resultBefore[0].username
                    let sql_before = `INSERT INTO logedit (agent_id, edittype, idedit, idmember, name, what_fix, editbefore, editafter, 
                    created_atdate, created_attime, note) value 
              ('${agent_id}','${type}','${ideditAcc}','${iduser}','${nametpyeEdit}','รหัสผ่าน','${'ไม่เปิดเผยรหัสผ่านเก่า'}
              ','${'มีการเปลี่ยนรหัสผ่านโดย' + " " + type + " " + 'ชื่อ' + " " + nametpyeEdit}',now(), now(),'${note}')`;
                    connection.query(sql_before, (error, resultAfter) => {
                        if (error) { console.log(error); }
                    });
                }

            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
            }
        });
    }

    static uploadLogEditCredit(idUser, idedit, typeedit, creditnew, creditBefore, note, agent_id, username) {
        const iduser = idUser;
        const ideditAcc = idedit;
        //console.log(idUser, idedit, typeedit, creditnew, creditBefore)
        const sql = `SELECT * FROM ${typeedit} WHERE id = ?`;
        connection.query(sql, [ideditAcc], (error, resultBefore) => {
            try {
                if (error) { console.log(error) }
                else {
                    let nametpyeEdit = resultBefore[0].username
                    let sql_before = `INSERT INTO logedit (agent_id, edittype, idedit, username, idmember, name, what_fix, editbefore, editafter, 
                    created_atdate, created_attime, note) value 
              ('${agent_id}','${typeedit}','${ideditAcc}','${username}','${iduser}','${nametpyeEdit}','credit','${'Credit ก่อนหน้า ' + creditBefore}
              ','${'Credit ปัจจุบัน ' + creditnew}',now(), now(), '${note}')`;

                    connection.query(sql_before, (error, resultAfter) => {
                        if (error) { console.log(error); }
                        return 'OK';
                    });
                }

            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
            }
        });
    }

    static uploadLogEditUser(post, dataMenber, note, agent_id, username) {
        //console.log(post)
        //console.log(post.edittype)
        const sql = `SELECT * FROM ${post.edittype} WHERE id = ?`;
        connection.query(sql, [post.idedit], (error, resultBefore) => {
            try {
                if (error) { console.log(error) }
                else {
                    let nametpyeEdit = resultBefore[0].username
                    let sql_before = `INSERT INTO logedit (agent_id, edittype, idedit, username, idmember, name, what_fix, editbefore, editafter, 
                    created_atdate, created_attime, note) value 
              ('${agent_id}','${post.edittype}','${post.idedit}','${username}','${post.id}','${nametpyeEdit}','ข้อมูลmember',
              '${'ชื่อจริง-นามสุกุล' + ' ' + dataMenber.accountName + ' ' + 'กลุ่มลูกค้า' + ' ' + dataMenber.groupmember
                + ' ' + 'username' + ' ' + dataMenber.username + ' ' + 'ไลน์' + ' ' + dataMenber.lineid}',
              '${'ชื่อจริง-นามสุกุล' + ' ' + post.accountName + ' ' + 'กลุ่มลูกค้า' + ' ' + post.customerGroup + ' ' 
               + 'username' + ' ' + post.contact_number + ' ' + 'ไลน์' + ' ' + post.IDLIne}'
              ,now(), now(),'${note}')`;
                    connection.query(sql_before, (error, resultAfter) => {
                        console.log(dataMenber.lastName)
                        if (error) { console.log(error); }
                        return 'OK';
                    });
                }

            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
            }
        });
    }

    static uploadLogEditTurnOver(idUser, idedit, typeedit, turnovernew, turnoverBefore, note, agent_id, username) {
        const iduser = idUser;
        const ideditAcc = idedit;
        //console.log(idUser, idedit, typeedit, creditnew, creditBefore)
        const sql = `SELECT * FROM ${typeedit} WHERE id = ?`;
        connection.query(sql, [ideditAcc], (error, resultBefore) => {
            try {
                if (error) { console.log(error) }
                else {
                    let nametpyeEdit = resultBefore[0].username
                    let sql_before = `INSERT INTO logedit (agent_id, edittype, idedit, username, idmember, name, what_fix, editbefore, 
                    editafter, created_atdate, created_attime, note) value 
              ('${agent_id}','${typeedit}','${ideditAcc}','${username}','${iduser}','${nametpyeEdit}','turnover','${'turnover ก่อนหน้า  ' + turnoverBefore}
              ','${'turnover ปัจจุบัน  ' + turnovernew}',now(), now(),'${note}')`;

                    connection.query(sql_before, (error, resultAfter) => {
                        if (error) { console.log(error); }
                        return 'OK';
                    });
                }

            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
            }
        });
    }

    static uploadLogBan(idUser, idedit, typeedit, note, agent_id, useranme) {
        const iduser = idUser;
        const ideditAcc = idedit;
        //console.log(idUser, idedit, typeedit, creditnew, creditBefore)
        const sql = `SELECT * FROM ${typeedit} WHERE id = ?`;
        connection.query(sql, [ideditAcc], (error, resultBefore) => {
            try {
                if (error) { console.log(error) }
                else {
                    let nametpyeEdit = resultBefore[0].username
                    let sql_before = `INSERT INTO logedit (agent_id, edittype, idedit, useranme, idmember, name, what_fix, editbefore, 
                    editafter, created_atdate, created_attime, note) value 
              ('${agent_id}','${typeedit}','${ideditAcc}','${useranme}','${iduser}','${nametpyeEdit}','ban','${'banmember'}
              ','${'banmember'}',now(), now(),'${note}')`;

                    connection.query(sql_before, (error, resultAfter) => {
                        if (error) { console.log(error); }
                        return 'OK';
                    });
                }

            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
            }
        });
    }
};
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const os = require('os');
require('dotenv').config()

const connection = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD
});

http://localhost:5000/post/test
exports.getOne = async (req, res, next) => {
  const networkInterfaces = os.networkInterfaces();

  const ipAddress = Object.keys(networkInterfaces).reduce((acc, interfaceName) => {
    const interfaceInfo = networkInterfaces[interfaceName];
    const ipv4Info = interfaceInfo.find(info => info.family === 'IPv4' && !info.internal);

    if (ipv4Info) {
      acc = ipv4Info.address;
    }

    return acc;
  }, '');
  console.log('IP address:', ipAddress);
  try {
    res.send('Hello World!');
  } catch (err) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
};


exports.getGame = async (req, res, next) => {
  let sql = `SELECT * FROM allgame`;
  try {
    connection.query(sql, (error, results) => {
      if (error) { console.log(error); }
      else {
        res.send({
          message: 'gameAll',
          data: results,
        });
        res.end();
      }
    });
  } catch (err) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
};

http://localhost:5000/post/convertToken
exports.convertToken = async (req, res) => {
  const authHeader = req.body.Authorization;
  //start check ip address
  //const ip_address = req.body.ip_address;
  const networkInterfaces = os.networkInterfaces();
  const ipAddress = Object.keys(networkInterfaces).reduce((acc, interfaceName) => {
    const interfaceInfo = networkInterfaces[interfaceName];
    const ipv4Info = interfaceInfo.find(info => info.family === 'IPv4' && !info.internal);

    if (ipv4Info) {
      acc = ipv4Info.address;
    }
    return acc;
  }, '');
  // end check ip address

  //start check Browser
  const userAgent = req.headers['user-agent'];
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
  // end check ip Browser

  if (!authHeader) {
    const error = new Error('Not authenticated!');
    error.statusCode = 500;
  }
  const token = authHeader;
  let decodedToken;
  decodedToken = jwt.verify(token, 'secretfortoken')
  if (decodedToken.type === 'member') {
    try {
      let splip = `SELECT * FROM member WHERE username ='${decodedToken.phonenumber}' AND status_delete='N' 
      ORDER BY member_code ASC`;
      connection.query(splip, (error, resultsIp) => {
        if (error) { console.log(error) }

        // if (resultsIp[0].ip_address !== ipAddress) {
        //   const error = new Error('A user with this ip_address could not be found.');
        //   error.statusCode = 500;
        //   res.json({ status: "A user with this ip_address could not be found." });
        // }
        // else {
        //   if (resultsIp[0].browserlogin !== browser) {
        //     const error = new Error('A user with this browserlogin could not be found.');
        //     error.statusCode = 500;
        //     res.json({ status: "A user with this browserlogin could not be found." });
        //   }
        //else {
        let sql = `SELECT id, credit, bet_latest, name FROM member WHERE username ='${decodedToken.phonenumber}' AND status_delete='N' 
            ORDER BY member_code ASC`;
        connection.query(sql, (error, results) => {
          if (error) { console.log(error) }
          else {
            res.json(results[0]);
          }
        });
        //     }
        //   }
      })
    } catch (err) {
      err.statusCode = 500;
      res.json({ status: "A user with this Token could not be found." });
    }
  } else {
    res.json({
      id: 1,
      credit: 100000,
      bet_latest: 9,
      name: 'testgaem'
    })
  }

  if (!decodedToken) {
    const error = new Error('Not authenticated!');
    error.statusCode = 500;
  }
};

http://localhost:5000/post/convertData
exports.convertData = async (req, res, next) => {
  console.log(req.body.data);
  datauserMD5 = req.body.data;

  let sql = `SELECT id, credit, bet_latest, name FROM member WHERE password='${datauserMD5}' AND status_delete='N' 
  ORDER BY member_code ASC`;
  try {

    connection.query(sql, (error, results) => {
      if (error) { console.log(error) }
      else {
        res.status(201).json({ status: results[0] });
      }
    });
  } catch (err) {
    err.statusCode = '600';
  }
};

http://localhost:5000/post/logoutMember
exports.logoutMember = async (req, res, next) => {
  const memberID = req.body.memberID;

  if (memberID !== '' || memberID !== undefined) {
    let update = `UPDATE member set ip_address = 'null',browserlogin = 'null' WHERE id='${memberID}'`;
    connection.query(update, (error, result) => {
      if (error) { console.log(error) }
      else {
        res.send({
          message: "Data Update Success",
        });
        res.end();
      }
    });
  } else {
    const error = new Error('Not Logout');
    res.json({ status: "Not Logout" });
    error.statusCode = 500;
  }
};

http://localhost:5000/post/logAgentMember/1
exports.logAgentMember = async (require, response) => {
  const agentId = require.params.agentId;
  const searchKeyword = require.body.name;
  const pageSize = require.body.pageSize;
  const pageNumber = require.body.pageIndex;
  const offset = (pageNumber - 1) * pageSize;

  if (searchKeyword === '' || searchKeyword === undefined) {
    let sql = `SELECT id, name, username, status, credit, created_at FROM member WHERE status_delete='N' AND agent_id = ${agentId} LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, async (error, results) => {
      if (error) { console.log(error); }
      const totalCount = `SELECT COUNT(*) as count FROM member WHERE status_delete='N' `
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
    let sql = `SELECT id, name, username, status, credit, created_at FROM member WHERE status_delete='N' AND agent_id = ${agentId} AND 
      username LIKE '%${searchKeyword}%' OR name LIKE '%${searchKeyword}%' OR id LIKE '%${searchKeyword}%'
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
};


http://localhost:5000/post/singUpSubAgent
exports.singUpSubAgent = async (require, response) => {
  const agent_id = require.body.id_agent;
  const username = require.body.username;
  const password = require.body.password;
  const name = require.body.name;
  const contact_number = require.body.contact_number;
  const credit = require.body.credit;
  const level = require.body.level;
  const rank = require.body.positiontype;
  const currency = require.body.currency
  const gameNameId_1 = require.body.dataPercent;
  const dataActive = require.body.dataActive;
  console.log(dataActive.length);
  let sql_check = `SELECT * FROM subagent WHERE username='${username}' ORDER BY username ASC`;
  connection.query(sql_check, async (error, results) => {
    try {
      const data = results;
      if (data.length !== 1) {
        const hashedPassword = await bcrypt.hash(password, 12);

        let sql = `INSERT INTO subagent (id_agent, name, username, password, contact_number, level, ranksubAgent, currencysubagent, creditsub, created_at) 
            value ('${agent_id}','${name}','${username}','${hashedPassword}','${contact_number}','${level}','${rank}','${'บาท'}','${credit}',now())`;
        connection.query(sql, (error, result) => {
          if (error) { console.log(error) }
          else {
            let sql_percengame = `SELECT id FROM subagent WHERE username='${username}' `
            connection.query(sql_percengame, (error, resultidSubAgent) => {
              if (error) { console.log(error) }
              else if (gameNameId_1.length !== 0) {
                for (let i = 0; i < gameNameId_1.length; i++) {
                  let createdPercent = `INSERT INTO percentgame (subagent_id, gamename, img, hold_percentage, our_percentage, monthly_total, monthly) 
                  value ('${resultidSubAgent[0].id}','${gameNameId_1[i].namegame}','${'/img/thumbs/icontest' + (i + 1) + '.png'}','${gameNameId_1[i].PercentValus + '%'}','${90 - gameNameId_1[i].PercentValus + '%'}','${0}',now())`;
                  try {
                    connection.query(createdPercent, (error, results) => {
                      if (error) { console.log(error) }
                    });
                  } catch (err) {
                    if (!err.statusCode) {
                      err.statusCode = 500;
                    }
                    next(err);
                  }
                }
              }
            })

            if (dataActive.length !== 0) {
              let sql_percengame = `SELECT id FROM subagent WHERE username='${username}' `
              try {
                connection.query(sql_percengame, (error, resultsid) => {
                  if (error) { console.log(error) }
                  else {
                    for (let x = 0; x < dataActive.length; x++) {
                      //console.log(gameNameId_1[i].namegame);
                      let updateActive = `UPDATE percentgame set status_game = '${dataActive[x].activeValue}'
                        WHERE subagent_id='${resultsid.id}' AND gamename = '${dataActive[x].namegame}'`;
                      connection.query(updateActive, (error, results1) => {
                        if (x === dataActive.length - 1) {
                          response.status(200).json({ message: 'updateActive succeed' })
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
            }
          }
        });
      }
      else {
        response.send({
          message: "subAgent Creates False"
        });
        response.end();
      }
    } catch (err) {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    }
  })
};

http://localhost:5000/post/singUpSubAgent
exports.resetPasswordAgent = async (require, response) => {
  const id = require.params.id_agent;
  const password = require.body.password;
  const newPassword = require.body.newPassword

  let sql_check = `SELECT password FROM agent WHERE id='${id}' ORDER BY username ASC`;
  connection.query(sql_check, async (error, results) => {
    try {
      const data = results;
      if (data.length === 1) {
        const storedUser = data[0];
        const passwordMatches = await bcrypt.compare(password, storedUser.password);

        if (!passwordMatches) {
          response.status(200).json({ message: "Can't find this password" });
        } else {
          const hashedPassword = await bcrypt.hash(newPassword, 12);
          let sql = `UPDATE agent set password = '${hashedPassword}'`;
          connection.query(sql, (error, result) => {
            if (error) { console.log(error) }
            response.send({
              message: "subAgent editPassword Success"
            });
            response.end();
          });
        }
      }
      else {
        response.status(200).json({ message: "subAgent Creates False" });
      }
    } catch (err) {
      if (!err.statusCode) {
        //err.statusCode = 500;
      }
    }
  })
};

http://localhost:5000/post/EditDataSubAgent
exports.EditDataSubAgent = async (require, response) => {
  const id = require.body.id;
  const username = require.body.username;
  const password = require.body.password;
  const name = require.body.name;
  const contact_number = require.body.contact_number;
  const credit = require.body.credit;
  const level = require.body.level;
  const rank = require.body.rank;
  const currency = require.body.currency

  if (password === "" || password === undefined) {
    let sql_password = `SELECT password FROM subagent WHERE id='${id}'`;
    connection.query(sql_password, async (error, results) => {
      if (error) { console.log(error); }
      else {
        let sql_Update = `UPDATE subagent set username = '${username}', name = '${name}', password = '${results[0].password}', 
  contact_number = '${contact_number}', level = '${level}', creditsub = '${credit}', ranksubAgent = '${rank}', currencysubagent = '${currency}' WHERE id='${id}'`;
        connection.query(sql_Update, async (error, results) => {
          try {
            if (error) { console.log(error); }
            response.send({
              message: 'UpDate Success',
            });
            response.end();

          } catch (err) {
            if (!err.statusCode) {
              err.statusCode = 500;
            }
          }
        })
      }
    })
  }
  else {
    const hashedPassword = await bcrypt.hash(password, 12);
    let sql_password = `SELECT password FROM subagent WHERE id='${id}'`;
    connection.query(sql_password, async (error, results) => {
      if (error) { console.log(error); }
      else {
        let sql_Update = `UPDATE subagent set username = '${username}', name = '${name}', password = '${hashedPassword}', 
        contact_number = '${contact_number}', level = '${level}', creditsub = '${credit}', ranksubAgent = '${rank}', currencysubagent = '${currency}' WHERE id='${id}'`;
        connection.query(sql_Update, async (error, results) => {
          try {
            if (error) { console.log(error); }
            response.send({
              message: 'UpDate Success',
            });
            response.end();

          } catch (err) {
            if (!err.statusCode) {
              err.statusCode = 500;
            }
          }
        })
      }
    })
  }
};


http://localhost:5000/post/listSubAgent/1
exports.listSubAgent = async (require, response) => {
  const id_Agent = require.params.id_Agent;
  const searchKeyword = require.body.name;
  const pageSize = require.body.pageSize;
  const pageNumber = require.body.pageIndex;
  const offset = (pageNumber - 1) * pageSize;

  if (searchKeyword === '' || searchKeyword === undefined) {
    let sql = `SELECT * FROM subagent WHERE id_agent ='${id_Agent}' AND status_delete='N' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, async (error, results) => {
      if (error) { console.log(error); }
      const totalCount = `SELECT COUNT(*) as count FROM subagent WHERE status_delete='N'`
      connection.query(totalCount, (error, resTotal) => {
        if (error) { console.log(error); }
        response.send({
          message: 'SubagentNoSearch',
          data: results,
          total: resTotal[0].count
        });
        response.end();
      });
    });
  } else {
    let sql = `SELECT * FROM subagent WHERE id_agent = '${id_Agent}' AND status_delete='N' AND 
        username LIKE '%${searchKeyword}%' OR name LIKE '%${searchKeyword}%' OR username LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, async (error, results) => {
      if (error) { console.log(error); }
      response.send({
        message: 'Sub agent_Search',
        data: results,
        total: results.length
      });
      response.end();
    });
  }
};

http://localhost:5000/post/MemberSubAgent/1
exports.MemberSubAgent = async (require, response) => {
  const id_SubAgent = require.params.id_SubAgent;
  const searchKeyword = require.body.name;
  const pageSize = require.body.pageSize;
  const pageNumber = require.body.pageIndex;
  const offset = (pageNumber - 1) * pageSize;

  if (searchKeyword === '' && searchKeyword === undefined) {
    let sql = `SELECT * FROM member WHERE agent_id ='${id_SubAgent}' AND status_delete='N' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, async (error, results) => {
      if (error) { console.log(error); }
      const totalCount = `SELECT COUNT(*) as count FROM member WHERE status_delete='N'`
      connection.query(totalCount, (error, resTotal) => {
        if (error) { console.log(error); }
        response.send({
          message: 'SubagentNoSearch',
          data: results,
          total: results.length
        });
        response.end();
      });
    });
  } else {
    let sql = `SELECT * FROM member WHERE agent_id = '${id_SubAgent}' AND status_delete='N' AND 
        username LIKE '%${searchKeyword}%' OR name LIKE '%${searchKeyword}%' OR username LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, async (error, results) => {
      if (error) { console.log(error); }
      const totalCount = `SELECT COUNT(*) as count FROM member WHERE status_delete='N'`
      connection.query(totalCount, (error, resTotal) => {
        response.send({
          message: 'Sub agent_Search',
          data: results,
          total: resTotal[0].count
        });
        response.end();
      })
    });
  }
};

http://localhost:5000/post/getMenberId/1 
exports.getMenberId = async (require, response) => {
  let user_id = require.params.user_id;
  console.log(user_id)
  let sql = `SELECT * FROM member WHERE id='${user_id}' AND status_delete='N'`;
  connection.query(sql, (error, results) => {
    if (error) { console.log(error) }
    response.send({
      data: results,
    });
    response.end();
  });
};


http://localhost:5000/list_userGame/1 
exports.getSubAgentId = async (require, response) => {
  let user_id = require.params.user_id;
  let sql = `SELECT * FROM subagent WHERE id='${user_id}' AND status_delete='N'`;
  connection.query(sql, (error, results) => {
    if (error) { console.log(error) }
    response.send({
      data: results,
    });
    response.end();
  });
};

exports.getBalance = async (req, res, next) => {
  let username = 'member001';
  let sql = `SELECT credit FROM member WHERE username ='${username}' AND status_delete='N' 
  ORDER BY member_code ASC`;
  try {
    connection.query(sql, (error, results) => {
      if (error) { console.log(error); }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.send({
          balance: balanceUser,
        });
        res.end();
      }
    });
  } catch (err) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
};

exports.getBank = async (req, res, next) => {
  const id_Bank = req.body.idBank;
  let sql = `SELECT * FROM banknames WHERE id ='${id_Bank}' AND status = 'Y' AND status_delete = 'N'`;
  try {
    connection.query(sql, (error, results) => {
      if (error) { console.log(error); }
      else {
        res.send({
          dataBank: results[0],
        });
        res.end();
      }
    });
  } catch (err) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
};

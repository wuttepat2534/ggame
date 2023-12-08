const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const os = require('os');
const { deflate } = require("zlib");
require('dotenv').config()

const connection = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD
});

//http://localhost:5000/post/commissionGame
exports.getCommission = async (req, res, next) => {
  const searchKeyword = req.body.name;
  const today = new Date();
  const date = today.toISOString().slice(0, 10);
  console.log(searchKeyword);
  let sql = `SELECT * FROM comgogoldplanet WHERE monthly = '${searchKeyword}'`
  try {
    connection.query(sql, (error, results) => {
      if (error) { console.log(error) }
      else {
        let sql_com = `SELECT commission FROM comgogoldplanet `
        connection.query(sql_com, (error, resultscom) => {
          if (error) { console.log(error) }
          else {
            const dataD = {
              commission: resultscom
            };
            const transformedData = [{ commission: dataD.commission.map((item) => item.commission), }]
            const dataA = { transformedData };
            const datacommission = dataA.transformedData.flatMap((item) => item.commission)
            res.send({
              data: results,
              datacommission
            });
            res.end();
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
};

//http://localhost:5000/post/commissionMonthly
exports.getCommissionMonthly = async (req, res, next) => {
  const searchKeyword = req.body.name;
  const today = new Date();
  const date = today.toISOString().slice(0, 10);
  const parts = searchKeyword.split("-");
  const monthYear = `${parts[0]}-${parts[1]}`;

  let sql = `SELECT * FROM comgogoldplanet WHERE monthly LIKE '${monthYear}%'`;
  try {
    connection.query(sql, (error, results) => {
      if (error) { console.log(error) }
      else {
        let sql_com = `SELECT commission FROM comgogoldplanet `
        connection.query(sql_com, (error, resultscom) => {
          if (error) { console.log(error) }
          else {
            const dataD = {
              commission: resultscom
            };
            const transformedData = [{ commission: dataD.commission.map((item) => item.commission), }]
            const dataA = { transformedData };
            const datacommission = dataA.transformedData.flatMap((item) => item.commission)
            res.send({
              data: results,
              datacommission
            });
            res.end();
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
};

//getมาใช้ใน Dashboard
http://localhost:5000/post/postGetallData
exports.getallData = async (require, response) => {
  const searchKeyword = require.body.name;
  const today = new Date();
  const date = today.toISOString().slice(0, 10);
  const parts = searchKeyword.split("-");
  const monthYear = `${parts[0]}-${parts[1]}`;
  const arrayLogDay = []
  let sqlAdmin = `SELECT id FROM admin WHERE status_delete='N' ORDER BY username ASC`;
  let sqlAgent = `SELECT id FROM agent WHERE status_delete='N' ORDER BY username ASC`;
  let sqlMember = `SELECT id FROM member WHERE status_delete='N' ORDER BY username ASC`;
  let sqlGame = `SELECT * FROM game`;
  let sqlGamePlay = `SELECT * FROM loggame`;
  let sqlGameDayPlay = `SELECT * FROM logdaygame WHERE day = '${searchKeyword}'`;
  let sqlCommition = `SELECT * FROM comgogoldplanet WHERE monthly LIKE '${searchKeyword}%'`;

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
                connection.query(sqlGameDayPlay, (error, resultsGameDayPlay) => {

                  if (resultsGameDayPlay.length < 3) {

                    if (resultsGameDayPlay[0] !== undefined) {
                      if (resultsGameDayPlay[0].namegame === 'Go Gold Planet') {
                        arrayLogDay.push(resultsGameDayPlay[0]);
                      }
                    } else {
                      const newElement = { id: 1, game_id: 1, namegame: 'Go Gold Planet', play: 0, bet: 0, win: 0, icon: '/img/thumbs/icontest3.png' };
                      arrayLogDay.push(newElement);
                    }

                    if (resultsGameDayPlay[1] !== undefined) {
                      if (resultsGameDayPlay[0].namegame === 'Lucky Bunny Gold') {
                        arrayLogDay.push(resultsGameDayPlay[0]);
                      }
                    } else {
                      const newElement01 = { id: 2, game_id: 2, namegame: 'Lucky Bunny Gold', play: 0, bet: 0, win: 0, icon: '/img/thumbs/icontest2.png' };
                      arrayLogDay.push(newElement01);
                    }

                    if (resultsGameDayPlay[2] !== undefined) {
                      if (resultsGameDayPlay[0].namegame === 'CowBoys VS Aliens') {
                        arrayLogDay.push(resultsGameDayPlay[0]);
                      }
                    } else {
                      const newElement01 = { id: 3, game_id: 3, namegame: 'CowBoys VS Aliens', play: 0, bet: 0, win: 0, icon: '/img/thumbs/icontest1.png' };
                      arrayLogDay.push(newElement01);
                    }
                  } else {
                    arrayLogDay.push(resultsGameDayPlay)
                  }

                  connection.query(sqlCommition, (error, results) => {
                    if (error) { console.log(error) }
                    else {
                      let sql_com = `SELECT commission FROM comgogoldplanet `
                      connection.query(sql_com, (error, resultscom) => {
                        if (error) { console.log(error) }
                        else {
                          const dataD = {
                            commission: resultscom
                          };
                          const transformedData = [{ commission: dataD.commission.map((item) => item.commission), }]
                          const dataA = { transformedData };
                          const datacommission = dataA.transformedData.flatMap((item) => item.commission)
                          response.send({
                            data: results,
                            datacommission,
                            dataAdmin: resultsAdmin.length,
                            dataAgent: resultsAgent.length,
                            dataMember: resultsMember.length,
                            Member: resultsMember,
                            dataGame: resultsGame,
                            logGame: resultsGamePlay,
                            logDayGame: arrayLogDay
                          });
                          response.end();
                        }
                      });
                    }
                  });
                });
              }
            });
          }
        });
      });
    });
  });
};

//getมาใช้ใน Dashboard
http://localhost:5000/post/postGetallData
exports.getComSubAgent = async (require, response) => {
  const searchKeyword = require.body.name;
  const today = new Date();
  const date = today.toISOString().slice(0, 10);
  const parts = searchKeyword.split("-");
  const monthYear = `${parts[0]}-${parts[1]}`;
  const arrayLogDay = []
  let sqlAdmin = `SELECT id FROM admin WHERE status_delete='N' ORDER BY username ASC`;
  let sqlAgent = `SELECT id FROM agent WHERE status_delete='N' ORDER BY username ASC`;
  let sqlMember = `SELECT id FROM member WHERE status_delete='N' ORDER BY username ASC`;
  let sqlGame = `SELECT * FROM game`;
  let sqlGamePlay = `SELECT * FROM loggame`;
  let sqlGameDayPlay = `SELECT * FROM logdaygame WHERE day = '${searchKeyword}'`;
  let sqlCommition = `SELECT * FROM comgogoldplanet WHERE monthly LIKE '${searchKeyword}%'`;

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
                connection.query(sqlGameDayPlay, (error, resultsGameDayPlay) => {

                  if (resultsGameDayPlay.length < 3) {

                    if (resultsGameDayPlay[0] !== undefined && resultsGameDayPlay[0].namegame === 'Go Gold Planet') {
                      arrayLogDay.push(resultsGameDayPlay[0]);
                    } else {
                      const newElement = { id: 1, game_id: 1, namegame: 'Go Gold Planet', play: 0, bet: 0, win: 0, icon: '/img/thumbs/icontest3.png' };
                      arrayLogDay.push(newElement);
                    }

                    if (resultsGameDayPlay[1] === undefined && resultsGameDayPlay[0].namegame === 'Lucky Bunny Gold') {
                      arrayLogDay.push(resultsGameDayPlay[0]);
                    } else {
                      const newElement01 = { id: 2, game_id: 2, namegame: 'Lucky Bunny Gold', play: 0, bet: 0, win: 0, icon: '/img/thumbs/icontest2.png' };
                      arrayLogDay.push(newElement01);
                    }

                    if (resultsGameDayPlay[2] === undefined && resultsGameDayPlay[0].namegame === 'CowBoys VS Aliens') {
                      arrayLogDay.push(resultsGameDayPlay[0]);
                    } else {
                      const newElement01 = { id: 3, game_id: 3, namegame: 'CowBoys VS Aliens', play: 0, bet: 0, win: 0, icon: '/img/thumbs/icontest1.png' };
                      arrayLogDay.push(newElement01);
                    }
                  } else {
                    arrayLogDay.push(resultsGameDayPlay)
                  }

                  connection.query(sqlCommition, (error, results) => {
                    if (error) { console.log(error) }
                    else {
                      let sql_com = `SELECT commission FROM comgogoldplanet `
                      connection.query(sql_com, (error, resultscom) => {
                        if (error) { console.log(error) }
                        else {
                          const dataD = {
                            commission: resultscom
                          };
                          const transformedData = [{ commission: dataD.commission.map((item) => item.commission), }]
                          const dataA = { transformedData };
                          const datacommission = dataA.transformedData.flatMap((item) => item.commission)
                          response.send({
                            data: results,
                            datacommission,
                            dataAdmin: resultsAdmin.length,
                            dataAgent: resultsAgent.length,
                            dataMember: resultsMember.length,
                            Member: resultsMember,
                            dataGame: resultsGame,
                            logGame: resultsGamePlay,
                            logDayGame: arrayLogDay
                          });
                          response.end();
                        }
                      });
                    }
                  });
                });
              }
            });
          }
        });
      });
    });
  });
};


//http://localhost:5000/post/commissionMonthly
exports.updatePercent = async (req, res, next) => {
  const id_SubAgent = req.body.dataPercent.id
  const gameNameId_1 = req.body.dataPercent.data;
  const gameActive = req.body.dataPercent.dataActive
  console.log('on');
  if (gameNameId_1.length !== 0) {
    for (let i = 0; i < gameNameId_1.length; i++) {
      //console.log(gameNameId_1[i].namegame);
      const numericValue = parseInt(gameNameId_1[i].PercentValus, 10);
      let update = `UPDATE percentgame set hold_percentage = '${numericValue + '%'}' ,our_percentage = '${90 - numericValue + '%'}'
        WHERE subagent_id='${id_SubAgent}' AND gamename = '${gameNameId_1[i].namegame}'`;
      try {
        connection.query(update, (error, results) => {
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

  if (gameActive.length !== 0) {
    for (let x = 0; x < gameActive.length; x++) {
      //console.log(gameNameId_1[i].namegame);
      let updateActive = `UPDATE percentgame set status_game = '${gameActive[x].activeValue}'
        WHERE subagent_id='${id_SubAgent}' AND gamename = '${gameActive[x].namegame}'`;
      try {
        connection.query(updateActive, (error, results1) => {
          if (error) { console.log(error) }
          else {
            if (x === gameActive.length - 1) {
              res.status(200).json({ message: 'updateActive succeed' })
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
};

//http://localhost:5000/post/GetPercentSubAgent/:id
exports.getPercent = async (req, res, next) => {
  const id_SubAgent = req.params.id;
  let sql_percengame = `SELECT * FROM percentgame WHERE subagent_id='${id_SubAgent}' `
  try {
    connection.query(sql_percengame, (error, results) => {
      if (error) { console.log(error) }
      else {
        res.status(200).json({ data: results, dataValus: results.length })
      }
    });
  } catch (err) {
    if (!err.statusCode) {
      err.statusCode = 500;
    }
    next(err);
  }
};

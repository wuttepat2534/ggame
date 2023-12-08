http://localhost:5000/play/game/add
//ส่งค่า post 2 ตัวคือ user_id, bet
//url เปลี่ยนเป็น http://relaxtimecafe.fun/play/game/save
app.post('/play/game/save/:user_id/:bet',(require,response)=>{
    //let user_id = require.body.user_id;
    let user_id = require.params.user_id;
    //let bet = 10;
    let bet = require.params.bet;
    let game_id = 1;

    const today = new Date();
    const date = today.toISOString().slice(0, 10);

    let sql_check = `SELECT id, member_code, name, username, credit, status FROM member WHERE id='${user_id}' AND status_delete='N' 
    ORDER BY member_code ASC`;
    let sql_logGame = `SELECT play, bet, win FROM loggame WHERE id='${game_id}'`;

    connection.query(sql_check,(error,results_check)=>{
        if(results_check.length > 0){
            let user_credit = results_check[0].credit;
            if(user_credit == ""){ user_credit = 0; }
            let jsonGame = MainGame(user_credit,bet);
            let credit = jsonGame.balance;
            let win = jsonGame.win;
            let tiles = jsonGame.tiles;
            let winline = jsonGame.winline;
            let isWinFreeSpin = jsonGame.isWinFreeSpin
            const tilesArr = tiles.split(",").map(Number);
            const winlineArr = winline.split(",").map(Number)
            const wineArr = parseFloat(win);
            const beteArr = parseFloat(bet);
            let sql_insert = `INSERT INTO user_play (member_id, game_id, bet, win, tiles, winline, credit, created_at) 
            value ('${user_id}','${game_id}','${bet}','${win}','${tiles}','${winline}','${credit}',now())`;

            // commissionGame----------------------------------------------------------------------------------------------------//
            let selectSpl_commissionDay = `SELECT * FROM comgogoldplanet WHERE monthly = '${date}'`;
            connection.query(selectSpl_commissionDay,(error,result_commissionDay)=>{
                if(error){ 
                    console.log(error) 
                }else{
                    if (result_commissionDay.length === 0){ //INSERT comgogoldplanet
                        if (game_id === 1){
                            let sql_insertCommission = `INSERT INTO comgogoldplanet (bet_gogold, win_gogold, day, monthly) 
                        value ('${beteArr}','${wineArr}','${date}','${date}')`;
                            connection.query(sql_insertCommission,(error,result_GameUpdate)=>{
                            if(error){ 
                            console.log(error) }
                        });
                        }
                        else if (game_id === 2){
                            let sql_insertCommission = `INSERT INTO comgogoldplanet (bet_luckybunny, win_luckybunny	, day, monthly) 
                        value ('${beteArr}','${wineArr}','${date}','${date}')`;
                            connection.query(sql_insertCommission,(error,result_GameUpdate)=>{
                            if(error){ 
                            console.log(error) }
                        });
                        }
                        else{
                            let sql_insertCommission = `INSERT INTO comgogoldplanet (bet_aliens, win_aliens, day, monthly) 
                            value ('${beteArr}','${wineArr}','${date}','${date}')`;
                                connection.query(sql_insertCommission,(error,result_GameUpdate)=>{
                                if(error){ 
                                console.log(error) }
                            });
                        }
                    }else{ //UpDate comgogoldplanet
                        if (game_id === 1){
                            let sql_insertCommission = `UPDATE comgogoldplanet set 
                            bet_gogold='${result_commissionDay[0].bet_gogold + beteArr}',win_gogold='${result_commissionDay[0].win_gogold + wineArr}' WHERE monthly = '${date}'`;
                            connection.query(sql_insertCommission,(error,result_GameUpdate)=>{
                            if(error){ 
                            console.log(error)}
                        });
                        }
                        else if (game_id === 2){
                            let sql_insertCommission = `UPDATE comgogoldplanet set 
                            bet_luckybunny='${result_commissionDay[0].bet_luckybunny + beteArr}',win_luckybunny='${result_commissionDay[0].win_luckybunny + wineArr}' WHERE monthly = '${date}'`;
                            connection.query(sql_insertCommission,(error,result_GameUpdate)=>{
                            if(error){ 
                            console.log(error)}
                        });
                        }
                        else{
                            let sql_insertCommission = `UPDATE comgogoldplanet set 
                            bet_aliens='${result_commissionDay[0].bet_aliens + beteArr}',win_aliens='${result_commissionDay[0].win_aliens + wineArr}' WHERE monthly = '${date}'`;
                            connection.query(sql_insertCommission,(error,result_GameUpdate)=>{
                            if(error){ 
                            console.log(error)}
                        });
                        }
                    }
                }});
            // commission----------------------------------------------------------------------------------------------------------------------------//

            connection.query(sql_insert,(error,result_insert_play)=>{
                if(error){ 
                    console.log(error) 
                }else{
                    let spl_feesPin = `INSERT INTO game_feespin (member_id, game_id, game_feespin) value ('${user_id}','${game_id}','${isWinFreeSpin}')`;
                    connection.query(spl_feesPin,(error,result_feesPin)=>{
                        if(error){ 
                            console.log(error) 
                        }else{
                            let sql_update = `UPDATE member set credit='${credit}',bet_latest='${bet}' WHERE id='${user_id}'`;
                        connection.query(sql_update,(error,result_update_user)=>{
                            if(error){ 
                                console.log(error) 
                            }else{
                                connection.query(sql_logGame,(error,result_logGame)=>{
                                    if(error){ 
                                        console.log(error) 
                                    }else{
                                        const upPlay = result_logGame[0].play + 1;
                                        const upBet = result_logGame[0].bet + beteArr;
                                        const upWin = result_logGame[0].win + wineArr;
                                        let sql_logGameUpdate = `UPDATE loggame set play='${upPlay}',bet='${upBet}', win='${upWin}' 
                                        WHERE id='${game_id}'`;
                                        connection.query(sql_logGameUpdate,(error,result_logGameUpdate)=>{
                                            if(error){ 
                                                console.log(error) 
                                            }else{
                                                let sql = `SELECT id, member_code, name, username, credit, status FROM member WHERE id='${user_id}' AND status_delete='N' 
                                                ORDER BY member_code ASC`;
                                                connection.query(sql,(error,results)=>{
                                                    if(error){ console.log(error) }
                                                    response.send({
                                                        //message: 'member play game: '+game_id,
                                                         dataTiles: tilesArr,
                                                         dataCredit: results[0].credit,
                                                         dataWinLine: winlineArr,
                                                         dataFeeSpin: isWinFreeSpin,
                                                         dataWin : wineArr,
                                                         dataMember: results[0].member_code
                                                    }); 
                                                    response.end();
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
        }else{
            response.send({
                message: "no member information",
            });
            response.end();
        } 
    });

    function CombinationCal(slot,tileNum,fromReel,toReel){
        let combi = 1;
        let count = 0;
    
        for(fromReel; fromReel < toReel; fromReel++){
            for(let j = 0; j < slot[fromReel].length; j++){
                if(slot[fromReel][j] == tileNum){
                    count++;
                }
            }
            combi *= count;
            count = 0;
        }
    
        return combi;
    }
    
    function MainGame(credit,bet){
        let win = 0;
        let lineCost = bet / 30;
        let tile15 = [];
        let winLine = [];
        let reels = [[],[],[],[],[]];
        let highestWinLine = [];
        let winingTile = [];
        let slotTemp = [];
        let jsArray = [];
        let isWinFreeSpin = false;

        const tileIndexLine = [ 
            [1,4,7,10,13 ],[0,3,6,9,12],[2,5,8,11,14],[0,4,8,10,12],[2,4,6,10,14],[0,3,7,9,12],[2,5,7,11,14],[1,5,8,11,13],[1,3,6,9,13],[0,4,7,10,12],
            [2,4,7,10,14],[1,4,6,10,13],[1,4,8,10,13],[0,5,8,11,12],[2,3,6,9,14],[1,3,7,9,13],[1,5,7,11,13],[0,5,6,11,12],[2,3,8,9,14],[0,4,6,10,12],
            [2,4,8,10,14],[0,5,7,11,12],[2,3,7,9,14],[1,3,8,9,13],[1,5,6,11,13],[0,3,8,9,12],[2,5,6,11,14],[0,3,6,9,14],[2,5,8,11,13],[1,4,7,10,12]
        ];
    
        const RewardTable = [
            [3,8,15],[3,8,15],[5,15,30],[5,15,30],[5,15,30],[5,15,30],[10,20,50],[10,20,50],[15,30,80],[15,30,80],[20,50,150],[50,150,500],[0,0,0]
        ];
    
        const slot = [
            [5, 4, 5, 2 , 4, 0, 1, 3, 6 ,0 ,7,8,9,10,11,12],[5, 4, 6, 2 , 0, 0, 1, 3, 6 ,1, 7, 8, 9, 10, 11,12],
            [5, 4, 5, 2 , 4, 0, 1, 3, 6, 6, 7, 8, 9, 10, 11,12],[5, 4, 5, 2 , 6, 0, 1, 3, 6, 4, 7, 8, 9, 10, 11,12],
            [5, 4, 5, 2 , 4, 0, 1, 5, 6, 3, 7, 8, 9, 10, 11,12]
        ];
    
        const combination = [[],[],[],[],[],[],[],[],[],[],[],[],[]];
    
        if(bet <= credit){
            for(let i = 0; i < 13 ;i++){
                combination[i].push(CombinationCal(slot,i,0,3));
                combination[i].push(CombinationCal(slot,i,1,4));
                combination[i].push(CombinationCal(slot,i,2,5));
                combination[i].push(CombinationCal(slot,i,0,4));
                combination[i].push(CombinationCal(slot,i,1,5));
                combination[i].push(CombinationCal(slot,i,0,5));
            }
            isWinFreeSpin = false;
            credit -= bet;
            reels = [[],[],[],[],[]];
            slotTemp = slot;
            
            for (let i = 0; i < 5; i++){
                for(let j = 0; j < 6; j++){
                    let rand = Math.floor(Math.random() * slotTemp[i].length);
                    reels[i].push(slotTemp[i][rand]);
                    if(j < 3){
                        tile15.push(reels[i][j]);
                    }
                    slotTemp[i].splice(rand,1);
                }
                slotTemp[i] = [];
            }
            
            let lastestTile = "";
    
            for (let j = 0; j < 30; j++){
                let tileCount = 1;
                let currentPayline = [];
                for (let x = 0; x < 5; x++) {
                    currentPayline[x] = tileIndexLine[j][x]
                }
                lastestTile = tile15[currentPayline[0]]//เอา frame ของ tile แรกเก็บไว้
                highestWinLine[j] = 0
        
                for(let i = 1; i <= 4 ;i++){
                    if(tile15[currentPayline[i]] == lastestTile){
                        tileCount += 1;
                        if(tileCount >= 3){
                            highestWinLine[j] = tileCount;
                            winingTile[j] = lastestTile;
        
                            if(highestWinLine[j] == 3){
                                win += lineCost * RewardTable[winingTile[j]][0]
                                if(winingTile[j] == 12){
                                    isWinFreeSpin = true;
                                }    
                            }else if(highestWinLine[j] == 4){
                                win += lineCost * RewardTable[winingTile[j]][1]
                            }else if(highestWinLine[j] == 5){
                                win += lineCost * RewardTable[winingTile[j]][2]
                            }
                        }
                    }else{
                        lastestTile = tile15[currentPayline[i]];
                        tileCount = 1;
                    }
                }
        
                if(winingTile[j] == null){
                    winingTile[j] = undefined;
                }
            }
    
            for (let j = 0; j < 30; j++){
                if (highestWinLine[j] != 0){
                    winLine.push(j);
                }
            }
            credit += win;
        }
        jsArray = '{"balance": \"'+credit+'\","bet":\"'+bet+'\","win":\"'+win+'\","tiles":\"'+tile15+'\","winline":\"'+winLine+'\","isWinFreeSpin":\"'+isWinFreeSpin+'\"}';
        jsArray = JSON.parse(jsArray);
        return jsArray;
    }
});




function spellinglist(area) {
    if(area == 0) {
    spell.clear();
    }


    var db = Sql.LocalStorage.openDatabaseSync("UserInfo", "1.0", "Local UserInfo", 1);


       var  testStr = "SELECT  *  FROM LIST WHERE 1";

    db.transaction(function(tx) {

        tx.executeSql('CREATE TABLE IF NOT EXISTS LIST (word TEXT,newword INT)');

         var pull =  tx.executeSql(testStr);
        var num = 0;

        if(pull.rows.length > 0) {
            var previous;

        while(num < pull.rows.length ) {


             if(area == 0) {
                    spell.append({ theword:pull.rows.item(num).word,
                                    isnew:pull.rows.item(num).newword

                     });
    }
             if(area == 2) {

                 currentlist = pull.rows.item(num).word+","+currentlist;


                 powermeter = currentlist.length - currentlist.split(",").length;

                 playermeter = powermeter;
                 enemymeter = powermeter;

                 currentword = currentlist.split(",")[Math.floor((Math.random() * currentlist.split(",").length-1) + 1)];

             }


            num = num + 1;

              }
        }

        });



}

function spellinglist_save(word) {


    var db = Sql.LocalStorage.openDatabaseSync("UserInfo", "1.0", "Local UserInfo", 1);

    var testStr = "SELECT  *  FROM LIST WHERE word='"+word+"'";


    var data = [word,1];

    var libStr = "INSERT INTO LIST VALUES(?,?)";

    db.transaction(function(tx) {

        tx.executeSql('CREATE TABLE IF NOT EXISTS LIST (word TEXT,newword INT)');

         var pull =  tx.executeSql(testStr);

        if(pull.rows.length == 0) {

                tx.executeSql(libStr,data);

            spell.append({ theword:word,
                           isnew:1});

        } else {



        }



    });



    //console.log(word);

addtheword.visible = false;


}


function spellinglist_del(word) {


    var db = Sql.LocalStorage.openDatabaseSync("UserInfo", "1.0", "Local UserInfo", 1);

    var testStr = "SELECT  *  FROM LIST WHERE word='"+word+"'";


    var libStr = "DELETE FROM LIST WHERE word='"+word+"'";

    db.transaction(function(tx) {

        tx.executeSql('CREATE TABLE IF NOT EXISTS LIST (word TEXT,newword INT)');

         var pull =  tx.executeSql(testStr);


        if(pull.rows.length != 0) {

                tx.executeSql(libStr);


        } else {



        }



    });




   // console.log(word);

    spellinglist(0);

deltheword.visible = false;


}

var done = 0;
function battlemode() {

        if(done == 1) {
            currentword = currentlist.split(",")[Math.floor((Math.random() * currentlist.split(",").length-1) + 1)];
            if(currentlist.split(",").length != previouswords.split(",").length) {
                while(previouswords.split(",").indexOf(currentword) != -1) {
            currentword = currentlist.split(",")[Math.floor((Math.random() * currentlist.split(",").length-1) + 1)];
                }
            }
               done = 0;
            currentcorrect ="";
        }

        if(currentword.length < 2 ) {
             currentword = currentlist.split(",")[Math.floor((Math.random() * currentlist.split(",").length-1) + 1)];
                //done = 0;

        } else {
            if(previouswords.split(",").indexOf(currentword) == -1) {
            previouswords = currentword+","+previouswords;
            }
            //console.log(currentlist+ " "+currentlist.split(",").length);
            //console.log(previouswords + " "+previouswords.split(",").length);
        }

        if(word.length >= currentword.length) {
            word = word.slice(0,currentword.length);
        }

        if(currentcorrect.length < 2) {
                var i;
                    //console.log("creating challenge");
            for(i =0;i<currentword.length;i = i+1) {
                //console.log(currentword.split(""));

                if(currentcorrect.length > 2) {
                    currentcorrect = currentcorrect+","+currentword.split("")[i]+":0";
                } else {
                    currentcorrect = currentword.split("")[i]+":0";
                }
            }

        }

        for (var i =0;i < currentcorrect.split(",").length;i = i + 1) {
                //console.log(currentcorrect.split(",")[i]);
            if(currentcorrect.split(",")[i].split(":")[1] == 1) {
                done = 1;
            } else {
                done = 0;
                break;

            }

        }

        if(enemymeter <= 0) {
            console.log("You Win");
        } else {
            //console.log(enemymeter);
        }

        if(playermeter <= 0) {
            console.log("Enemy Wins");
        } else {
           // console.log(playermeter);
        }


}

function attack(l) {

    var letternum = 0;
    while (letternum < l.length) {

        switch(l.split("")[letternum]) {
                case "A": letters("A");break;
                case "B": letters("B");break;
                case "C": letters("C");break;
                case "D":letters("D");break;
                case "E": letters("E");break;
                case "F":letters("F");break;
                case "G": letters("G");break;
                case "H": letters("H");break;
                case "I":letters("I");break;
                case "J":letters("J");break;
                case "K": letters("K");break;
                case "L": letters("L");break;
                case "M":letters("M");break;
                case "N": letters("N");break;
                case "O": letters("O");break;
                case "P": letters("P");break;
                case "Q": letters("Q");break;
                case "R": letters("R");break;
                case "S": letters("S");break;
                case "T": letters("T");break;
                case "U": letters("U");break;
                case "V": letters("V");break;
                case "W": letters("W");break;
                case "X": letters("X");break;
                case "Y": letters("Y");break;
                case "Z": letters("Z");break;

        }

        letternum = letternum + 1;

    }

    console.log("checking word");

    var checkletter =0;
    while (checkletter < l.length) {
        console.log("checking letter,"+ l.split("")[checkletter]+" in "+currentword);

            if(currentword.search(l.split("")[checkletter]) != -1) {
                enemymeter = enemymeter - 1;
                console.log("Enemy took damage");

                var temp_array = currentcorrect.split(",");
                    if(temp_array.indexOf(l.split("")[checkletter]+":0") != -1) {
               temp_array.splice(temp_array.indexOf(l.split("")[checkletter]+":0"),1,l.split("")[checkletter]+":1");
                         currentcorrect = temp_array.join();

                        if((temp_array.indexOf(l.split("")[checkletter]+":0") + 2) % 2) {
                            console.log("Right Punch");
                            ppunch = 2;
                        } else {
                            console.log("Left Punch");
                            ppunch = 1;}

                    }


           } else {
                playermeter = playermeter - 1;
                console.log("Player took damage");

                if(epunch == 1) {
                    console.log("Right Punch");
                    epunch = 2;
                } else {
                    console.log("Left Punch");
                    epunch = 1;}

           }


        checkletter = checkletter +1;
    }


        //word = "";
}

function letters(l) {
    var newletter = 0;
    var newlist = "";


   while(newletter <= 25) {



       if(l == pletters.split(",")[newletter].split(":")[0]) {
           newlist = l+":1,"+newlist;
       } else { newlist =pletters.split(",")[newletter]+","+newlist}

       newletter = newletter + 1;
   }
   pletters = newlist;



}

import QtQuick 2.0
import "main.js" as Scripts

import QtQuick.LocalStorage 2.0 as Sql

Item {

    id:window_container

    property int rotate_check: 0



    Timer {
        id:loop
        interval:1000
        repeat:true
        onTriggered:Scripts.battlemode()
    }

    states: [

        State {
            name:"Show"

            PropertyChanges {
                target: window_container
                opacity: 1
                x:0
            }
        },

        State {
            name:"Hide"

                PropertyChanges {
                    target:window_container
                    opacity:0
                    x:parent.height
                }
        }

    ]

    transitions: [

        Transition {
            from: "Show"
            to: "Hide"


            NumberAnimation {
                target: window_container
                property: "opacity"
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        }

    ]


    onStateChanged:if(window_container.state == "Show") {loop.running =true} else {loop.running = false}

    Image {
        anchors.fill:parent
        fillMode:Image.PreserveAspectCrop
        source:"graphics/battle1.png"
    }


    Item {
        id:pusedletters

        anchors.top:playerbar.bottom
        anchors.left:parent.left

       width:parent.height* 0.05
       height:parent.height

       Column {
           id:column
           width:parent.width
           height:parent.height
           spacing:5
           Repeater {
           model:pletters.split(",")

           Text {

               text:modelData.split(":")[0]
               color:if(modelData.split(":")[1] == 0) {"black"} else {"white"}
               font.pixelSize: parent.width /2.5
           }
          /* Image {
               width:parent.height * 0.05
               height:parent.height * 0.05
               visible: if(modelData.split(":")[1] == 1) {true} else {false}
               source: {
                        switch(modelData.split(":")[0]) {
                        case "A":"/graphics/letters/0001.png";break;
                        case "B":"/graphics/letters/0002.png";break;
                        case "C":"/graphics/letters/0003.png";break;
                        case "D":"/graphics/letters/0004.png";break;
                        case "E":"/graphics/letters/0005.png";break;
                        case "F":"/graphics/letters/0006.png";break;
                        case "G":"/graphics/letters/0007.png";break;
                        case "H":"/graphics/letters/0008.png";break;
                        case "I":"/graphics/letters/0009.png";break;
                        case "J":"/graphics/letters/0010.png";break;
                        case "K":"/graphics/letters/0011.png";break;
                        case "L":"/graphics/letters/0012.png";break;
                        case "M":"/graphics/letters/0013.png";break;
                        case "N":"/graphics/letters/0014.png";break;
                        case "O":"/graphics/letters/0015.png";break;
                        case "P":"/graphics/letters/0016.png";break;
                        case "Q":"/graphics/letters/0017.png";break;
                        case "R":"/graphics/letters/0018.png";break;
                        case "S":"/graphics/letters/0019.png";break;
                        case "T":"/graphics/letters/0020.png";break;
                        case "U":"/graphics/letters/0021.png";break;
                        case "V":"/graphics/letters/0022.png";break;
                        case "W":"/graphics/letters/0023.png";break;
                        case "X":"/graphics/letters/0024.png";break;
                        case "Y":"/graphics/letters/0025.png";break;
                        case "Z":"/graphics/letters/0026.png";break;
                      }

               }

           } */

          }
       }

    }

    Item {
        id:eusedletters

         anchors.top:enemybar.bottom

        anchors.right:parent.right

        width:parent.height* 0.05
        height:parent.height

        Column {
            width:parent.width
            height:parent.height
            anchors.right:parent.right
            spacing:5
            Repeater {
            model:eletters.split(",")

            Text {
                anchors.right:parent.right
                text:modelData.split(":")[0]
                color:if(modelData.split(":")[1] == 0) {"black"} else {"white"}
                font.pixelSize: parent.width /2.5
            }

           }
        }

    }

    Player {
        id:player
        //x:(parent.width * 0.1) + (word.length * (parent.width * 0.01))
        x:parent.width * 0.01
        anchors.bottom:parent.bottom
        width:parent.width * 0.5
        height:parent.height * 0.7
    }

    Enemy {
        id:enemy
        x:parent.width * 0.77
        anchors.bottom:parent.bottom

        //x:parent.width - (width / 2)
        width:parent.width * 0.5
        height:parent.height * 0.7
    }

    Item {
        id:playerbar
        width:parent.height * 0.4
        height:parent.height * 0.05

        anchors.left:parent.left
        anchors.leftMargin:parent.height * 0.01
        anchors.top:parent.top
        anchors.topMargin:parent.height * 0.05


        Row {
            anchors.left:parent.left
            height: parent.height
           spacing:3

            Repeater {
                model:playermeter

                Rectangle {
                    color:"red"
                    width:playerbar.height  * 0.8
                    height:playerbar.height  * 0.8
                }
            }
        }

    }

    Item {
        id:enemybar
        width:parent.height * 0.4
        height:parent.height * 0.05

        anchors.right:parent.right
        anchors.rightMargin:parent.height * 0.01
        anchors.top:parent.top
        anchors.topMargin:parent.height * 0.05

        Row {
           anchors.right:parent.right
           height: parent.height
           spacing:3

            Repeater {
                model:enemymeter

                Rectangle {
                    color:"red"
                    width:enemybar.height * 0.8
                    height:enemybar.height  * 0.8
                }
            }
        }

    }

    Row {
        anchors.top:topbar.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing:parent.height * 0.01
        height:parent.height * 0.06
        Repeater {
            model:currentcorrect.split(",")

            Rectangle {
                width:parent.height
                height:parent.height
                color:Qt.rgba(0.1,0.1,0.1,0.5)

                Image {
                    width:parent.height * 0.5
                    height:parent.height * 0.5
                    anchors.centerIn: parent
                    visible: if(modelData.split(":")[1] == 1) {true} else {false}
                    source: {
                             switch(modelData.split(":")[0]) {
                             case "A":"/graphics/letters/0001.png";break;
                             case "B":"/graphics/letters/0002.png";break;
                             case "C":"/graphics/letters/0003.png";break;
                             case "D":"/graphics/letters/0004.png";break;
                             case "E":"/graphics/letters/0005.png";break;
                             case "F":"/graphics/letters/0006.png";break;
                             case "G":"/graphics/letters/0007.png";break;
                             case "H":"/graphics/letters/0008.png";break;
                             case "I":"/graphics/letters/0009.png";break;
                             case "J":"/graphics/letters/0010.png";break;
                             case "K":"/graphics/letters/0011.png";break;
                             case "L":"/graphics/letters/0012.png";break;
                             case "M":"/graphics/letters/0013.png";break;
                             case "N":"/graphics/letters/0014.png";break;
                             case "O":"/graphics/letters/0015.png";break;
                             case "P":"/graphics/letters/0016.png";break;
                             case "Q":"/graphics/letters/0017.png";break;
                             case "R":"/graphics/letters/0018.png";break;
                             case "S":"/graphics/letters/0019.png";break;
                             case "T":"/graphics/letters/0020.png";break;
                             case "U":"/graphics/letters/0021.png";break;
                             case "V":"/graphics/letters/0022.png";break;
                             case "W":"/graphics/letters/0023.png";break;
                             case "X":"/graphics/letters/0024.png";break;
                             case "Y":"/graphics/letters/0025.png";break;
                             case "Z":"/graphics/letters/0026.png";break;
                           }

                    }


                }
            }


        }
    }

    Image {
        id:topbar
     source:"graphics/topbar.png"
     width:parent.width
     height:parent.height * 0.10
     fillMode:Image.PreserveAspectFit


    }




}


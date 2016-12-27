import QtQuick 2.0
import QtQuick.Controls 1.2

import "main.js" as Scripts

import QtQuick.LocalStorage 2.0 as Sql


Item {
    id:window_container

    property string theword:""
    property string todelete:""

    states: [

        State {
            name:"Show"

            PropertyChanges {
                target: window_container
                opacity: 1
                y:0
            }
        },

        State {
            name:"Hide"

                PropertyChanges {
                    target:window_container
                    opacity:0
                    y:parent.height
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

    onStateChanged: if(window_container.state == "Show") {Scripts.spellinglist(0)}

    Image {
        source:"graphics/settings_bg.png"
        anchors.right:parent.right
        width:parent.width
        height:parent.height
        fillMode:Image.PreserveAspectCrop

    }


    Image {
        id:listborder
        width:parent.height * 0.9
        height:parent.height *0.94
        source:"graphics/settings_border.png"
        //color:"darkgray"
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.right:parent.right
        anchors.rightMargin:parent.width * 0.02
        //anchors.verticalCenter: parent.verticalCenter
        anchors.bottom:parent.bottom
        clip:true

        Text {
            anchors.top:parent.top
            anchors.topMargin:parent.height * 0.02
            anchors.horizontalCenter: parent.horizontalCenter
            text:"Spelling List"
            font.pixelSize: parent.height * 0.1
            color:"darkgreen"
        }

        Rectangle {
            id:close
            anchors.right:parent.right
            anchors.margins: parent.height * 0.045
            anchors.top:parent.top

            width:parent.height * 0.1
            height:parent.height * 0.05
            border.color:"darkgreen"
            color:Qt.rgba(0.1,0.2,0.1,0.2)

            Text {
                anchors.centerIn: parent
                text:"Close"
                font.pixelSize: parent.height * 0.4
                color:"darkgreen"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: window_container.state = "Hide",doors.state = "Show",themenu.state = "Show"
            }

        }


        ListView {
            anchors.bottom:bottombumper.top
            width:parent.width
            height:parent.height * 0.6
            spacing:5
            clip:true

            model: ListModel {
                id:spell

            }

            delegate: Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width:listborder.width * 0.9
                    height:listborder.height * 0.04
                    border.color:"darkgreen"
                    color:Qt.rgba(0.0,0.2,0.0,0.1)

                    Text {
                        text:theword
                        color:"darkgreen"
                        anchors.left:parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin:parent.height * 0.1
                        font.pixelSize: parent.height * 0.5
                    }

                    Text {
                        text:if(isnew == 1) {"*"} else{""}
                        color:"darkgreen"
                        anchors.right:parent.right
                        anchors.rightMargin:parent.height * 0.2
                        font.pixelSize: parent.height * 0.8
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: parent.color = "lightgreen",todelete = theword,deltheword.visible = true
                    }

            }
        }


        Rectangle {
            id:bottombumper
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom:parent.bottom
            anchors.bottomMargin:parent.height * 0.15

            width:parent.width * 0.9
            height:parent.height * 0.1
            color:Qt.rgba(0.1,0.1,0.1,0.1)

            Rectangle {
                id:add
                anchors.right:parent.right
                anchors.rightMargin: parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                width:parent.height * 1.2
                height:parent.height * 0.6
                border.color:"darkgreen"
                color:Qt.rgba(0.1,0.3,0.1,0.1)

                Text {
                    anchors.centerIn: parent
                    text:"Add"
                    font.pixelSize: parent.height * 0.4
                    color:"darkgreen"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: add.color = "lightgreen",addtheword.visible = true
                }

            }

            Rectangle {
                id:newlist
                anchors.left:parent.left
                anchors.leftMargin: parent.height * 0.1
                anchors.verticalCenter: parent.verticalCenter
                width:parent.height * 1.2
                height:parent.height * 0.6
                border.color:"darkgreen"
                color:Qt.rgba(0.1,0.3,0.1,0.1)

                Text {
                    anchors.centerIn: parent
                    text:"New"
                    font.pixelSize: parent.height * 0.4
                    color:"darkgreen"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: newlist.color = "lightgreen"
                }

            }

        }

        Rectangle {
            anchors.fill:addtheword
            visible:if(addtheword.visible == true) {true} else {false}
            color:"black"
        }

        Rectangle {
            id:addtheword
            anchors.centerIn: parent
            width:parent.width * 0.8
            height:parent.height * 0.2
            border.color:"darkgreen"
            visible:false
            onVisibleChanged: if(addtheword.visible == true) {add.color = Qt.rgba(0.1,0.3,0.1,0.1)}
            color:Qt.rgba(0.1,0.3,0.1,0.1)
            focus:if(window_container.state == "Show") {true} else {false}

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:parent.top
                text:"Add Word"
                color:"lightgreen"
                font.pixelSize: parent.height * 0.1
            }

            Rectangle {
                width:parent.width * 0.9
                height:newword.height * 1.01
                anchors.centerIn: newword

                color:Qt.rgba(0,0,0,0)
                border.color:"darkgreen"
            }

            Text {
                    id:newword
                anchors.centerIn:parent

                text:theword
                color:"lightgreen"
                font.pixelSize: parent.height * 0.2
            }



            Keys.onPressed: {


                        switch(event.key) {
                        case 65: theword = theword+"A";break;
                        case 66: theword = theword+"B";break;
                        case 67: theword = theword+"C";break;
                        case 68: theword = theword+"D";break;
                        case 69: theword = theword+"E";break;
                        case 70: theword = theword+"F";break;
                        case 71: theword = theword+"G";break;
                        case 72: theword = theword+"H";break;
                        case 73: theword = theword+"I";break;
                        case 74: theword = theword+"J";break;
                        case 75: theword = theword+"K";break;
                        case 76: theword = theword+"L";break;
                        case 77: theword = theword+"M";break;
                        case 78: theword = theword+"N";break;
                        case 79: theword = theword+"O";break;
                        case 80: theword = theword+"P";break;
                        case 81: theword = theword+"Q";break;
                        case 82: theword = theword+"R";break;
                        case 83: theword = theword+"S";break;
                        case 84: theword = theword+"T";break;
                        case 85: theword = theword+"U";break;
                        case 86: theword = theword+"V";break;
                        case 87: theword = theword+"W";break;
                        case 88: theword = theword+"X";break;
                        case 89: theword = theword+"Y";break;
                        case 90: theword = theword+"Z";break;


                        case 16777220: Scripts.spellinglist_save(theword);break;
                        case 16777219: theword = theword.slice(0,theword.length-1);break;
                        }

                }

            Rectangle {
                id:submit
                anchors.right:parent.right
                anchors.margins: parent.height * 0.1
                anchors.bottom:parent.bottom
                //anchors.verticalCenter: parent.verticalCenter
                width:parent.height * 1
                height:parent.height * 0.2
                border.color:"darkgreen"
                color:Qt.rgba(0.1,0.2,0.1,0.9)

                Text {
                    anchors.centerIn: parent
                    text:"Submit"
                    font.pixelSize: parent.height * 0.4
                    color:"darkgreen"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: submit.color = "lightgreen",Scripts.spellinglist_save(theword)
                }

            }

            Rectangle {
                id:cancel
                anchors.left:parent.left
                anchors.margins: parent.height * 0.1
                anchors.bottom:parent.bottom
                //anchors.verticalCenter: parent.verticalCenter
                width:parent.height * 1
                height:parent.height * 0.2
                border.color:"darkgreen"
                color:Qt.rgba(0.1,0.2,0.1,0.9)

                Text {
                    anchors.centerIn: parent
                    text:"Cancel"
                    font.pixelSize: parent.height * 0.4
                    color:"darkgreen"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: addtheword.visible = false
                }

            }

        }


        Rectangle {
            anchors.fill:deltheword
            visible:if(deltheword.visible == true) {true} else {false}
            color:"black"
        }

    Rectangle {
        id:deltheword
        anchors.centerIn: parent
        width:parent.width * 0.8
        height:parent.height * 0.2
        border.color:"darkgreen"
        visible:false
        onVisibleChanged: if(deltheword.visible == true) {deltheword.color = Qt.rgba(0.1,0.3,0.1,0.2)}
        color:Qt.rgba(0.1,0.3,0.1,0.2)
        focus:if(window_container.state == "Show") {true} else {false}




        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            text:"Delete "+todelete+ "?"
            color:"lightgreen"
            font.pixelSize: parent.height * 0.2
        }

        Rectangle {
            id:agree
            anchors.right:parent.right
            anchors.margins: parent.height * 0.1
            anchors.bottom:parent.bottom
            //anchors.verticalCenter: parent.verticalCenter
            width:parent.height * 1
            height:parent.height * 0.2
            border.color:"darkgreen"
            color:Qt.rgba(0.1,0.2,0.1,0.9)

            Text {
                anchors.centerIn: parent
                text:"Delete"
                font.pixelSize: parent.height * 0.4
                color:"darkgreen"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: submit.color = "lightgreen",Scripts.spellinglist_del(todelete)
            }

        }

        Rectangle {
            id:delcancel
            anchors.left:parent.left
            anchors.margins: parent.height * 0.1
            anchors.bottom:parent.bottom
            //anchors.verticalCenter: parent.verticalCenter
            width:parent.height * 1
            height:parent.height * 0.2
            border.color:"darkgreen"
            color:Qt.rgba(0.1,0.2,0.1,0.9)

            Text {
                anchors.centerIn: parent
                text:"Cancel"
                font.pixelSize: parent.height * 0.4
                color:"darkgreen"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: deltheword.visible = false
            }

        }

    }


    }

}


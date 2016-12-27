import QtQuick 2.0
import "main.js" as Scripts

import QtQuick.LocalStorage 2.0 as Sql

Item {


    id:window_container

    property int rotate_check: 0
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

    Image {
        source:"graphics/main.png"
        anchors.left:parent.left
        width:parent.width
        height:parent.height
        fillMode:Image.PreserveAspectCrop

    }

    Rectangle {
        id:menublock
        x:parent.width * 0.183
        width:parent.width * 0.67
        height:parent.height * 0.76
        anchors.top:parent.top
        anchors.topMargin:parent.height * 0.050

        color:Qt.rgba(0.0,0.3,0.0,0.1)
        border.color:"black"
        radius:8
        border.width:4

        Column {
            anchors.centerIn: parent
            width:parent.width * 0.9
            height:parent.height * 0.9
            //anchors.horizontalCenter: parent.horizontalCenter
            spacing:5

            Text {
                text: "Spell Bots"
                color:"darkgreen"
                font.pixelSize: parent.height * 0.2
                anchors.horizontalCenter: parent.horizontalCenter

            }

            Rectangle {
                id:challenge
                anchors.horizontalCenter: parent.horizontalCenter
                width:parent.width * 0.6
                height:parent.height * 0.1
                color:Qt.rgba(0.1,0.2,0.1,0.2)
                 border.color:"darkgreen"

                Text {
                    anchors.centerIn: parent
                    text:"Challenge"
                    color:"darkgreen"
                    font.pixelSize: parent.height * 0.5

                }

                MouseArea {
                    anchors.fill: parent
                    onClicked:doors.state ="Show",words.mode = 1,words.state="Show",Scripts.spellinglist(2),arena.state = "Show"
                }
            }

           /* Rectangle {
                id:practice
                anchors.horizontalCenter: parent.horizontalCenter
                width:parent.width * 0.9
                height:parent.height * 0.2

                Text {
                    anchors.centerIn: parent
                    text:"Practice"
                    font.pixelSize: parent.height * 0.5
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:doors.state ="Show",words.state="Show",train.state = "Show"
                }
            } */

            Rectangle {
                id:settings
                anchors.horizontalCenter: parent.horizontalCenter

                width:parent.width * 0.6
                height:parent.height * 0.1
                color:Qt.rgba(0.1,0.2,0.1,0.2)
                 border.color:"darkgreen"

                Text {
                    anchors.centerIn: parent
                    text:"Settings"
                    color:"darkgreen"
                    font.pixelSize: parent.height * 0.5
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:doors.state ="Show",themenu.state = "Hide",spelllist.state = "Show"
                }
            }




        }

        Rectangle {
            id:quit
            anchors.bottom: parent.bottom
            anchors.right:parent.right
            anchors.margins: parent.height * 0.05

            width:parent.height * 0.2
            height:parent.height * 0.1
            color:Qt.rgba(0.1,0.2,0.1,0.2)
             border.color:"darkgreen"

            Text {
                anchors.centerIn: parent
                text:"Quit"
                color:"darkgreen"
                font.pixelSize: parent.height * 0.5
            }
            MouseArea {
                anchors.fill: parent
                onClicked:Qt.quit()
            }
        }
    }


}


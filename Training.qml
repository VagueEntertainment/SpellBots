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

    onStateChanged: if(window_container.state == "Show") {Scripts.spellinglist(1)}


    Image {
        id:bg
        anchors.fill:parent
        source:"graphics/training_bg.png"

    }

    Item {
        id:centerpose
        visible:false

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        width:parent.width * 0.7
        height:parent.height * 0.9
        Rectangle {
            id:torso
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom:parent.bottom
            width:parent.width * 0.4
            height:parent.height * 0.8
            color:"blue"
        }
        Rectangle {
            id:head
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom:torso.top
            width:parent.width * 0.2
            height:parent.height * 0.2
            color:"green"
        }

        Rectangle {
            id:leftarm
            anchors.top:torso.top
            anchors.right:torso.left
            width:parent.width * 0.1
            height:torso.height * 0.7
            color:"yellow"
        }

        Rectangle {
            id:rightarm
            anchors.top:torso.top
            anchors.left:torso.right
            width:parent.width * 0.1
            height:torso.height * 0.7
            color:"red"

        }


    }

    Item {
        id:leftpose
        visible:true

        anchors.left:parent.left
        anchors.bottom:parent.bottom
        width:parent.width * 0.7
        height:parent.height * 0.9


        Rectangle {
            id:torso_left
            anchors.left: parent.left
            anchors.bottom:parent.bottom
            width:parent.width * 0.5
            height:parent.height * 0.9
            color:Qt.rgba(0,0,0,0)

            Image {
                source:"graphics/bots/torso1.png"
                anchors.fill:parent
            }

        }
        Rectangle {
            id:head_left
            anchors.left: torso_left.horizontalCenter
            anchors.leftMargin: -torso_left.width * 0.3
            anchors.bottom:torso_left.top
            width:parent.width * 0.3
            height:parent.height * 0.3
            color:"green"
        }

        Item {
            id:rightArm
            x:(torso_left.width /1.7)
            y:torso_left.y + (parent.height * 0.15)
            width:10
            height:10

            transformOrigin: Item.Top
            rotation:-20



        Rectangle {
            id:upperRightarm

            x:(parent.width / 2) - (width /2)
            z:1
            //y:parent.y

            width:torso_left.width * 0.4
            height:torso_left.height * 0.7
            color:Qt.rgba(0,0,0,0)

            Image {
                anchors.fill:parent
                source:"graphics/bots/upperarm1.png"
            }


        Rectangle {
            id:lowerRightarm
            y:upperRightarm.height - upperRightarm.height * 0.3
            x:upperRightarm.width / 2 - width / 2
            z:-1

            width:parent.width * 1
            height:parent.height
            color:Qt.rgba(0,0,0,0)


            Image {
                anchors.fill:parent
                source:"graphics/bots/lowerarm1.png"
            }

            transformOrigin: Item.Top
            rotation:-45


            Rectangle {
                id:hand_left
                y:upperRightarm.height * 0.98
                x:(upperRightarm.width / 2) - (width /2)

                width:parent.width * 0.7
                height:parent.height * 0.3
                color:Qt.rgba(0,0,0,0)


                Image {
                    anchors.fill:parent
                    source:"graphics/bots/fist1.png"
                }

            }

        }

        }

    }

       /* Image {
            source:"graphics/bots/uppertorso1.png"
            width:torso_left.width
            height:torso_left.height * 0.4
            anchors.top:torso_left.top

        } */

    }

    Item {
        id:rightpose
        visible:false

        anchors.right:parent.right
        anchors.bottom:parent.bottom
        width:parent.width * 0.7
        height:parent.height * 0.9


        Rectangle {
            id:torso_right
            anchors.right: parent.right
            anchors.bottom:parent.bottom
            width:parent.width * 0.4
            height:parent.height * 0.8
            color:"blue"
        }
        Rectangle {
            id:head_right
            anchors.right: torso_right.horizontalCenter
            anchors.rightMargin: -torso_right.width * 0.3
            anchors.bottom:torso_right.top
            width:parent.width * 0.3
            height:parent.height * 0.3
            color:"green"
        }

        Item {
            id:leftArm
            x:torso_right.x + (torso_right.width /2)
            y:torso_right.y + (parent.height * 0.06)
            width:10
            height:10

            transformOrigin: Item.Top
            rotation:45



        Rectangle {
            id:upperLeftarm

            x:(parent.width / 2) - (width /2)
            z:1
            //y:parent.y

            width:torso_right.width * 0.2
            height:torso_right.height * 0.7
            color:"red"



        Rectangle {
            id:lowerLeftarm
            y:upperLeftarm.height
            x:(upperLeftarm.width / 2) - (width /2)
            z:-1

            width:parent.width * 0.9
            height:parent.height
            color:"darkred"



            transformOrigin: Item.Top
            rotation:40


            Rectangle {
                id:hand_right
                y:upperLeftarm.height
                x:(upperLeftarm.width / 2) - (width /3)

                width:parent.width
                height:parent.height * 0.3
                color:"black"
            }

        }

        }
    }

    }

}


import QtQuick 2.0

Item {
    id:player
    property int gears:0


    Behavior on x {
        NumberAnimation {
                    id: bouncebehavior
                    easing {
                        type: "Linear"
                        amplitude: 1.0
                        period: 2
                    }
                }
    }

    states: [


        State {
        name:"idleL"
        when:epunch == 0


        PropertyChanges {
            target:leftArm
            rotation:29
        }
        PropertyChanges {
            target:lowerLeftarm
            rotation:90
        }
    },
        State {
        name:"idleR"
        when:epunch == 0


        PropertyChanges {
            target:rightArm
            rotation:40
        }
        PropertyChanges {
            target:lowerRightarm
            rotation:95
        }
    },
            State {
            name:"punch1"
            when:epunch == 1

            PropertyChanges {
                target:leftArm
                rotation:90
            }
            PropertyChanges {
                target:lowerLeftarm
                rotation:0
            }

            PropertyChanges {
                target:rightArm
                rotation:40
            }
            PropertyChanges {
                target:lowerRightarm
                rotation:95
            }


        },

        State {
        name:"punch2"
        when:epunch == 2

        PropertyChanges {
            target:rightArm
            rotation:90
        }
        PropertyChanges {
            target:lowerRightarm
            rotation:0
        }

        PropertyChanges {
            target:leftArm
            rotation:29
        }
        PropertyChanges {
            target:lowerLeftarm
            rotation:90
        }


    }





    ]

    transitions: [

        Transition {
            from:"*"
            to:"punch1"
            reversible: true
            onRunningChanged: if(running == false) {epunch = 0}

            NumberAnimation {

                targets: [leftArm,lowerLeftarm,rightArm,lowerRightarm]
                properties: "rotation"
                duration: 150

            }

        },
        Transition {
            from:"*"
            to:"punch2"
            reversible: true
            onRunningChanged: if(running == false) {epunch =0}

            NumberAnimation {

                targets: [rightArm,lowerRightarm,leftArm,lowerLeftarm]
                properties: "rotation"
                duration: 150

            }

        }


]

    state:"idleL"

    Item {
        id:leftpose
        visible:true

        anchors.left:parent.left
        anchors.bottom:parent.bottom
        width:parent.width
        height:parent.height



        Item {
            id:leftArm
            x:torso_left.x + (torso_left.width * 0.2)
            y:torso_left.y + (parent.height * 0.15)
            width:torso_left.width * 0.30
            height:torso_left.height * 0.65

            transformOrigin: Item.Top
            rotation:90



        Rectangle {
            id:upperLeftarm
            z:1
            //y:parent.y


            width:parent.width
            height:parent.height
            color:Qt.rgba(0,0,0,0)

            Image {
                anchors.fill:parent
                source:"graphics/bots/upperarm1.png"
                mirror:true
            }


        Rectangle {
            id:lowerLeftarm
            y:upperLeftarm.height - upperLeftarm.height * 0.3
            x:upperLeftarm.x + width / 4
            z:-1

            width:parent.width * 1
            height:parent.height* 0.9
            color:Qt.rgba(0,0,0,0)


            Image {
                //anchors.fill:parent
                width:parent.width
                height:parent.height * 1.05
                anchors.bottom:parent.bottom
                source:"graphics/bots/lowerarm1.png"
                mirror:true
            }

            transformOrigin: Item.Top
            rotation:0


            Rectangle {
                id:hand_Left
                y:lowerLeftarm.height * 0.98
                x:(upperLeftarm.width / 2) - (width /2)

                width:parent.width * 0.7
                height:parent.height * 0.3
                color:Qt.rgba(0,0,0,0)


                Image {
                    anchors.fill:parent
                    source:"graphics/bots/fist1.png"
                    mirror:true
                }

            }

        }

        }

    }





        Rectangle {
            id:torso_left
            anchors.left: parent.left
            anchors.bottom:parent.bottom
            width:parent.width * 0.5
            height:parent.height * 0.9
            color:Qt.rgba(0,0,0,0)

            Image {
                source:switch(gears) {
                case 0: "qrc:/graphics/bots/torso10002.png";break;
                case 1: "qrc:/graphics/bots/torso10003.png";break;
                case 2: "qrc:/graphics/bots/torso10004.png";break;
                case 3: "qrc:/graphics/bots/torso10001.png";break;
                default: "qrc:/graphics/bots/torso10001.png";break;
                }
                anchors.fill:parent
                mirror:true


            Timer {
                repeat:true
                running:true
                interval: 300
                onTriggered: {
                    if(gears < 3) {
                    gears = gears + 1;
                } else {
                    gears = 0;
                    }
            }
            }

            }

        }
        Rectangle {
            id:head_left
            anchors.right: torso_left.horizontalCenter
            anchors.rightMargin: torso_left.width * 0.01
            anchors.bottom:torso_left.top
            anchors.bottomMargin: -torso_left.height * 0.12
            width:parent.width * 0.2
            height:parent.height * 0.3
            color:Qt.rgba(0,0,0,0)

            Image {
                source:"graphics/bots/head1.png"
                anchors.fill: parent
                mirror:true
            }
        }

        Item {
            id:rightArm
            x:torso_left.x + (torso_left.width * 0.2)
            y:torso_left.y + (parent.height * 0.14)
           // width:upperRightarm.width
           // height:upperRightarm.height
            width:torso_left.width * 0.35
            height:torso_left.height * 0.7

            transformOrigin: Item.Top
            rotation:40



        Rectangle {
            id:upperRightarm
            z:1
            //y:parent.y
            width:parent.width
            height:parent.height

            color:Qt.rgba(0,0,0,0)

            Image {
                y:-10
                width:parent.width
                height:parent.height * 1.1
                source:"graphics/bots/upperarm1.png"
                mirror:true
            }


        Rectangle {
            id:lowerRightarm
            y:upperRightarm.height - upperRightarm.height * 0.2
            x:upperRightarm.x
            z:-1

            width:parent.width * 1
            height:parent.height * 0.9
            color:Qt.rgba(0,0,0,0)


            Image {
                width:parent.width
                height:parent.height * 1.1
                anchors.bottom:parent.bottom
                source:"graphics/bots/lowerarm1.png"
                mirror:true
            }

            transformOrigin: Item.Top

            rotation:95


            Rectangle {
                id:hand_Right
                y:lowerRightarm.height * 0.98
                x:(upperRightarm.width / 2) - (width /2)

                width:parent.width * 0.7
                height:parent.height * 0.3
                color:Qt.rgba(0,0,0,0)


                Image {
                    anchors.fill:parent
                    source:"graphics/bots/fist1.png"
                    mirror:true
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

}


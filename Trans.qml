import QtQuick 2.0

Item {


    id:window_container

    property int ro: 5
    states: [

        State {
            name:"Show"

            PropertyChanges {
                target: window_container
                opacity: 1
                x:0
                ro: 0
            }

            PropertyChanges {
                target:left_door
                x:0
            }
            PropertyChanges {
                target:right_door
                x:parent.width / 2
            }
        },

        State {
            name:"Hide"

                PropertyChanges {
                    target:window_container
                    opacity:0
                    x:parent.height
                }
        },

        State {
            name:"Opened"

            PropertyChanges {
                target:left_door
                x:-parent.width / 2
            }
            PropertyChanges {
                target:right_door
                x:parent.width
            }

            PropertyChanges {
                target:centerlogo
                visible:false
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
        },

        Transition {
            from: "Show"
            to: "Opened"


            NumberAnimation {
                target: right_door
                property: "x"
                duration: 500
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: left_door
                property: "x"
                duration: 500
                easing.type: Easing.InOutQuad
            }

        }

    ]

    onStateChanged: if(window_container.state =="Show") {open.running = true}

    Timer {
        id:open
        running:false
        repeat:false
        interval: 2000
        onTriggered:window_container.state = "Opened"
    }


    Rectangle {
        id:left_door
        x:0
        width:parent.width / 2
        height:parent.height
        color:"green"

        Image {
            source:"graphics/wall_texture.png"
           anchors.fill:parent
        }

        Image {
            source:"graphics/logol.png"
            anchors.right:parent.right
            anchors.verticalCenter: parent.verticalCenter
            fillMode:Image.PreserveAspectFit
            height:parent.height /2
        }
    }

    Rectangle {
        id:right_door
        x:parent.width /2
        width:parent.width / 2
        height:parent.height
        color:"red"

        Image {
            source:"graphics/wall_texture.png"
            anchors.fill:parent
            mirror:true
        }


        Image {
            source:"graphics/logor.png"
            anchors.left:parent.left
            anchors.verticalCenter: parent.verticalCenter
            fillMode:Image.PreserveAspectFit
            height:parent.height /2
        }
    }

    Image {
        id:centerlogo
        source:"graphics/logo.png"
        anchors.left:parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode:Image.PreserveAspectFit
        height:parent.height /2
        rotation:ro

    }

    Timer {
        running:true
        repeat:true
        interval:60
        onTriggered:if(ro < 360) {ro = ro + 10}


    }

}


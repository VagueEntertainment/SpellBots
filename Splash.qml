import QtQuick 2.0

Item {
    id:window_container
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

    onStateChanged: if(window_container.state =="Show") {fadeout.running = true}

    Timer {
        id:fadeout
        running:false
        repeat:false
        interval: 1000
        onTriggered:window_container.state = "Hide"
    }


    Image {
        anchors.centerIn: parent
        width:parent.width * 1
        height:parent.height * 1
        fillMode:Image.PreserveAspectCrop
        source:"graphics/splash.png"

    }

}


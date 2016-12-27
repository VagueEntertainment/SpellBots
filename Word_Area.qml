import QtQuick 2.0
import "main.js" as Scripts

Item {

    id:window_container
    focus:if(window_container.state == "Show") {true} else {false}


    property int ro: 5
    property int mode: 0
    property string alphabet: "01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26"
    property int currentLetter:0


    Timer {
        id:combo
        running:false
        repeat:true
        interval:500
        onTriggered:if(currentLetter < word.length) {console.log("from combo "+ word.length)
                                                     Scripts.attack(word.split("")[currentLetter])
                                                     currentLetter = currentLetter + 1
                                                    } else {combo.running = "false",combo.stop(),word = ""
                                                                currentLetter = 0
                                                                    }
    }

    Keys.onPressed: {


                switch(event.key) {
                case 65: word = word+"A";break;
                case 66: word = word+"B";break;
                case 67: word = word+"C";break;
                case 68: word = word+"D";break;
                case 69: word = word+"E";break;
                case 70: word = word+"F";break;
                case 71: word = word+"G";break;
                case 72: word = word+"H";break;
                case 73: word = word+"I";break;
                case 74: word = word+"J";break;
                case 75: word = word+"K";break;
                case 76: word = word+"L";break;
                case 77: word = word+"M";break;
                case 78: word = word+"N";break;
                case 79: word = word+"O";break;
                case 80: word = word+"P";break;
                case 81: word = word+"Q";break;
                case 82: word = word+"R";break;
                case 83: word = word+"S";break;
                case 84: word = word+"T";break;
                case 85: word = word+"U";break;
                case 86: word = word+"V";break;
                case 87: word = word+"W";break;
                case 88: word = word+"X";break;
                case 89: word = word+"Y";break;
                case 90: word = word+"Z";break;


                case 16777220: if(mode == 1) {if(word.length == 1) {Scripts.attack(word),word = ""} else {combo.running = true} } ;break;
                case 16777219: word = word.slice(0,word.length-1);break;
                }

        }

    states: [

        State {
            name:"Show"

            PropertyChanges {
                target: window_container
                opacity: 1
                y:parent.height - textinput.height
            }


        },

        State {
            name:"Hide"

                PropertyChanges {
                    target:window_container
                    opacity:0
                    y:parent.height
                }
        },

        State {
            name:"Opened"

            PropertyChanges {
                target:window_container
           y:parent.height - parent.height * 0.28
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

            NumberAnimation {
                target: window_container
                property: "y"
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        },

        Transition {
            from: "Show"
            to: "Opened"
            reversible: true

            NumberAnimation {
                target: window_container
                property: "y"
                duration: 200
                easing.type: Easing.InOutQuad
            }

        }

    ]

    state:"Show"


  Rectangle {
      id:textinput
      width:(parent.width * 0.4)+ oskmode.width
      height:64
      radius:10
      x:parent.width * 0.02
      color:"lightgray"
      border.color:"gray"
        clip:true
      Row {
          id:letterrow
          //width:64 * word.length
          height:parent.height * 0.8
          spacing:5
          anchors.left:parent.left
          anchors.leftMargin: 10
          //anchors.horizontalCenter: parent.horizontalCenter
          anchors.verticalCenter: parent.verticalCenter
      Repeater {
          model:word.length

          Image {
              //anchors.centerIn: parent
              source: {switch(word.split("")[index]) {
                     case "A":"/graphics/letters/0001.png";break;
                     case "a":"/graphics/letters/0001.png";break;
                     case "B":"/graphics/letters/0002.png";break;
                     case "b":"/graphics/letters/0002.png";break;
                     case "C":"/graphics/letters/0003.png";break;
                     case "c":"/graphics/letters/0003.png";break;
                     case "D":"/graphics/letters/0004.png";break;
                     case "d":"/graphics/letters/0004.png";break;
                     case "E":"/graphics/letters/0005.png";break;
                     case "e":"/graphics/letters/0005.png";break;
                     case "F":"/graphics/letters/0006.png";break;
                     case "f":"/graphics/letters/0006.png";break;
                     case "G":"/graphics/letters/0007.png";break;
                     case "g":"/graphics/letters/0007.png";break;
                     case "H":"/graphics/letters/0008.png";break;
                     case "h":"/graphics/letters/0008.png";break;
                     case "I":"/graphics/letters/0009.png";break;
                     case "i":"/graphics/letters/0009.png";break;
                     case "J":"/graphics/letters/0010.png";break;
                     case "j":"/graphics/letters/0010.png";break;
                     case "K":"/graphics/letters/0011.png";break;
                     case "k":"/graphics/letters/0011.png";break;
                     case "L":"/graphics/letters/0012.png";break;
                     case "l":"/graphics/letters/0012.png";break;
                     case "M":"/graphics/letters/0013.png";break;
                     case "m":"/graphics/letters/0013.png";break;
                     case "N":"/graphics/letters/0014.png";break;
                     case "n":"/graphics/letters/0014.png";break;
                     case "O":"/graphics/letters/0015.png";break;
                     case "o":"/graphics/letters/0015.png";break;
                     case "P":"/graphics/letters/0016.png";break;
                     case "p":"/graphics/letters/0016.png";break;
                     case "Q":"/graphics/letters/0017.png";break;
                     case "q":"/graphics/letters/0017.png";break;
                     case "R":"/graphics/letters/0018.png";break;
                     case "r":"/graphics/letters/0018.png";break;
                     case "S":"/graphics/letters/0019.png";break;
                     case "s":"/graphics/letters/0019.png";break;
                     case "T":"/graphics/letters/0020.png";break;
                     case "t":"/graphics/letters/0020.png";break;
                     case "U":"/graphics/letters/0021.png";break;
                     case "u":"/graphics/letters/0021.png";break;
                     case "V":"/graphics/letters/0022.png";break;
                     case "v":"/graphics/letters/0022.png";break;
                     case "W":"/graphics/letters/0023.png";break;
                     case "w":"/graphics/letters/0023.png";break;
                     case "X":"/graphics/letters/0024.png";break;
                     case "x":"/graphics/letters/0024.png";break;
                     case "Y":"/graphics/letters/0025.png";break;
                     case "y":"/graphics/letters/0025.png";break;
                     case "Z":"/graphics/letters/0026.png";break;
                     case "z":"/graphics/letters/0026.png";break;
                     //default:console.log(word.split(""));break;
                     }
              }
              width:parent.height * 0.8
              height:parent.height * 0.8
              fillMode:Image.PreserveAspectFit
          }



      }
      }

      MouseArea {
          anchors.fill:parent
          onClicked: if(window_container.state == "Show") {window_container.state = "Opened"}
          onDoubleClicked: if(window_container.state == "Show") {window_container.state = "Opened"} else {window_container.state = "Show"}
      }

      Image {
          id:oskmode
          anchors.right:parent.right
          source:if(window_container.state == "Show") {"graphics/input-keyboard-symbolic.svg"} else {"graphics/revert.svg"}
          anchors.verticalCenter: parent.verticalCenter
          width:osk.height * 0.2
          height:osk.height * 0.2
          fillMode:Image.PreserveAspectFit

          MouseArea{
          anchors.fill:parent
          onClicked: if(window_container.state == "Show") {window_container.state = "Opened"} else {console.log(word),word = word.slice(0,word.length-1)}
            }
      }



  }

  Rectangle {
      id:attackbutton
      anchors.bottom:textinput.bottom
      anchors.right:parent.right
      anchors.rightMargin:parent.height * 0.01
      width:parent.height * 0.4
      height:parent.height * 0.2
      color:"darkred"

      Text {
          anchors.centerIn:parent
          text:"Attack"
          font.pixelSize: parent.height * 0.4
          color:"white"
      }

      MouseArea {
          anchors.fill:parent
          onClicked:if(word.length == 1) {Scripts.attack(word),word = ""} else {combo.running = true}
      }
  }

  Rectangle {
      anchors.top:textinput.bottom
      anchors.topMargin: -5
      width:parent.width
      height:parent.height
      radius:10
      color:"darkGray"

      GridView {
          id:osk
          anchors.horizontalCenter: parent.horizontalCenter
          width:parent.width * 0.9
          height:parent.height * 0.9
          cellHeight: parent.height * 0.4
          cellWidth: parent.height * 0.4
          y:parent.height * 0.05


          model: alphabet.split(",")


          delegate: Rectangle {
              color:"black"
              width:osk.cellWidth * 0.9
              height:osk.cellHeight * 0.9
              border.color:"white"
              radius:10

              Image {
                  anchors.centerIn: parent
                  source:"/graphics/letters/00"+modelData+".png"
                  width:parent.width * 0.9
                  height:parent.width * 0.9
                  fillMode:Image.PreserveAspectFit
              }

              MouseArea {
                  anchors.fill:parent
                  onClicked:parent.color ="gray",toletter(index)
                  onReleased:unclick.running = true
              }
              Timer {
                  id:unclick
                  running:false
                  repeat:false
                  interval: 200
                  onTriggered:parent.color ="black"

              }
          }

  }



}

  function toletter(letter) {


      switch(letter) {
                           case 0:word = word+"A";break;
                           case 1:word = word+"B";break;
                           case 2:word = word+"C";break;
                           case 3:word = word+"D";break;
                           case 4:word = word+"E";break;
                           case 5:word = word+"F";break;
                           case 6:word = word+"G";break;
                           case 7:word = word+"H";break;
                           case 8:word = word+"I";break;
                           case 9:word = word+"J";break;
                           case 10:word = word+"K";break;
                           case 11:word = word+"L";break;
                           case 12:word = word+"M";break;
                           case 13:word = word+"N";break;
                           case 14:word = word+"O";break;
                           case 15:word = word+"P";break;
                           case 16:word = word+"Q";break;
                           case 17:word = word+"R";break;
                           case 18:word = word+"S";break;
                           case 19:word = word+"T";break;
                           case 20:word = word+"U";break;
                           case 21:word = word+"V";break;
                           case 22:word = word+"W";break;
                           case 23:word = word+"X";break;
                           case 24:word = word+"Y";break;
                           case 25:word = word+"Z";break;

                           default:;break;

  }

  }


}


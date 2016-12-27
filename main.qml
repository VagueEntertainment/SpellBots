import QtQuick 2.3
import QtQuick.Window 2.2

import "main.js" as Scripts

import QtQuick.LocalStorage 2.0 as Sql

Window {
    visible: true

    width:Screen.width
    height:Screen.height


    property string word:""
    property string currentword:""
    property string currentspelling:""
    property string currentcorrect:""
    property string currentlist:""
    property string previouswords:""

    property int powermeter:0

    property int playermeter:0
   property int enemymeter:0

    property int ppunch:0
    property int ppunched:0
    property int epunch:0
    property int epunched:0

    property int mode:0

    property string pletters: "A:0,B:0,C:0,D:0,E:0,F:0,G:0,H:0,I:0,J:0,K:0,L:0,M:0,N:0,O:0,P:0,Q:0,R:0,S:0,T:0,U:0,V:0,W:0,X:0,Y:0,Z:0"
    property string eletters: "A:0,B:0,C:0,D:0,E:0,F:0,G:0,H:0,I:0,J:0,K:0,L:0,M:0,N:0,O:0,P:0,Q:0,R:0,S:0,T:0,U:0,V:0,W:0,X:0,Y:0,Z:0"


Timer {
    id:onLoad
    running:true
    repeat:false
    interval:1
    onTriggered: splash.state = "Show"


}


SBmenu {
    id:themenu

    width:parent.width
    height:parent.height
    state:"Show"

}

    Training {
        id:train
        width:parent.width
        height:parent.height


        state:"Hide"

    }

    Battle {
        id:arena
        width:parent.width
        height:parent.height
        state:"Hide"
    }

    Word_Area {
        id:words
        width:parent.width
        height:parent.height * 0.25
        state:"Hide"
    }

    Spelling_list {
        id:spelllist

        width:parent.width
        height:parent.height

        state:"Hide"
    }


    Trans {
        id:doors

        width:parent.width
        height:parent.height

        state:"Show"
    }

    Splash {
        id:splash

        width:parent.width
        height:parent.height

        state:"Hide"
    }

}


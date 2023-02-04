import QtQuick 2.12
import QtQuick.Window 2.12
import kunal 1.0
import kunal 2.0
import kunal 3.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Temperature{
        id: myclass
    }
    Netcheck{
        id: myclass1
    }
    Serial{
        id: myclass2
    }

    Text{
         id: label
         anchors{
             top: parent.top
             horizontalCenter: parent.horizontalCenter
             topMargin: 20
         }
         font.pixelSize: 12
         text: "CPU temperature: "+myclass.temp+" Celcius";
     }
    Text{
         id: label1
         anchors{
             top: parent.center
             horizontalCenter: parent.horizontalCenter
             topMargin: 20
         }
         font.pixelSize: 12
         text: "Internet Status: "+myclass1.net;
     }

}

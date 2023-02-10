import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {

    property int speed: 0

    height: 335 //TODO: Groesse skalierbar machen
    width: height
    x: (parent.width / 2) - (width / 2)
    y: (parent.height / 2) - (height / 2)

    Image {
         id: innerRingRect
         height: parent.height
         width: parent.width
         source: "/pics/Tacho_Mitte.png"


         Text {
             id: speeddigit
             text: speed
             font.pixelSize: 100
             font.bold: true
             font.family: "Eurostile"
             y: 60
             color: "white"
             anchors.horizontalCenter: parent.horizontalCenter
         }

         DropShadow {
                 anchors.fill: speeddigit
                 horizontalOffset: 0
                 verticalOffset: 8
                 radius: 4.0
                 samples: 16
                 color: "black"
                 source: speeddigit
             }

         Text {
             text: "mph"
             font.pixelSize: 40
             font.bold: true
             font.family: "Eurostile"
             y: 160
             color: "white"
             anchors.horizontalCenter: parent.horizontalCenter
         }

    }
}

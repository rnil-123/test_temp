import QtQuick 2.0
import QtGraphicalEffects 1.0
import kunal 1.0

Rectangle {
    id: container
    width: parent.width
    height: parent.height
    color: "black"

    property int seconds
    property int tenseconds
    property int minutes

//    Image {
//        id: oncall
//        anchors.verticalCenter: parent.verticalCenter
//        x: (parent.width - 250) - width/2
//        fillMode: Image.PreserveAspectFit
//        source: "/pics/call.png"
//        height: 100
//        width: 100
//        scale:1

//        Text {
//            id:callTime
//            y: 150; x: 45
//            scale: 2
//            font.family: "Eurostile"; color: "white"; font.pixelSize: 11
//            text: minutes + ":" + tenseconds + seconds
//        }
//    }

//    Image {
//        id: disconnected
//        anchors.verticalCenter: parent.verticalCenter
//        x: (parent.width - 250) - width/2
//        fillMode: Image.PreserveAspectFit
//        source: "/pics/call-disconnected.jpeg"
//        height: 100
//        width: 100
//        scale: 0


//        Text {
//            y: 150; x: 45
//            scale: 2
//            font.family: "Eurostile"; color: "white"; font.pixelSize: 11
//            text: "Call Disconnected"
//        }
//    }


//        Keys.onPressed: {
//                 if (event.key == Qt.Key_Shift) {
//                     console.log('shift key pressed')
//                     oncall.opacity = 0
//                     disconnected.opacity = 1
//                 }
//        }
//        Keys.onReleased: {
//                if (event.key == Qt.Key_Shift) {
//                    oncall.opacity = 1
//                    disconnected.opacity = 0
//                }}

//rnil-123 pass:escorts123*
//    Timer {
//        //update Calltime, calculate 60 seconds into 1 minute etc.
//           interval: 1000; running: true; repeat: true
//           onTriggered: {seconds++;

//           if(seconds == 10){
//               tenseconds += 1
//               seconds = 0
//           }
//           if(seconds == 0 && tenseconds==6){
//               minutes += 1
//               seconds = 0
//               tenseconds = 0
//           }
//           }
//       }

    Temperature{
        id: myclass
    }

    Image {
            id: temp
            anchors.verticalCenter: parent.verticalCenter
            x: 300
            y: -40
            source: "/pics/temp.png"
            height: 100
            width: 100
            scale:1

            Text {
                y: 150
                x: 40
                scale: 2
                font.family: "Eurostile"; color: "white"; font.pixelSize: 11
                text: myclass.temp + " C"
            }
        }

}


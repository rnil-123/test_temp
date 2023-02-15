import QtQuick 2.4
import QtGraphicalEffects 1.0
import kunal 2.0

Rectangle {
    color: "transparent"

    property int seconds
    property int tenseconds
    property int minutes

    Netcheck{
        id: myclass1
    }


    Image {
        id: i1
        x: -235
        y: 210
        height: 90
        width: height
        source: "/pics/arrow.png"
        opacity:0

    }


    Image {
        id: i2
        x: -235
        y: 210
        height: 90
        width: height
        source: "/pics/arrow.png"
        rotation: 180
        opacity: 0
    }

    Image {
        id: i3
        x: -235
        y: 210
        height: 90
        width: height
        source: "/pics/arrow.png"
        rotation: 270
        opacity:0

    }

    Image {
        id: i4
        x: -235
        y: 210
        height: 90
        width: height
        source: "/pics/arrow.png"
        rotation: 90
        opacity:0

    }

//    Image {
//        id: oncall
//        anchors.verticalCenter: parent.verticalCenter
//        x: 700
//        y: 60
//        fillMode: Image.PreserveAspectFit
//        source: "/pics/call.png"
//        height: 100
//        width: 100
//        opacity: 1

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
//        x: 700
//        y: 60
//        fillMode: Image.PreserveAspectFit
//        source: "/pics/call-disconnected.jpeg"
//        height: 100
//        width: 100
//        opacity: 0


//        Text {
//            scale: 2
//            y: 150; x: 45
//            font.family: "Eurostile"; color: "white"; font.pixelSize: 11
//            text: "Call Disconnected"
//        }
//    }


    Image {
            id: wifi
            anchors.verticalCenter: parent.verticalCenter
            x: 700
            fillMode: Image.PreserveAspectFit
            source: "/pics/wifi.png"
            height: 100
            width: 100
            opacity: if (myclass1.net == 'Connected')
                        {wifi.opacity= 1}
                     else
                        {wifi.opacity = 0.5}



        }

    Text {
        scale: 2
        y:350
        x:700
        font.family: "Eurostile"; color: "white"; font.pixelSize: 11
        text: myclass1.net
    }


              SpeedNeedle {
                  id: speedoNeedle

                       anchors.verticalCenterOffset: 0
                       anchors.centerIn: parent

                       focus: true
                       Keys.onPressed: {
                                if (event.key == Qt.Key_Space && !event.isAutoRepeat) {

                                    if(fuelBar.value > 0){
                                        speedoNeedle.value = 100
                                        kWNeedle.value = 0
                                        timer.running = true
                                        drive()
                                    } else {
                                        speedoNeedle.value = 0
                                        kWNeedle.value = 100
                                    }

                                }

                                else if  (event.key == Qt.Key_Shift && !event.isAutoRepeat) {
                                   console.log('shift pressed')
                                    oncall.opacity = 0
                                    disconnected.opacity = 1
                               }

                                else if  (event.key == Qt.Key_Up && !event.isAutoRepeat) {
                                   console.log('arrow pressed')
                                    i1.opacity=0
                                     i2.opacity=1
                               }
                                else if  (event.key == Qt.Key_Down && !event.isAutoRepeat) {
                                   console.log('arrow pressed')
                                    i1.opacity=1
                                     i2.opacity=0
                               }

                                else if  (event.key == Qt.Key_Right && !event.isAutoRepeat) {
                                   console.log('arrow pressed')
                                    i3.opacity=1

                               }

                                else if  (event.key == Qt.Key_Left && !event.isAutoRepeat) {
                                   console.log('arrow pressed')
                                    i4.opacity=1

                               }
                       }
                       Keys.onReleased: {
                               if (event.key == Qt.Key_Space && !event.isAutoRepeat) {
                                   speedoNeedle.value = 0
                                   timer.running = false
                                   kWNeedle.value = 100
                               }
                              if (event.key == Qt.Key_Shift && !event.isAutoRepeat) {
                                  oncall.opacity = 1
                                 disconnected.opacity = 0
                             }

                              if (event.key == Qt.Key_Down && !event.isAutoRepeat) {
                                  i1.opacity = 0
                                  i2.opacity = 0
                             }

                              if (event.key == Qt.Key_Up && !event.isAutoRepeat) {
                                  i1.opacity = 0
                                  i2.opacity = 0
                             }

                              if (event.key == Qt.Key_Right && !event.isAutoRepeat) {
                                  i3.opacity = 0

                             }

                              if (event.key == Qt.Key_Left && !event.isAutoRepeat) {
                                  i4.opacity = 0

                             }

                       }}

              KWNeedle {
                  id: kWNeedle
                  anchors.verticalCenterOffset: 0
                  anchors.centerIn: parent
                  value: 100
              }


              InnerRing    {
                id: innerring
                speed: (Math.round(speedoNeedle.currentValue, 0) + 360) * 0.68
              }

              //Letter: P R N D
              Grid {
                  anchors.horizontalCenter: parent.horizontalCenter
                  y: parent.height - 65
                  columns: 4
                   Rectangle { color: "transparent"; width: 25; height: 25
                      Text {
                          id: letterP
                          text: " P "
                           font.family: "Eurostile"; font.pixelSize: 36
                          color: "white"
                          anchors.centerIn: parent
                      } }
                    Rectangle { color: "transparent"; width: 25; height: 25
                      Text {
                          text: " R "
                           font.family: "Eurostile"; font.pixelSize: 18
                          color: "darkgray"
                          anchors.centerIn: parent
                      }}
                    Rectangle { color: "transparent"; width: 25; height: 25
                          Text {
                              text: " N "
                               font.family: "Eurostile"; font.pixelSize: 18
                              color: "darkgray"
                              anchors.centerIn: parent
                          }}
                    Rectangle { color: "transparent"; width: 25; height: 25
                      Text {
                          id: letterD
                          text: " D "
                          font.family: "Eurostile"; font.pixelSize: 18
                          color: "darkgray"
                          anchors.centerIn: parent
                      }}
              }

              function drive() {
                  letterD.font.bold = true
                  letterD.color = "white"
                  letterD.font.pixelSize = 36
                  letterP.font.bold = false
                  letterP.color = "darkgray"
                  letterP.font.pixelSize = 18
              }

              Timer {
                  //update Calltime, calculate 60 seconds into 1 minute etc.
                     interval: 1000; running: true; repeat: true
                     onTriggered: {seconds++;

                     if(seconds == 10){
                         tenseconds += 1
                         seconds = 0
                     }
                     if(seconds == 0 && tenseconds==6){
                         minutes += 1
                         seconds = 0
                         tenseconds = 0
                     }
                     }
                 }


 }




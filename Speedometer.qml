import QtQuick 2.4
import QtGraphicalEffects 1.0


Rectangle {
    color: "transparent"

    property int seconds
    property int tenseconds
    property int minutes

// navigation arrow
    Image {
        id: i1
        x: -235
        y: 210
        height: 90
        width: height
        source: "/pics/arrow.png"
        opacity:0

    }

            // key pressed logics
              SpeedNeedle {
                  id: speedoNeedle

                       anchors.verticalCenterOffset: 0
                       anchors.centerIn: parent

                       focus: true
                       Keys.onPressed: {
                                if (event.key == Qt.Key_Space && !event.isAutoRepeat) {

                                    if(fuelBar.value > 0){
                                        //check fuelbar value to operate
                                        speedoNeedle.value = 100
                                        kWNeedle.value = 0
                                        timer.running = true
                                        drive()
                                    } else if (fuelBar.value == 0){
                                        speedoNeedle.value = 0
                                        timer.running = false
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
                                    i1.opacity=1
                                    i1.rotation=180
                               }
                                else if  (event.key == Qt.Key_Down && !event.isAutoRepeat) {
                                   console.log('arrow pressed')
                                    i1.opacity=1
                               }

                                else if  (event.key == Qt.Key_Right && !event.isAutoRepeat) {
                                   console.log('arrow pressed')
                                    i1.opacity=1
                                    i1.rotation=270

                               }

                                else if  (event.key == Qt.Key_Left && !event.isAutoRepeat) {
                                   console.log('arrow pressed')
                                    i1.opacity=1
                                    i1.rotation=90

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
                                  i1.rotation = 0
                             }

                              if (event.key == Qt.Key_Up && !event.isAutoRepeat) {
                                  i1.opacity = 0
                                  i1.rotation = 0
                             }

                              if (event.key == Qt.Key_Right && !event.isAutoRepeat) {
                                  i1.opacity = 0
                                  i1.rotation = 0
                             }

                              if (event.key == Qt.Key_Left && !event.isAutoRepeat) {
                                  i1.opacity = 0
                                  i1.rotation = 0

                             }

                       }}

              //rpm needle
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


 }




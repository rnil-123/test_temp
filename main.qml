import QtQuick 2.12
import QtQuick.Window 2.12
import kunal 1.0 //temp
import kunal 2.0 //net
import kunal 3.0 //serial
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Window {
    width: 1400
    height: 600
    visible: true
    color: "black"
    title: qsTr("Speedometer")

    LeftElement {
        y: 50
        width: parent.width / 2
        height: 450
    }

    RightElement {
        id: rightRect
        y: 50
        x: parent.width / 2
        width: parent.width / 2
        height: 475
    }


    QtObject {
       property var locale: Qt.locale()
       property date currentDate: new Date()
       property string dateString
       property string timeString

       Component.onCompleted: {
           dateString = currentDate.toLocaleDateString();
           timeString = currentDate.toLocaleTimeString();
       }
    }


    Image {
       width: parent.width
       height: parent.height
       source: "/pics/Background.png"
    }


    //date and time
    Rectangle {
    y: parent.height - 90
    height: 200
    width: parent.width
    color: "transparent"

        RowLayout {
            y: 50
            x: 950
            Text {
                text: new Date().toLocaleDateString(Qt.locale(),"ddd") //ddd MMM d //h:mm AP
                font.pixelSize: 20
                font.bold: true
                color: "white"
            }
            Text {
                text: new Date().toLocaleDateString(Qt.locale(),"MMM d") //ddd MMM d //h:mm AP
                font.pixelSize: 20
                font.bold: false
                color: "darkgray"
            }
        }

        RowLayout {
            y: 50
            x: 1100
            Text {
                text: new Date().toLocaleTimeString(Qt.locale(),"h:mm") //ddd MMM d //h:mm AP
                font.pixelSize: 20
                font.bold: false
                color: "darkgray"
            }
            Text {
                text: new Date().toLocaleTimeString(Qt.locale(),"AP") //ddd MMM d //h:mm AP
                font.pixelSize: 20
                font.bold: true
                color: "white"
            }
        }
    }

    //Tacho
    Image {
       height: parent.height
       width: height
       x: (parent.width / 2) - (width / 2)
       scale: 1.14
       source: "/pics/Tacho.png"
       fillMode: Image.PreserveAspectFit
    }

    Speedometer {
    height: 525
    width: height
    x: (parent.width / 2) - (width / 2)
    y: (parent.height / 2) - (height / 2)
    }



    Timer {
        // timer for fuel bar progress
            id: timer
            interval: 1000
            running: false
            repeat: true
            onTriggered: {
                if (fuelBar.value <= 1)
                    fuelBar.value -= 0.1
                else
                    fuelBar.value = 1
            }
        }

    ProgressBar{
        //fuel
        id: fuelBar
        x: (parent.width / 2) - (width / 2)
        y: 350
        value: 1
    }


    Button{
        //fuel refill
        x: (parent.width / 2) - (width / 2)
        y: 390
        width: 50
        height: 30
        text: "Fuel"
        onClicked: fuelBar.value = 1
    }



}

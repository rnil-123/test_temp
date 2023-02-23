import QtQuick 2.0
import QtGraphicalEffects 1.0
import kunal 1.0 //temp
import kunal 2.0 //netcheck

Rectangle {
    //elements to the right of taco

    id: container
    width: parent.width
    height: parent.height
    color: "black"

    property int seconds
    property int tenseconds
    property int minutes

    //system temperature check
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


        }
    Text {
        scale: 2
        y:340
        x:340
        font.family: "Eurostile"; color: "white"; font.pixelSize: 11
        text: myclass.temp + "C"
    }


    //system connection check
    Netcheck{
        id: myclass1
    }

    Image {
            id: wifi
            anchors.verticalCenter: parent.verticalCenter
            x: 500
            y: -40
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
        y:340
        x:500
        font.family: "Eurostile"; color: "white"; font.pixelSize: 11
        text: myclass1.net
    }
}


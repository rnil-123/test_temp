import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    //elements to the left of the tacho

    id: container
    width: parent.width
    height: parent.height
    color: "black"

    Rectangle {
        id: appWindow
        width: parent.width
        height: parent.height + 20
        color: "black"
        y: parent.height + 20
        Image {
            id: appWindowImage
            anchors.verticalCenter: parent.verticalCenter
            x: (parent.width - 250) / 2 - width /2
            fillMode: Image.PreserveAspectFit
            scale: 1.2
        }
    }


    Image {
        id: battery
        x: 190//
        y: 94
        height: 90
        width: height
       source: "/pics/battery-full.webp"
       rotation: 90
       Text{
           rotation: -90
           id:perc
           y: 100; x: 35
           scale: 2
           font.family: "Eurostile"; color: "green"; font.pixelSize: 11
            text: "90%"
       }
    }


    Image {
        id: i1
        x: 40//
        y: 194
        height: 120
        width: height
       source: "/pics/arrow-down-solid.svg"
       opacity:0
    }


    Image {
        id: i2
        x: 40//
        y: 194
        height: 120
        width: height
       source: "/pics/arrow-up-solid.svg"
       opacity: 0
    }


    property int pathMargin: 470

        PathView {
         id: menu
         width: 640
         height: -80




         path: Path {
          startX: 250
          startY: 600//pathMargin

            PathLine { x: 250; y: menu.height - pathMargin }
         }

         focus: false
    }

}


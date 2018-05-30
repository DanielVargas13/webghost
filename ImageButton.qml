import QtQuick 2.0

Image {
    id: back
    property alias mouseArea: mouseAreaI
    MouseArea {
        id: mouseAreaI
        hoverEnabled: true
        anchors.fill: parent
        onHoveredChanged: {
            if (containsMouse) {
                background.color = "#88d3d3d3"
            }
            else {
                background.color = "transparent"
            }
        }
    }
    Rectangle {
        z: -1
        id: background
        color: "transparent"
        anchors.fill: parent
        radius: 5
    }
}

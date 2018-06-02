import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 1.4
import QtWebEngine 1.0
import QtQuick.Dialogs 1.2


ApplicationWindow {
    width: 1024
    height: 750
    visible: true

    property int buttonSize: 20
    property bool playing: false
    property bool recording: false
    objectName: "mainWindow"

    Rectangle {
        id: toolbar
        height: buttonSize+15
        width: parent.width
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightgray" }
            GradientStop { position: 1.0; color: "gray" }
        }

        ImageButton {
            id: back
            enabled: webview.canGoBack
            width: buttonSize
            height: buttonSize
            x: 10
            source: "qrc:/img/baseline_arrow_back_black_18dp.png"
            anchors.verticalCenter: parent.verticalCenter
            mouseArea.onClicked: {
                webview.goBack()
            }
        }

        ImageButton {
            id: forward
            enabled: webview.canGoForward
            width: buttonSize
            height: buttonSize
            x: buttonSize+20
            source: "qrc:/img/baseline_arrow_forward_black_18dp.png"
            anchors.verticalCenter: parent.verticalCenter
            mouseArea.onClicked: {
                webview.goForward()
            }
        }

        ImageButton {
            id: reload
            width: buttonSize
            height: buttonSize
            x: buttonSize*2+30
            source: "qrc:/img/baseline_refresh_black_18dp.png"
            anchors.verticalCenter: parent.verticalCenter
            mouseArea.onClicked: {
                webview.reload()
            }
        }

        TextInput {
            id: textInput
            clip: true
            height: buttonSize
            anchors.left: reload.right
            anchors.right: playPause.left
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            text: "http://www.google.com"
            antialiasing: false
            cursorVisible: true
            font.pixelSize: 16
            selectByMouse: true
            anchors.verticalCenter: parent.verticalCenter
            onEditingFinished: {
                if (text == "")
                    return

                if (webview.url.toString() != text) {
                    if (text.search("://") == -1) {
                        text = "http://"+text
                    }

                    webview.url = text
                }
            }
            Component.onCompleted: {
                webview.url = text
            }
            Rectangle {
                z: -1
                color: "white"
                radius: 2
                border.color: "black"
                anchors.fill: parent
            }
        }

        ImageButton {
            id: playPause
            width: buttonSize
            height: buttonSize
            anchors.right: parent.right
            anchors.rightMargin: 10
            source: "qrc:/img/baseline_play_arrow_black_18dp.png"
            anchors.verticalCenter: parent.verticalCenter
            mouseArea.onClicked: {
                webview.url = textInput.text
            }
        }
    }

    WebEngineView {
        id: webview
        objectName: "QWebview"
        anchors.fill: parent
        anchors.topMargin: toolbar.height
        onUrlChanged: textInput.text = url.toString()
    }

    menuBar: MenuBar {
        Menu {
            title: "&File"
            MenuItem {
                text: "E&xit"
                onTriggered: Qt.quit()
            }
        }

        Menu {
            title: "&Test"

            MenuItem {
                text: "&Record"
                enabled: !recording
                onTriggered: {
                    recording = true
                    ghost.startRecording()
                }
            }

            MenuItem {
                text: "&Stop Recording"
                enabled: recording
                onTriggered: {
                    recording = false
                    ghost.stopRecording()
                }
            }

            MenuSeparator { }

            MenuItem {
                text: "&Play"
                onTriggered: ghost.play()
            }
        }

        Menu {
            title: "&Help"

            MenuItem {
                text: "&About"
                shortcut: "F1"
                onTriggered: aboutbox.visible = true
            }
        }
    }

    Dialog {
        id: aboutbox
        visible: false
        title: "About"

        contentItem: Rectangle {
            implicitWidth: 430
            implicitHeight: 100
            Column {
                anchors.fill: parent
                anchors.topMargin: 10
                anchors.leftMargin: 10
                spacing: 5
                Text {
                    text: Qt.application.name+" "+Qt.application.version+"\n"+Qt.application.organization
                    font.pointSize: 12
                }
                Text {
                    text: Qt.application.domain
                    font.pointSize: 10
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.color = "blue"
                        onExited: parent.color = "black"
                        onClicked: {
                            webview.url = parent.text
                            aboutbox.close()
                        }
                    }
                }
            }
            Image {
                width: 64
                height: 64
                anchors.right: parent.right
                anchors.rightMargin: 5
                source: "qrc:/img/icon.png"
            }
        }
    }
}

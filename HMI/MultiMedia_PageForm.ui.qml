import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.9
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.3
import QtGraphicalEffects 1.0
import QtDataVisualization 1.0

Rectangle {

    id: player
    property alias fileDialog: fileDialog
    property alias mediaplayer: mediaplayer
    property alias fileManager_stop: fileManager_stop
    property alias fileManager_play: fileManager_play
    property alias fileManager_pause: fileManager_pause
    property alias durationMedia: durationMedia
    property alias videoOutput: videoOutput
    property alias placeholder_music: placeholder_music
    property alias track_name: track_name

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: "file:///D:\Musica"
        Component.onCompleted: visible = false
    }
    MainMenu_Button {
        id: fileManager_button
        width: 99
        text: qsTr("Search a File")
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        onClicked: fileDialog.visible = true
    }

    TextField {
        id: textField
        y: 20
        height: 40
        text: fileDialog.fileUrl
        anchors.right: fileManager_play.left
        anchors.rightMargin: 10
        anchors.left: fileManager_button.right
        anchors.leftMargin: 10
    }

    MediaPlayer {
        id: mediaplayer
        //autoLoad: true
        //autoPlay: true
        volume: 1.0
        source: fileDialog.fileUrl
        //source: "big_buck_bunny.mp4"
    }

    VideoOutput {
        id: videoOutput
        x: 22
        width: 600
        autoOrientation: true
        anchors.bottom: progressBar.top
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: fileManager_button.bottom
        anchors.topMargin: 10
        //fillMode: VideoOutput.PreserveAspectFit
        source: mediaplayer
        visible: false
    }

    MainMenu_Button {
        id: fileManager_play
        y: 20
        width: 50
        text: qsTr("Play")
        anchors.right: fileManager_pause.left
        anchors.rightMargin: 10
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    }

    MainMenu_Button {
        id: fileManager_stop
        x: -8
        y: 20
        width: 50
        text: qsTr("Stop")
        anchors.right: parent.right
        anchors.rightMargin: 10
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    }

    MainMenu_Button {
        id: fileManager_pause
        x: -15
        y: 20
        width: 50
        text: qsTr("Pause")
        anchors.right: fileManager_stop.left
        anchors.rightMargin: 10
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    }

    ProgressBar {
        id: progressBar
        x: 10
        y: 466
        height: 8
        anchors.right: durationMedia.left
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 7
        from: 0
        to: mediaplayer.duration
        value: mediaplayer.position
        indeterminate: (mediaplayer.duration == 0) ? true : false
    }

    Text {
        id: durationMedia
        x: 562
        y: 460
        height: 8
        color: "#ffffff"
        text: qsTr(Math.floor(mediaplayer.position/3600000) + ":" +
                   Math.floor((mediaplayer.position-(Math.floor(mediaplayer.position/3600000)*3600000))/60000)+ ":" +
                   Math.floor((Math.floor((mediaplayer.position-(Math.floor(mediaplayer.position/60000)*60000))/1000))%60)
                   + "||" +
                   Math.floor(mediaplayer.duration/3600000) + ":" +
                   Math.floor((mediaplayer.duration-(Math.floor(mediaplayer.duration/3600000)*3600000))/60000)+ ":" +
                   Math.floor((Math.floor((mediaplayer.duration-(Math.floor(mediaplayer.duration/60000)*60000))/1000))%60))
        styleColor: "#ee3f3f"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }

    Image {
        id: placeholder_music
        fillMode: Image.PreserveAspectFit
        visible: false
        anchors.rightMargin: 200
        anchors.leftMargin: 200
        anchors.bottomMargin: 150
        anchors.topMargin: 150
        anchors.fill: parent
        source: "placeholder_music.jpg"
    }

    Text {
        id: track_name
        x: 200
        width: 240
        height: 14
        text: qsTr("")
        horizontalAlignment: Text.AlignHCenter
        anchors.top: placeholder_music.bottom
        anchors.topMargin: 20
        font.pixelSize: 12
    }
}

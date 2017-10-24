import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.9
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.3
import QtDataVisualization 1.0
import QtQuick.Controls.Material 2.2

Rectangle {

    id: player
    width: 900
    property alias coverArt_image: coverArt_image
    property alias coverArt_animatedimage: coverArt_animatedimage
    property alias placeholder_image: placeholder_image
    property alias fileDialog: fileDialog
    property alias mediaplayer: mediaplayer
    property alias fileManager_stop: fileManager_stop
    property alias fileManager_play: fileManager_play
    property alias fileManager_pause: fileManager_pause
    property alias durationMedia: durationMedia
    property alias videoOutput: videoOutput
    property alias track_name: track_name
    property alias textField: textField
    property alias info_name: info_name
    property alias album_name: album_name

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: "file:///D:\Musica"
        Component.onCompleted: visible = false
        nameFilters: [ "Audio-Video files (*.avi *.mp4 *.mp3 *m4a)", "All files (*)" ]
    }
    MainMenu_Button {
        id: fileManager_button
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
        anchors.rightMargin: 50
        anchors.left: fileManager_button.right
        anchors.leftMargin: 10
        readOnly: true
    }

    MediaPlayer {
        id: mediaplayer
        volume: 1.0
        source: fileDialog.fileUrl
        autoLoad: true
    }

    VideoOutput {
        id: videoOutput
        x: 22
        width: 600
        autoOrientation: true
        anchors.bottom: progressBar.top
        anchors.bottomMargin: 9
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: fileManager_button.bottom
        anchors.topMargin: 11
        source: mediaplayer
        visible: false
    }

    MainMenu_Button {
        id: fileManager_play
        x: 676
        y: 20
        width: 60
        text: qsTr("Play")
        anchors.right: fileManager_pause.left
        anchors.rightMargin: 10
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    }

    MainMenu_Button {
        id: fileManager_stop
        x: 830
        y: 20
        width: 60
        text: qsTr("Stop")
        anchors.right: parent.right
        anchors.rightMargin: 10
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    }

    MainMenu_Button {
        id: fileManager_pause
        x: 758
        y: 20
        width: 60
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
        text: qsTr(
                  Math.floor(mediaplayer.position / 3600000) + ":"
                  + Math.floor((mediaplayer.position - (Math.floor(mediaplayer.position / 3600000) * 3600000)) / 60000) + ":"
                  + Math.floor((Math.floor((mediaplayer.position - (Math.floor(mediaplayer.position / 60000) * 60000)) / 1000)) % 60) + "||"
                  + Math.floor(mediaplayer.duration / 3600000) + ":" + Math.floor((mediaplayer.duration - (Math.floor(mediaplayer.duration / 3600000) * 3600000)) / 60000)
                  + ":" + Math.floor((Math.floor((mediaplayer.duration - (Math.floor(mediaplayer.duration / 60000) * 60000)) / 1000)) % 60))
        styleColor: "#ee3f3f"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }

    Image{
        id: coverArt_image
        width: 300
        height: 300
        fillMode: Image.PreserveAspectFit
        visible: false
        anchors.rightMargin: 70
        anchors.leftMargin: 70
        anchors.bottomMargin: 70
        anchors.topMargin: 100
        anchors.fill: parent
        cache: false
    }

    AnimatedImage{
        id: coverArt_animatedimage
        width: 300
        height: 300
        source: "Picture/placeholder_audio.gif"
        fillMode: Image.PreserveAspectFit
        visible: false
        anchors.rightMargin: 70
        anchors.leftMargin: 70
        anchors.bottomMargin: 70
        anchors.topMargin: 100
        anchors.fill: parent
        cache: false
    }

    Image{
        id: placeholder_image
        width: 300
        height: 300
        source: "Picture/placeholder_music.jpg"
        fillMode: Image.PreserveAspectFit
        visible: true
        anchors.rightMargin: 70
        anchors.leftMargin: 70
        anchors.bottomMargin: 70
        anchors.topMargin: 100
        anchors.fill: parent
        cache: false
    }


    Pane {
        id: info_name
        y: 113
        width: 240
        height: 30
        visible: false
        Material.elevation: 10
        anchors.left: parent.left
        anchors.leftMargin: 20
        font.pixelSize: 12
        Material.background: Material.DeepPurple

        Text {
            id: track_name
            x: -12
            y: -12
            width: 235
            height: 14
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            anchors.left: parent.left
            anchors.leftMargin: -7
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
        }

        Text {
            id: album_name
            y: 4
            width: 235
            height: 14
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.left: parent.left
            anchors.leftMargin: -7
            font.pixelSize: 12
        }
    }
}

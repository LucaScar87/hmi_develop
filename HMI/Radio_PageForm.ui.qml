import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.9

Rectangle {
    id: radio_page

    property alias radio: radio
    property alias freqUpButton: freqUpButton
    property alias freqDownButton: freqDownButton
    property alias scanUpButton: scanUpButton
    property alias scanDownButton: scanDownButton
    property alias freqline: freqline
    property alias freqText: freqText
    property alias signalText: signalText

    Radio {
        id: radio
        band: Radio.FM
    }

    Text {
        id: freqText
        x: 217
        y: 135

        verticalAlignment: Text.AlignVCenter
        text: radio.frequency / 1000 + " kHz"
        anchors.verticalCenterOffset: -61
        anchors.horizontalCenterOffset: -83
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: signalText
        x: 268
        y: 149
        width: 90
        height: 13
        text: (radio.availability
               == Radio.Available ? radio.radioData.stationName : "No Radio Found")
        anchors.verticalCenterOffset: -61
        anchors.horizontalCenterOffset: 58
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle {
        id: freqline
        x: 217
        y: 181
        width: 206
        height: 10
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -31
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            width: 5
            height: 10
            color: "red"

            y: 0
            x: (freqline.width - 5) * ((radio.frequency - radio.minimumFrequency)
                                       / (radio.maximumFrequency - radio.minimumFrequency))
        }
    }

    MainMenu_Button {
        id: scanUpButton
        x: 217
        y: 328
        width: 100
        height: 40
        text: qsTr("Scan Up")
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: -53
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        onClicked: radio.scanUp
    }
    MainMenu_Button {
        id: scanDownButton
        x: 212
        y: 180
        width: 100
        height: 40
        text: qsTr("Scan Down")
        anchors.horizontalCenterOffset: -53
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 46
        anchors.verticalCenter: parent.verticalCenter
        onClicked: radio.scanDown
    }
    MainMenu_Button {
        id: freqUpButton
        x: 323
        y: 194
        width: 100
        height: 40
        text: qsTr("Freq Up")
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 53
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        onClicked: radio.tuneUp
    }
    MainMenu_Button {
        id: freqDownButton
        x: 184
        y: 243
        width: 100
        height: 40
        text: qsTr("Freq Down")
        anchors.horizontalCenterOffset: 53
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 46
        anchors.verticalCenter: parent.verticalCenter
        onClicked: radio.tuneDown
    }
}

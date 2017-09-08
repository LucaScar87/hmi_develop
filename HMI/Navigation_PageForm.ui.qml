import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtWebView 1.1

Rectangle {
    id: navigation_page

    //    property alias upButton: buttonUp
    //    property alias leftButton: buttonLeft
    //    property alias rightButton: buttonRight
    //    property alias downButton: buttonDown
    property alias naviMap: naviMap

    //    Button {
    //        id: buttonUp
    //        text: qsTr("Up")
    //        anchors.right: parent.horizontalCenter
    //        anchors.rightMargin: -55
    //        anchors.left: parent.horizontalCenter
    //        anchors.leftMargin: -45
    //        anchors.top: parent.top
    //        anchors.topMargin: 307
    //        checkable: true
    //    }
    //    Button {
    //        id: buttonLeft
    //        text: qsTr("Left")
    //        anchors.left: parent.horizontalCenter
    //        anchors.leftMargin: -99
    //        anchors.top: buttonUp.verticalCenter
    //        anchors.topMargin: 25
    //    }
    //    Button {
    //        id: buttonRight
    //        x: 325
    //        text: qsTr("Right")
    //        anchors.right: parent.horizontalCenter
    //        anchors.rightMargin: -105
    //        anchors.top: buttonUp.verticalCenter
    //        anchors.topMargin: 25
    //    }
    //    Button {
    //        id: buttonDown
    //        text: qsTr("Down")
    //        anchors.right: parent.horizontalCenter
    //        anchors.rightMargin: -55
    //        anchors.left: parent.horizontalCenter
    //        anchors.leftMargin: -45
    //        anchors.top: buttonLeft.bottom
    //        anchors.topMargin: 4
    //    }
    WebView {
        id: naviMap
        height: 600
        url: "https://www.google.it/maps"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        //url: "/map.html"
    }
}

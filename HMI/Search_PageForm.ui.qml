import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtWebView 1.1

Rectangle {
    id: page_search_item
    property alias search_button: search_button
    property alias search_text_field: search_text_field
    property alias searchResults: webView

    Custom_TextField {
        id: search_text_field
        x: 115
        anchors.horizontalCenterOffset: -50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        Layout.fillHeight: false
        horizontalAlignment: Text.AlignHCenter
        Layout.fillWidth: false
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        placeholderText: qsTr("What do you want to search?")
    }

    WebView {
        id: webView
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.top: search_text_field.bottom
        anchors.topMargin: 20
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        url: "https://www.google.it"
    }

    MainMenu_Button {
        id: search_button
        width: 110
        text: qsTr("Search on Google")
        anchors.top: parent.top
        anchors.topMargin: 20
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        anchors.left: search_text_field.right
        anchors.leftMargin: 10
    }
}

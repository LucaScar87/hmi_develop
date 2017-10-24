import QtQuick 2.4

Rectangle {

    id: settings_page
    property alias button_to_change_hmi_color: button_to_change_hmi_color
    property alias settings_page: settings_page

    MainMenu_Button {
        id: button_to_change_hmi_color
        text: "Change HMI color"
        focus: false
        flat: false
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
    }
}

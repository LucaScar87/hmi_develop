import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("HMI" + utilts_plugin.totalPrice)

    property alias gradient_general: gradient_general
    property alias gradient_stop: gradient_stop

    Drawer {
        id: lateral_menu
        width: 100
        height: window.height

        ListView {
            id: listView
            x: 41
            y: 125
            width: 100
            height: 241
            clip: true
            anchors.fill: parent
            delegate: ItemDelegate {
                text: modelData
                highlighted: ListView.isCurrentItem
                onClicked: ListView.currentIndex = index
            }
        }
        MainMenu_Button {
            id: button_to_search_page
            x: 41
            y: 125
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            text: qsTr("Search")
            onClicked: swipeView.setCurrentIndex(0);
        }
        MainMenu_Button {
            id: button_to_navigation_page
            x: 41
            anchors.left: parent.left
            anchors.right: parent.right
            text: qsTr("Navigation")
            anchors.leftMargin: 0
            anchors.top: button_to_search_page.bottom
            anchors.topMargin: 1
            onClicked: swipeView.setCurrentIndex(1);
        }
        MainMenu_Button {
            id: button_to_radio_page
            x: 41
            anchors.left: parent.left
            anchors.right: parent.right
            text: qsTr("Radio")
            anchors.leftMargin: 0
            anchors.top: button_to_navigation_page.bottom
            anchors.topMargin: 1
            onClicked: swipeView.setCurrentIndex(2);
        }
        MainMenu_Button {
            id: button_to_media_page
            x: 41
            anchors.left: parent.left
            anchors.right: parent.right
            text: qsTr("Media")
            anchors.leftMargin: 0
            anchors.top: button_to_radio_page.bottom
            anchors.topMargin: 1
            onClicked: swipeView.setCurrentIndex(3);
        }
        MainMenu_Button {
            id: button_to_settings_page
            x: 41
            anchors.left: parent.left
            anchors.right: parent.right
            text: qsTr("Settings")
            anchors.leftMargin: 0
            anchors.top: button_to_media_page.bottom
            anchors.topMargin: 1
            onClicked: swipeView.setCurrentIndex(4);
        }
    }

    Gradient {
        id: gradient_general
        GradientStop {
            id: gradient_stop
            position: 0
            color: "#547ff0"
        }

        GradientStop {
            position: 1
            color: "#000000"
        }
    }


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Search_Page {
            gradient: gradient_general
        }

        Navigation_Page {
            gradient: gradient_general
        }

        Radio_Page {
            gradient: gradient_general
        }

        MultiMedia_Page {
            gradient: gradient_general
        }

        Settings_Page {
            gradient: gradient_general
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            id: first_tabButton
            text: qsTr("Search")
        }
        TabButton {
            id: second_tabButton
            text: qsTr("Navigation")
        }
        TabButton {
            id: third_tabButton
            text: qsTr("Radio")
        }
        TabButton {
            id: forth_tabButton
            text: qsTr("Media")
        }
        TabButton {
            id: fifth_tabButton
            text: qsTr("Settings")
        }
    }
}

import QtQuick 2.4

Settings_PageForm {

    button_to_change_hmi_color.onPressedChanged: {
        gradient_stop.color = "red"
    }
}

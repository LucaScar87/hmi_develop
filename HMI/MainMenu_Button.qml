import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
//import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import Qt.labs.calendar 1.0

Button {
    id: simple_button
    x: 0
    y: 0
    text: qsTr("Button")
    font.weight: Font.Medium
    width: text.length*10
    height: 40
    Material.elevation: 6
    highlighted: true
    Material.background: Material.Orange
}



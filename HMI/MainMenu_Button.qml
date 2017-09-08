import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4

Button {
    id: simple_button
    x: 0
    y: 0
    width: text.length
    height: 40
    text: qsTr("Button")
    scale: 1
    checked: false
    font.family: "Arial"
    autoExclusive: true
    checkable: false
    highlighted: false
    padding: 6
    font.capitalization: Font.MixedCase
    background: Rectangle {
            border.width: simple_button.activeFocus ? 2 : 1
            border.color: "#888"
            radius: 4
            gradient: Gradient {
                GradientStop { position: 0 ; color: simple_button.pressed ? "#ccc" : "#eee" }
                GradientStop { position: 1 ; color: simple_button.pressed ? "#aaa" : "#ccc" }
            }
    }
}

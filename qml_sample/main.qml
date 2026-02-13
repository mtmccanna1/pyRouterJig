import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    visible: true
    width: 480
    height: 320
    title: "pyRouterJig QML Sample"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Label {
            text: "pyRouterJig"
            font.pixelSize: 24
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: jointName
            placeholderText: "Joint name"
            Layout.fillWidth: true
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Label {
                text: "Mode"
                Layout.alignment: Qt.AlignVCenter
            }

            ComboBox {
                id: jointMode
                Layout.fillWidth: true
                model: ["Box", "Dovetail"]
            }
        }

        Slider {
            id: scaleSlider
            from: 0.5
            to: 2.0
            value: 1.0
            stepSize: 0.1
            Layout.fillWidth: true
        }

        Rectangle {
            color: "#f5f5f5"
            radius: 8
            border.color: "#d0d0d0"
            Layout.fillWidth: true
            Layout.preferredHeight: 120

            Column {
                anchors.centerIn: parent
                spacing: 6

                Label {
                    text: "Preview"
                    font.bold: true
                }

                Label {
                    text: "Name: " + (jointName.text.length ? jointName.text : "(unnamed)")
                }

                Label {
                    text: "Mode: " + jointMode.currentText
                }

                Label {
                    text: "Scale: " + scaleSlider.value.toFixed(1) + "x"
                }
            }
        }

        Button {
            text: "Generate Layout"
            Layout.alignment: Qt.AlignHCenter
        }
    }
}

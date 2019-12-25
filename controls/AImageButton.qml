import QtQuick 2.5

Rectangle {
    id: imageButton
    signal clicked
    width: 72
    height: 72
    color: "transparent"
    property url defaultImageSource: image.source
    property url hoverImageSource: image.source
    property url pressedImageSource: image.source
    property alias text: tex.text
    Component.onCompleted: {
        image.source = defaultImageSource
    }
    MouseArea {
        anchors.fill: parent
        onClicked: imageButton.clicked()
        hoverEnabled: true
        onHoveredChanged: image.source = containsMouse ? hoverImageSource : defaultImageSource
        onPressedChanged: {
            if (containsMouse) {
                if (pressed) {
                    image.source = pressedImageSource
                }
                else {
                    image.source = hoverImageSource
                }
            } else
                image.source = defaultImageSource
        }
    }
    Image {
        id: image
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        onSourceSizeChanged: {
            image.width = sourceSize.width
            image.height = sourceSize.height
        }
    }

    Text {
        id: tex
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
        font.family: "微软雅黑"
        font.pointSize: 14
        font.weight: Font.DemiBold
        color: "#ffffff"
    }
}

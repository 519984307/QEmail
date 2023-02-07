import QtQuick
import QtQuick.Controls

Item {


    id:comboBoxComponentItem

    property alias label: labelText.text
    property alias currentText: control.currentText
    property alias currentIndex: control.currentIndex
    property alias model: control.model
    property var   bindRadio: null
    property var   color: comboBoxComponentItem.bindRadio == null?"#696969":
                                                                   (comboBoxComponentItem.bindRadio.checked?"#6495ED":"#696969")

    property var   borderWidth: comboBoxComponentItem.bindRadio == null?1:
                                                                         (comboBoxComponentItem.bindRadio.checked?2:1)

    property int  leftMargin: 20
    property int  comboBoxWidth: 150

    width: childrenRect.width
    height: childrenRect.height

    Text
    {
        id: labelText
        anchors{
            top:parent.top
            left: parent.left
        }
       color:"#999999"
    }


    ComboBox {
        id: control
        anchors{
            top: labelText.bottom
            left: labelText.left
            topMargin: 5
        }

        model:[]
        delegate: ItemDelegate
        {
            width: control.width
            contentItem: Text {
                text: modelData
                color:  comboBoxComponentItem.color;
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }
            highlighted: control.highlightedIndex == index
        }

        indicator: Canvas {
            id: canvas
            x: control.width - width - control.rightPadding
            y: control.topPadding + (control.availableHeight - height) / 2
            width: 12
            height: 8
            contextType: "2d"

            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle =  comboBoxComponentItem.color ;
                context.fill();
            }
        }

        contentItem: Text {
            leftPadding: 10
            topPadding: 5
            bottomPadding: 5
            rightPadding: control.indicator.width + control.spacing + 15
            text: control.currentText
            color:  comboBoxComponentItem.color
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle{
            radius: 3
            border{
                width: 1
                color: "#BBBBBB"
            }
        }

    }
}

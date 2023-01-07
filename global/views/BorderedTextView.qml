import QtQuick 2.15

Item{
    property double radius:0
    property string textHint: ""
    property color borderColor: "#e8e8e8"
    property color hintColor : "#888888"
    property color textColor: "#000000"
    property double fontSize: 12
    property double borderWidth: 1
    property string text:""

    id: myItem
    Rectangle{

        width: myItem.width
        height: myItem.height
        border.color: myItem.borderColor
        border.width:  myItem.borderWidth
        radius: myItem.radius
        clip : true
        TextEdit{
            id:textEdit
            text:myItem.text
            color:  myItem.textColor
            width: myItem.width
            height: myItem.height
            textMargin: 2
            font.pointSize: myItem.fontSize
            Text{
                visible: !textEdit.text
                text: myItem.textHint
                color: myItem.hintColor
                font.pointSize: myItem.fontSize
            }
        }
    }
}

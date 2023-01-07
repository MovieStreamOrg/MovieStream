import QtQuick 2.15
import QtQuick.Layouts 1.15
import com.stream.movie 1.0
import "." as GlobalComponent
Item {
    width: parent.width
    height: 240
    property string label
    AppSetting{
        id: appSetting
    }

    ColumnLayout{
        width: parent.width
        height: parent.height
        spacing: 10
        RowLayout{
            width: parent.width
            height: 30
            Text{
                text: label
                font.pixelSize: 20
                font.weight: Font.Normal
                color:appSetting.getDefaultTextColor
                leftPadding: 10
            }
        }
        Flickable{
            width:parent.width
            height:200
            flickableDirection: Flickable.HorizontalFlick

            contentWidth: videoContent.width +  videoContent.columnSpacing + 10
            GridLayout{
                id: videoContent
                height:parent.height
                x:10
                columnSpacing:5
                rows:1
                GlobalComponent.VideoItem{
                    width: 110
                    height:180

                }

                GlobalComponent.VideoItem{
                    width: 110
                    height:180
                }
                GlobalComponent.VideoItem{
                    width: 110
                    height:180
                }
                GlobalComponent.VideoItem{
                    width: 110
                    height:180

                }

                GlobalComponent.VideoItem{
                    width: 110
                    height:180
                }
                GlobalComponent.VideoItem{
                    width: 110
                    height:180
                }
            }
        }



    }
}

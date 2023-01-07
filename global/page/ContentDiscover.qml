import QtQuick 2.15
import QtQuick.Layouts 1.15
import "qrc:/component/global/views" as GlobalComponent
import com.stream.movie 1.0
Item {
    width:parent.width
    height:parent.height
    AppSetting{
        id: appSetting
    }


    Flickable{
        width:parent.width
        height:parent.height
        y:10
        flickableDirection: Flickable.VerticalFlick
        clip:true
        contentHeight: columnLayout.height + 60

        FontMetrics{
            id: defaultFontMetrics
            font.pixelSize: 18
            font.weight: Font.Bold

        }

        ColumnLayout{
            id:columnLayout
            width:parent.width
            spacing:20

            GlobalComponent.VideoHorizontal{
                label:"New & Hot"
            }

            GlobalComponent.VideoHorizontal{
                label:"Top TV Shows"
            }

            GlobalComponent.VideoHorizontal{
                label:"Top Movies"
            }

            GlobalComponent.VideoHorizontal{
                label:"Top Asian Shows"
            }
            GlobalComponent.VideoHorizontal{
                label:"Top Western Shows"
            }
        }
    }

}

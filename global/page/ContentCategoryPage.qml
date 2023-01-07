import QtQuick 2.15
import com.stream.movie 1.0
Item {
    width:parent.width
    height:parent.height
    ListView{
        width:parent.width
        height:parent.height
        leftMargin: 10
        topMargin : 10
        header:Rectangle{
            Text{
                font.weight: Font.DemiBold
                font.pixelSize: 18
                text:"Available Category"
                color: appSetting.getDefaultTextColor
            }
        }
    }


    AppSetting{
        id:appSetting
    }

}

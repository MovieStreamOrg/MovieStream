import QtQuick
import "global/views/" as GlobalComponent
import QtQuick.Controls.Material 2.15
import com.stream.movie 1.0;
import "global/page" as Page
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "global/views/fontawesome" as IconComponent
Window {
    MovieStreamConnection{
        id: movieStreamConnect
    }

    GlobalComponent.FontIcon{
        id:fontawesome
    }
    IconComponent.Icon{
        id:icons
    }
    Component{
        id:contentListing
        Page.ContentListingPage{}
    }

    id: mainWindow
    width: appSetting.getScreenWidth
    height: appSetting.getScreenHeight
    visible: true
    title: qsTr("Movie Stream")
    Component.onCompleted: console.log("test")
    GlobalComponent.DefaultTemplate{

        headerText: "Movie Stream"
        objectName: "me"
        id:me
        hasFooter: false
        width: mainWindow.width
        height: mainWindow.height
        hasTopnotch:  appSetting.hasTopNotch
        contentData:  contentListing.createObject()
        customerMidHeader: Rectangle{
            color:"#00000000"
            y:-10
            width:me.midHeaderWidth
            height:me.headerHeight
            id: midHeader
            RowLayout{
                 width:parent.width
                 height:me.headerHeight
                 id:rowLayout
                Text{
                     Layout.fillHeight: true
                     x:20
                     text: me.headerText
                     color:appSetting.getHeaderTextColor
                     font.pixelSize: 18
                     font.weight: Font.Medium

                     onPaintedWidthChanged: {
                         this.width = this.paintedWidth;
                     }
                 }


                     RowLayout{
                         Layout.fillHeight: true
                         Layout.fillWidth: true
                         //anchors.right:parent.right
                         Layout.alignment:  Qt.AlignRight
                         spacing:20
                         clip:true
                         Text{
                             topPadding: 3
                             Layout.fillHeight: true
                             Layout.alignment: Qt.AlignVCenter
                             id:filterTxt
                             color:appSetting.getHeaderTextColor
                             font.pixelSize: 18

                             font.family: fontawesome.fontAwesomeSolid.name
                             font.weight: Font.Bold
                             text: icons.filter
                             onPaintedWidthChanged: {
                                 width = this.paintedWidth
                             }
                         }
                         Rectangle{
                             color:"#00000000"
                             Layout.fillHeight: true
                             width: 70

                             RowLayout{
                                 width:parent.width
                                 anchors.top:parent.top

                                 Text{
                                     Layout.fillHeight:true
                                     text:"Popular"
                                     verticalAlignment: Text.AlignVCenter
                                     topPadding:2
                                     color:appSetting.getHeaderTextColor
                                     font.pixelSize: 14
                                 }
                                 Text{
                                    topPadding: 6
                                     Layout.fillHeight: true
                                     Layout.fillWidth: true
                                     font.family: fontawesome.fontAwesomeSolid.name
                                     font.bold: true
                                     font.pixelSize: 18
                                     text:icons.chevron_down
                                     verticalAlignment: Text.AlignVCenter
                                     color:appSetting.getHeaderTextColor
                                 }
                             }

                         }


                     }


            }
        }



    }
    AppSetting{
        id: appSetting
    }

}

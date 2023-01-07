import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import com.stream.movie 1.0
import  "qrc:/component/global/views/" as Component
Item {
    property int defaultItemWidth: 110
    property string filterData
    property int defaultItemheight: 200
    property var filter
    id:root
    function widthChangeItem(){
        width = appSetting.getScreenWidth
        var diff = appSetting.getScreenWidth- grid.width;

        var idealSpacing = diff/(grid.columns+ 2);

        grid.x = idealSpacing;
        grid.columnSpacing = idealSpacing;
        console.log(filter.category)
    }

    anchors.fill: parent.fill
    Flickable{
        id: scroll
        width:root.width
        height:root.height
        anchors.fill: parent
        flickableDirection: Flickable.VerticalFlick
        clip:true
        contentHeight : grid.height + 30

        GridLayout{

            id: grid
            y:10
            columnSpacing: 2
            rowSpacing:  5
            x: 2
            onWidthChanged: {

                 grid.width = ( grid.columns * root.defaultItemWidth) -4;
                 root.widthChangeItem()

            }

            columns: Math.floor(appSetting.getScreenWidth/root.defaultItemWidth)
            Component.VideoItem{

                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{
                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{

                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{
                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{

                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{
                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{

                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{
                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{

                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{
                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{

                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{
                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{

                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{
                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{

                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
            Component.VideoItem{
                width: root.defaultItemWidth
                height: root.defaultItemheight
            }
        }
    }


    AppSetting{
        id: appSetting

    }


}

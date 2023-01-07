import QtQuick 2.15
import com.app.menu 1.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "." as OtherComponent
import "fontawesome" as IconComponent
import com.stream.movie 1.0
Item {
    property Button activeBtn
    AppSetting{
        id:appSetting
    }
    property var itemSelected
    property var itemSelectedChanged:function(x){
        if(itemSelected !=undefined){
            itemSelected(x.menuItem)
        }


    }

    Component{

        id: buttonComponent
        Button{
            OtherComponent.FontIcon{
                id:fontawesome
            }
            signal itemSelected(Button selectedBtn)
            id:btn
            property AppMenu menuItem
           // property string label
            //property string iconRight
            property var iconWeight:Font.Bold
            property bool isActive:false
            property bool isPressed:false
            property bool isMoved:false;
            property Item attachedSidebar;

            width: sideRect.width
            onWidthChanged: {
                if(width < sideRect.width){
                    width = sideRect.width;
                }
                if(height < 60){
                    height = 60;
                }
            }

            MouseArea{
                anchors.fill: parent
                id: btn_event

                onCanceled:  btn.background.color="#00000000"

                onPressed:{

                    btn.background.color="#d8d8d8"
                }
                onReleased: {

                    btn.background.color="#00000000"
                    btn.itemSelected(btn)
                }
            }

            height: 60
            background: Rectangle{
                width:btn.width
                height:btn.height
                clip:true


                color: (isActive) ? "#e8e8e8":"#00000000"
                Material.theme: Material.BlueGrey
                RowLayout{
                    x:20
                    width:parent.width
                    height: parent.height
                    id:parentRow
                    property var getFontWeight:function(){
                        if(btn.menuItem != undefined){
                            if(btn.menuItem.iconWeight != undefined){
                                return btn.menuItem.iconWeight;
                            }
                        }
                       return btn.iconWeight;
                    }

                    Text{
                        font.family: fontawesome.fontAwesomeSolid.name
                        font.weight:parentRow.getFontWeight()

                        text: (btn.menuItem != undefined) ? btn.menuItem.icon:""
                        font.pixelSize: 20
                        Layout.preferredWidth: 40
                        id:iconText
                        color:appSetting.getDefaultTextColor


                    }
                    Text{
                        font.weight:  Font.DemiBold
                        text: (btn.menuItem != undefined) ? btn.menuItem.name:""
                        font.pixelSize: 18
                        Layout.fillWidth: true
                        color:appSetting.getDefaultTextColor
                        id:labelText
                       onPaintedWidthChanged: {
                           var currentWidth=parentRow.x + iconText.width + labelText.paintedWidth;
                           if(currentWidth >  parentRow.width){
                                if(btn.attachedSidebar != undefined){
                                    var diff = parentRow.width - currentWidth;
                                    btn.attachedSidebar.width += (diff+75)
                                }
                           }
                       }


                    }
                }

            }


        }
    }

    id:root
    property list<AppMenu> topMenu
    property list<AppMenu> userMenu
    property list<AppMenu> otherMenu

    width:parent.width
    height:parent.height
    property bool show:false

    x: (show) ? 0: -1*(width)
    Behavior on x{
        NumberAnimation{
            duration: 450
            easing.type:  Easing.InOutCubic
        }
    }


    MouseArea {
           id: eat_events_mousearea
           anchors.fill:parent
           onClicked: (eat_events_mousearea.mouseX > sideRect.width) ? show=false: console.log("no event needed")
       }
    Rectangle{
        property var getIdealWidth:function(){
            var idealWidth = (parent.width/3 ) + (parent.width/4);
            var maxWidth = 250;
            if(idealWidth > maxWidth){
                return maxWidth;
            }
            return idealWidth;

        }

        id: sideRect
        width:  getIdealWidth();
        height: root.height
        color:"#f7f7f7"
        GridLayout{
            anchors.fill:parent
            columns:1
            rows:2
            Item{
                id:topRect
                width:parent.width
                height:150
                Rectangle{
                    width:sideRect.width
                    height:topRect.height
                    color: "#d8d8d8"
                    clip:true
                    Image{
                        width: 500
                        fillMode: Image.PreserveAspectFit
                        transform: Rotation{ origin.x:75; origin.y:350; angle:-20}
                        clip:true
                        source:"qrc:/assets/images/movieposter.jpg"

                    }

                }
            }


            Item{
                id:scrollPart
                Layout.fillWidth: true
                Layout.fillHeight: true
                Flickable{
                    width:parent.width
                    height:parent.height
                    anchors.fill: parent
                    flickableDirection: Flickable.VerticalFlick
                    clip:true
                    contentHeight: columnFlicker.height + 60

                    GridLayout{
                        columns:1
                        rows:7
                        y:20
                        rowSpacing: 20
                        id:columnFlicker
                        width: parent.width
                        onHeightChanged:{
                            var heightChild = topMenuCol.height + userMenuCol.height + otherMenuCol.height
                            if(columnFlicker.height < heightChild){
                                heightChild = heightChild
                            }
                        }

                        onWidthChanged: {

                            if(topMenu !=undefined){
                                  topMenuCol.children="";
                                  for(var x=0; x < topMenu.length; x++){
                                      var menuItem = topMenu[x];

                                      var btn = buttonComponent.createObject(this,{});
                                     // btn.width = sideRect.width
                                     btn.itemSelected.connect(itemSelectedChanged)
                                     btn.menuItem = menuItem
                                      btn.attachedSidebar= sideRect;

                                      topMenuCol.children.push(btn)


                                  }
                            }
                            if(userMenu != undefined){
                                userMenuCol.children="";
                                for(var x =0; x < userMenu.length; x++){
                                    var menuItem= userMenu[x];
                                    var btn = buttonComponent.createObject(this,{});
                                    btn.menuItem = menuItem
                                    btn.attachedSidebar= sideRect;

                                    btn.itemSelected.connect(itemSelectedChanged)


                                    userMenuCol.children.push(btn)

                                }
                            }
                            if(otherMenu != undefined){
                                otherMenuCol.children="";
                                for(var x =0; x < otherMenu.length; x++){
                                    var menuItem= otherMenu[x];
                                    var btn = buttonComponent.createObject(this,{});
                                     btn.attachedSidebar= sideRect;

                                   btn.itemSelected.connect(itemSelectedChanged)

                                    btn.menuItem = menuItem

                                    otherMenuCol.children.push(btn)

                                }
                            }
                        }

                        ColumnLayout{
                                width: parent.width
                                id: topMenuCol
                                spacing:20

                                onHeightChanged:{
                                    if(topMenuCol.height < (topMenuCol.children.length * 80)){
                                        topMenuCol.height = topMenuCol.children.length * 80;
                                    }

                                }

                                onChildrenChanged:{
                                    topMenuCol.height+=80


                                }


                            }

                        Rectangle{
                            anchors.bottom:userTxt.top
                            Layout.alignment: Qt.AlignBottom
                            color:"#e8e8e8"
                            width:parent.width
                            y:20
                            onWidthChanged:{
                                this.width= parent.width
                            }

                            height: 1
                        }
                        Text{
                            id: userTxt
                            topPadding: 20
                            leftPadding: 20
                            text:"USER"
                            color:"#536872"
                            font.weight: Font.Medium
                            font.pixelSize: 16
                        }
                        ColumnLayout{


                            id:userMenuCol
                            spacing: 20

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                        }
                        Rectangle{
                            Layout.alignment: Qt.AlignBottom
                            anchors.top: otherTxt.top
                            color:"#e8e8e8"
                            width:parent.width
                            onWidthChanged:{
                                this.width= parent.width
                            }

                            height: 1
                        }
                        Text{
                            id:otherTxt
                            topPadding: 20
                            leftPadding: 20
                            text:"OTHER"
                            color:"#536872"
                            font.weight: Font.Medium
                            font.pixelSize: 16
                        }
                       ColumnLayout{
                           width:parent.width
                           id:otherMenuCol
                           spacing: 20



                       }
                    }

                }

            }

        }



        Rectangle {
                    id: dropShadowRect
                    property real offset: Math.min(parent.width*0.005, parent.height)
                    color: "#e8e8e8"
                    width: parent.width
                    height: parent.height
                    z: -1
                    opacity: 0.75
                    anchors.right: parent.right
                    anchors.rightMargin: -offset

       }


    }



}

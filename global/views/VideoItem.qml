import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "." as Component
import "fontawesome" as IconFont
import com.stream.movie 1.0

Item {
        AppSetting{
            id:appSetting
        }

        id:root
        property string imageURL:""

        Component.FontIcon{
            id:fontawesome
        }
        IconFont.Icon{
            id: icons
        }

        Frame{
            width: parent.width
            height:parent.height
            padding:0
            topPadding: 0
            bottomPadding: 10
            clip:true
            background:    Rectangle{
                width: parent.width
                height:parent.height
                color: "#d8d8d8"
                radius: 8
            }
            ColumnLayout{
                width: parent.width
                height:parent.height

                Rectangle{
                    color: "#222222"
                    width: parent.width
                    height: parent.height - labelRect.height
                    Text{
                        id: videoIcon
                        font.family: fontawesome.fontAwesomeSolid.name
                        font.weight: Font.Bold
                        text: icons.video
                        font.pixelSize:  30
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                        visible:{
                            if(image.source.length != 0){
                                indicator.visible =false;
                                videoIcon.visible=true;
                            }else{
                                videoIcon.visible =false;
                                indicator.visible=true;
                            }
                        }
                    }

                    BusyIndicator{
                        id: indicator

                        anchors.centerIn: parent
                        visible: {
                            if(indicator.visible){
                                if(image.source.length != 0){
                                    indicator.visible =false;
                                    videoIcon.visible=true;
                                }else{
                                    try{
                                        indicator.running = image.status === Image.Loading;

                                    }catch(err){

                                    }

                                     videoIcon.visible =false;
                                }
                            }
                        }
                    }

                    Image{
                        id:image
                        width: parent.width
                        height: parent.height
                        source:(root.imageURL.length != 0) ? root.imageURL:""
                    }
                }
                Rectangle{
                    id: labelRect
                    implicitHeight: labelText.height
                    Text{
                        leftPadding: 5
                        rightPadding:5
                        id: labelText
                        text: "Sample Title"
                        color:appSetting.getDefaultTextColor
                        font.weight: Font.Light
                        font.pixelSize:  15
                    }
                }
            }
        }




}

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "." as GlobalComponent
import com.app.menu 1.0
import "fontawesome" as CustomFont
import com.stream.movie 1.0
import "qrc:/page/global/page" as Page

Item {
   id: root
   property Item contentData: null
   property Item headerData: null
   property Item footerData: null
   property Item customerMidHeader:null
   property double midHeaderWidth: labelRect.width
   property double headerHeight: headerRect.height

   property bool hasFooter : true
   property bool hasHeader : true
   property string headerText: "My Header"
   property bool hasTopnotch: false
   property StackView navigationPage:navi

   AppSetting{
       id: appSetting
   }

   Component{
        id: contentDiscover
        Page.ContentDiscover{
            width: parent.width
            height:parent.height
        }

   }
   Component{
       id: contentListing
       Page.ContentListingPage{

       }
   }
   Component{
       id: categoryPageListing
       Page.ContentCategoryPage{}

   }

   Rectangle{
       anchors.fill:parent


       ColumnLayout{
            spacing: 2
            GlobalComponent.FontIcon{
                id:fontawesome
            }
            CustomFont.Icon{
                id: icon
            }

           Rectangle{
                id: headerRect
                width: root.width
                height: (root.hasHeader) ? (root.hasTopnotch) ? 64:40:0

                color: appSetting.getHeaderBgColor
                data: (headerData != null) ?  headerData.data:null
                clip:true
                Frame{

                    bottomPadding:20
                    width: headerRect.width
                    height:headerRect.height
                    clip: true
                    background: Rectangle{
                        border.color: headerRect.color
                        color:"#00000000"
                    }

                    GridLayout{
                        anchors.bottom: parent.bottom
                        width:  parent.width
                        onWidthChanged: {
                            if(this.width != parent.width){
                                this.width = parent.width
                            }
                        }

                        columns: 3
                        Rectangle{
                            id: leftControl
                            width: 40
                            color: "#00000000"


                            Text{
                                id: bar_icon
                                font.family: fontawesome.fontAwesomeRegular.name
                                font.weight: Font.Bold
                                font.pointSize: 20
                                color:appSetting.getHeaderTextColor
                                text: icon.bars
                                anchors.centerIn: parent


                            }
                            Button{
                                background:Rectangle{
                                    implicitHeight: parent.width
                                    implicitWidth: parent.height
                                    color:"#00000000"
                                }

                                anchors.centerIn: parent
                                width: parent.width
                                height:headerRect.height
                                onPressed: bar_icon.color="#fff000"
                                onReleased: {
                                    bar_icon.color=appSetting.getHeaderTextColor;
                                    if(sidebar.show){
                                        sidebar.show=false;
                                    }else{
                                        sidebar.show=true;
                                    }
                                    console.log("released")
                                }


                                //onClicked: (navi.children.length > 1) ?navi.pop():Qt.quit()
                            }

                        }
                        Rectangle{
                            id:labelRect
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            onWidthChanged: {
                                if(root.customerMidHeader != null){
                                    labelRect.children = "";
                                    labelRect.data = root.customerMidHeader;
                                }
                            }

                            Text{

                                anchors.centerIn: labelRect
                                Layout.alignment: Qt.AlignBottom
                                text: root.headerText
                                font.pointSize: 20
                                color: appSetting.getHeaderTextColor

                            }
                        }
                        Rectangle{
                            Layout.alignment: Qt.AlignRight
                            id: rightControl
                            width: 40
                            color: "#00000000"

                            Text{
                                font.family: fontawesome.fontAwesomeRegular.name
                               font.weight: Font.Bold
                               font.pointSize: 20
                                color: appSetting.getHeaderTextColor
                                text: icon.search
                                anchors.centerIn: parent
                            }
                        }
                    }
                }

            }
           Rectangle{
               id: contentRect
               width: root.width
               height:root.height - (headerRect.height + footerRect.height)
               //data: (contentData !=null) ? contentData.data:null
               StackView{
                   id: navi
                   width:parent.width
                   height:parent.height
                   anchors.fill: parent
                   onWidthChanged:{

                        if(root.contentData != null){
                            root.contentData.width=this.width
                            root.contentData.height = this.height
                            navi.push(root.contentData)

                        }


                   }

                   //initialItem: (root.contentData !=null) ? root.contentData:null
               }
           }
           Rectangle{
               id: footerRect
               height: (root.hasFooter) ? 40:0
               width:root.width

               color: "#888888"
               data: (footerData !=null) ? footerData.data :null

           }



       }
       CustomFont.Icon{
           id:icons
       }

       GlobalComponent.SideBar{
            id: sidebar
            itemSelected: (item)=>{
                     switch(item.objectName){
                        case "discover":
                              var contentDiscoverPage = contentDiscover.createObject()
                              navi.push(contentDiscoverPage)
                              root.headerText= "Discover TV Shows & Movies";
                              break;
                         case "movie":
                              var movieListPage =contentListing.createObject()

                              root.headerText="Watch Movie"
                              navi.push(contentListing ,{"filter":{"category":item.objectName}})
                              break;
                         case "tv":
                              var tvListPage= contentListing.createObject()
                              root.headerText = "Watch TV Shows"
                              navi.push(tvListPage, {"filter":{"category":item.objectName}})
                              break;
                         case "category":
                              var categoryPage = categoryPageListing.createObject()
                              root.headerText = "Select Category"
                              navi.push(categoryPage)
                              break;

                     }
                     sidebar.show=false

             }

            topMenu: [
                AppMenu{

                    objectName :"discover"
                    icon:icons.rocket_launch
                    name: "Discover"
                    iconWeight:Font.Bold
                },
                AppMenu{

                    objectName: "movie"
                    icon:icons.film
                    name: "Movie"
                     iconWeight:Font.Bold
                },
                AppMenu{
                    objectName:"tv"
                    icon:icons.tv
                    name:"TV Shows"
                     iconWeight:Font.Bold
                },
                AppMenu{
                    objectName:"category"
                    icon:icons.shape
                    name:"Category"
                     iconWeight:Font.Bold
                }


            ]
            userMenu: [
                 AppMenu{
                     objectName:"watchlist"
                     icon:icons.bookmark
                     name:"Watchlist"
                 },

                AppMenu{
                    objectName:"recent"
                    icon:icons.refresh
                    name: "Recent"
                    iconWeight: Font.Bold
                }


            ]
            otherMenu:[
                AppMenu{
                    objectName:"setting"
                    icon:icons.gear
                    name:"Setting"
                    iconWeight: Font.Bold
                },
                AppMenu{
                    objectName:"updates"
                    icon:icons.update
                    name:"Check for updates"
                    iconWeight: Font.Bold
                },

                AppMenu{
                    objectName:"logout"
                    icon:icons.logout
                    name: "Logout"
                    iconWeight: Font.Bold
                }


            ]

       }
   }







}

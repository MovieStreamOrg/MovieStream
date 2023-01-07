TEMPLATE = app
QT += quick widgets gui qml quickcontrols2

SOURCES += \
        app/source/app_config.cpp \
        app/source/app_connection.cpp \
        app/source/app_menu.cpp \
        app/source/app_network.cpp \
        app/source/app_setting.cpp \
        app/source/app_setting_invoke.cpp \
        app/source/endpoint/model/response/base_response.cpp \
        app/source/endpoint/graph_network.cpp \
        main.cpp


resources.files += main.qml\
                global/views/BorderedTextView.qml \
                global/views/DefaultTemplate.qml \
                global/views/FontIcon.qml \
                global/views/fontawesome/Icon.qml \
                global/page/ContentListingPage.qml \
                global/views/VideoItem.qml \
                global/views/SideBar.qml \
                global/page/ContentDiscover.qml \
                global/views/VideoHorizontal.qml \
                global/page/ContentCategoryPage.qml

resources.prefix = /$${TARGET}
RESOURCES += resources \
    fontresource.qrc \
    pageresource.qrc

TRANSLATIONS += \
    MovieStream_en_PH.ts
CONFIG += lrelease
CONFIG += embed_translations

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


android{
    ANDROID_PACKAGE_SOURCE_DIR= $$PWD/android/
    OTHER_FILES += android/src
    DISTFILES += \
        android/AndroidManifest.xml
}

HEADERS += \
    app/header/app_config.h \
    app/header/app_connection.h \
    app/header/app_menu.h \
    app/header/app_network.h \
    app/header/app_setting.h \
    app/header/app_setting_invoke.h \
    app/header/endpoint/graph_network.h \
    app/header/endpoint/model/request/base_request.h \
    app/header/endpoint/model/response/base_response.h

#DISTFILES += \
#    android/build.gradle \
#    android/gradle.properties \
#    android/gradle/wrapper/gradle-wrapper.jar \
#    android/gradle/wrapper/gradle-wrapper.properties \
#    android/gradlew \
#    android/gradlew.bat \
#    android/res/values/libs.xml
























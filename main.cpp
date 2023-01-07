#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QFileInfo>
#include <QLocale>
#include <QTranslator>
#include <Qt>
#include <iostream>
#include <QDebug>
#include <QQmlContext>
#include <QWindow>
#include <QScreen>
#include <QQuickItem>
#include <QQmlComponent>
#include <QWindow>
#include "app/header/app_setting.h"
#include "app/header/app_setting_invoke.h"
#include "app/header/app_menu.h"
#include "app/header/app_network.h"
#include "app/header/endpoint/graph_network.h"
#include <QQuickStyle>
#include "app/header/app_config.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QSessionManager>
void RegisterTypes(){
    qmlRegisterType<AppSettingInvoke>("com.stream.movie",1,0,"AppSetting");
    qmlRegisterType<AppMenu>("com.app.menu",1,0,"AppMenu");
    qmlRegisterType<AppNetwork>("com.stream.movie",1,0,"AppNetwork");
    qmlRegisterType<AppConnection>("com.stream.movie",1,0,"AppConnection");
    qmlRegisterType<AppConfig>("com.stream.movie",1,0,"AppConfig");
    qmlRegisterType<GraphNetwork>("com.stream.movie",1,0,"MovieStreamConnection");
}

int main(int argc, char *argv[])
{
    AppSetting::m_app= AppConfig::loadConfig();
    qDebug() << AppSetting::m_app->getConnection()->getAppNetwork()->getHost();

    QQuickStyle::setStyle("Material");
    QGuiApplication app(argc, argv);
    std::string platform = app.platformName().toStdString();

    QScreen *screen = app.primaryScreen();
    if(platform == "android" || platform == "ios"){
        AppSetting::m_screenWidth = screen->geometry().width();
        AppSetting::m_screenHeight = screen->geometry().height();

    }
    if(platform == "ios"){
        int noNotch[] = {

            1136,
            1334,
            1920,
            2208,
            960

        };

        int value = screen->devicePixelRatio() * AppSetting::m_screenHeight;

        AppSetting::m_withTopnotch = true;
        for(int x:noNotch){
            if(x == value){
                AppSetting::m_withTopnotch=false;

            }
        }
        qDebug() << AppSetting::m_withTopnotch;
    }
     RegisterTypes();
    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "MovieStream_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/MovieStream/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    QObject *root = engine.rootObjects()[0];

    if(platform == "ios" || platform =="android"){
        root->setProperty("visibility",QWindow::FullScreen);
    }else{
        root->setProperty("width",AppSetting::m_screenWidth);
        root->setProperty("height",AppSetting::m_screenHeight);
    }



    //qDebug() << screen->devicePixelRatio() * screen->geometry().height();

    return app.exec();
}

#include "app/header/app_config.h"
#include "app/header/app_connection.h"
#include <QFile>
#include <QDebug>
#include <stdexcept>
#include <QJsonDocument>
#include <QJsonObject>
QString AppConfig::getConnectionType(){
    return this->connectionType;
}

void AppConfig::setConnectionType(QString connectionType){
    this->connectionType = connectionType;
    emit setConnectionTypeChanged(connectionType);
}

AppConnection * AppConfig::getConnection(){
    return this->connection;
}
void AppConfig::setConnection(AppConnection *appConnection){
    this->connection = appConnection;
    emit setConnectionChanged(appConnection);
}

AppConfig  * AppConfig::loadConfig(){
    AppConfig *appConfig= new AppConfig();
    QFile file(":/assets/configs/app.config");
    if(file.exists()){
        qDebug() << "file is reading";

        if(!file.open(QIODevice::ReadOnly | QIODevice::Text)){
              qDebug() << "file cannot be open";

        }else{
             QTextStream in(&file);
             QString data="";
             while(!in.atEnd()){
                 QString line = in.readLine();
                 data+=line;
             }
             QJsonDocument doc = QJsonDocument::fromJson(data.toUtf8());
             QJsonObject obj =doc.object();
             appConfig->setConnectionType(obj["connection_type"].toString());
             QJsonObject con = obj["connection"].toObject();
             qDebug() << con[appConfig->connectionType].toObject().toVariantMap();

             appConfig->setConnection(AppConnection::loadConnection(con[appConfig->connectionType].toObject()));

        }

    }
    return appConfig;
}

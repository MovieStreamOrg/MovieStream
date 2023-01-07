#include "app/header/app_connection.h"
#include <QJsonObject>
#include <QDebug>
void AppConnection::setAppNetwork(AppNetwork *appNetwork){
    this->appNetwork = appNetwork;
    emit setAppNetworkChanged();

}

AppNetwork * AppConnection::getAppNetwork(){
    return appNetwork;
}

AppConnection * AppConnection::loadConnection(QJsonObject jsonObject){
    AppConnection *connection= new AppConnection();
    qDebug() << jsonObject["network"].toObject();
    connection->setAppNetwork(AppNetwork::loadNetwork(jsonObject["network"].toObject()));
    return connection;
}

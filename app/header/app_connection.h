#ifndef APP_CONNECTION_H
#define APP_CONNECTION_H
#include <QObject>
#include "app/header/app_network.h"
#include <QJsonObject>
class AppConnection:public QObject{
    Q_OBJECT
    Q_PROPERTY(AppNetwork *appNetwork READ getAppNetwork NOTIFY setAppNetworkChanged)
signals:
    void setAppNetworkChanged();
private:
    AppNetwork *appNetwork;
public:
    AppNetwork * getAppNetwork();
    void setAppNetwork(AppNetwork *appNetwork);
    static AppConnection * loadConnection(QJsonObject jsonObject);
};

#endif // APP_CONNECTION_H

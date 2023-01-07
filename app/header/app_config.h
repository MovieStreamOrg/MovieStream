#ifndef APP_CONFIG_H
#define APP_CONFIG_H
#include <QObject>
#include "app/header/app_connection.h"

class AppConfig:public QObject{
    Q_OBJECT
    Q_PROPERTY(QString connectionType READ getConnectionType WRITE setConnectionType NOTIFY setConnectionTypeChanged)
    Q_PROPERTY(AppConnection *connection READ getConnection NOTIFY setConnectionChanged)
signals:
    void setConnectionTypeChanged(QString);
    void setConnectionChanged(AppConnection*);
private:
    QString connectionType;
    AppConnection *connection;
public:
    QString getConnectionType();
    void setConnectionType(QString);

    AppConnection * getConnection();
    void setConnection(AppConnection *appConnection);
    static AppConfig * loadConfig();
};

#endif // APP_CONFIG_H


#ifndef APP_NETWORK_H
#define APP_NETWORK_H
#include <QObject>
#include <QJsonObject>
class AppNetwork:public QObject{
    Q_OBJECT
    Q_PROPERTY(QString host READ getHost WRITE setHost NOTIFY setHostChanged)
    Q_PROPERTY(QString graphqlEndpoint READ getGraphqlEndpoint WRITE setGraphqlEndpoint NOTIFY setGraphqlEndpointChanged)
signals:
    void setHostChanged(QString host);
    void setGraphqlEndpointChanged(QString endpoint);
private:
    QString host;
    QString graphqlEndpoint;
public:
    QString getHost();
    void setHost(QString);
    QString getGraphqlEndpoint();
    void setGraphqlEndpoint(QString);


   static AppNetwork * loadNetwork(QJsonObject);
};

#endif // APP_NETWORK_H

#ifndef GRAPH_NETWORK_H
#define GRAPH_NETWORK_H
#include <QObject>
#include <QJsonObject>
class GraphNetwork:public QObject{
    Q_OBJECT
    Q_PROPERTY(ConProcess processType READ getProcessType WRITE setProcessType NOTIFY setProcessTypeChanged)
public:
    enum ConProcess{
        Login=1,
        CategoryList=2,
        CategorySwitch=3,
        WatchList= 4,
        Recent=5,

    };

    Q_INVOKABLE void connect(QJsonObject);
    void setProcessType(ConProcess);
    ConProcess getProcessType();
signals:
    void setProcessTypeChanged(GraphNetwork::ConProcess);
    void requestProcessing();
    void requestDone(QJsonObject);

private:
    QString host;
    ConProcess processType;



};

#endif // GRAPH_NETWORK_H

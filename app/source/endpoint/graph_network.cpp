#include "app/header/endpoint/graph_network.h"
#include <QNetworkRequest>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QDebug>
#include <QFuture>
#include "app/header/app_setting_invoke.h"
#include "app/header/app_config.h"
#include "app/header/app_network.h"
#include <QJsonObject>
#include <QJsonDocument>

void GraphNetwork::connect(QJsonObject requestData){
    AppSettingInvoke appSetting;
    AppConfig *config = appSetting.getAppConfig();
    AppNetwork *network = config->getConnection()->getAppNetwork();
    QString path = network->getHost()+network->getGraphqlEndpoint();
    qDebug() << "connecting to "+path;
    QUrl net(path);
    QJsonDocument doc(requestData);

    QNetworkRequest request(net);

    QNetworkAccessManager *mgr = new QNetworkAccessManager(this);
    QNetworkReply *reply= mgr->post(request, doc.toJson());
    auto future = QtFuture::connect(reply , &QNetworkReply::finished)
            .then([reply, this]{
                QJsonDocument responseDoc = QJsonDocument::fromJson(reply->readAll());
                emit requestDone(responseDoc.object());
    });

    emit requestProcessing();

}

GraphNetwork::ConProcess GraphNetwork::getProcessType(){
    return this->processType;
}

void GraphNetwork::setProcessType(GraphNetwork::ConProcess conProcessType){
    this->processType = conProcessType;
    emit setProcessTypeChanged(conProcessType);
}

#include "app/header/app_network.h"



QString AppNetwork::getHost(){
    return this->host;
}
QString AppNetwork::getGraphqlEndpoint(){
    return this->graphqlEndpoint;
}

void AppNetwork::setHost(QString host){
    this->host =host;
    emit setHostChanged(host);
}
void AppNetwork::setGraphqlEndpoint(QString endpoint){
    this->graphqlEndpoint = endpoint;
    emit setGraphqlEndpointChanged(endpoint);
}

AppNetwork * AppNetwork::loadNetwork(QJsonObject jsonObject){
    AppNetwork *network=new AppNetwork();

    if(&jsonObject != NULL){
        network->setHost(jsonObject["host"].toString());
        network->setGraphqlEndpoint(jsonObject["graphql_endpoint"].toString());
    }
    return network;
}

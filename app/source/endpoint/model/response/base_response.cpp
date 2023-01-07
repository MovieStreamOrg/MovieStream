#include "app/header/endpoint/model/response/base_response.h"


QObject * BaseResponse::getData(){
    return this->data;
}

void BaseResponse::setData(QObject* data){
    this->data = data;
    emit setDataChanged(data);
}


QString BaseResponse::getResponseCode(){
    return this->responseCode;
}


void BaseResponse::setResponseCode(QString code){
    this->responseCode = code;
    emit setResponseCodeChanged(code);
}

QString BaseResponse::getResponseMessage(){
    return this->responseMessage;
}


void BaseResponse::setResponseMessage(QString msg){
    this->responseMessage = msg;
    emit setResponseMessageChanged(msg);
}



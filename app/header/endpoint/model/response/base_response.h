#ifndef BASE_RESPONSE_H
#define BASE_RESPONSE_H
#include <QObject>

class BaseResponse:public QObject{
    Q_OBJECT

    Q_PROPERTY(QObject *data READ getData WRITE setData NOTIFY setDataChanged)
signals:

    void setDataChanged(QObject*);
    void setResponseCodeChanged(QString);
    void setResponseMessageChanged(QString);
private:

    QObject *data;
    QString responseCode;
    QString responseMessage;
public:

    QObject * getData();

    void setData(QObject*);
    QString getResponseCode();
    void setResponseCode(QString);
    QString getResponseMessage();
    void setResponseMessage(QString);

};



#endif // BASE_RESPONSE_H

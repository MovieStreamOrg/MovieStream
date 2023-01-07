#ifndef APP_MENU_H
#define APP_MENU_H


#include "QtCore/qvariant.h"
#include <QObject>
#include <QFont>
#endif // APP_MENU_H


class AppMenu: public QObject{
    Q_OBJECT
    Q_PROPERTY(QString icon READ getIcon WRITE setIcon NOTIFY onSetIconChanged)
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY onSetNameChanged)
    Q_PROPERTY(QFont::Weight iconWeight READ getIconWeight WRITE setIconWeight NOTIFY onSetIconWeightChanged)

private:
    QString icon;
    QString name;
    QFont::Weight iconWeight;


signals:
    void onSetIconChanged(QString);
    void onSetNameChanged(QString);
    void onSetIconWeightChanged(QFont::Weight);
public:
    AppMenu();

    void setIcon(QString);
    QString getIcon();
    void setName(QString);
    QString getName();
    QFont::Weight getIconWeight();
    void setIconWeight(double);
;
};

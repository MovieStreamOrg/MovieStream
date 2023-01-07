#include "app/header/app_menu.h"
#include <QDebug>
#include <QFont>
AppMenu::AppMenu(){


}

void AppMenu::setIcon(QString icon){
    this->icon = icon;
    emit onSetIconChanged(icon);
}


void AppMenu::setName(QString name){
    this->name = name;
    emit onSetNameChanged(name);
}

QString AppMenu::getIcon(){
    return this->icon;
}
QString AppMenu::getName(){
    return this->name;
}


QFont::Weight AppMenu::getIconWeight(){
    return this->iconWeight;
}

void AppMenu::setIconWeight(double weight){
    if(weight == 0){
        weight=1;
    }
    this->iconWeight=(QFont::Weight) weight;
    emit onSetIconWeightChanged((QFont::Weight) weight);
}

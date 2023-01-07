#include "app/header/app_setting_invoke.h"
#include "app/header/app_setting.h"
#include <QColor>
#include "app/header/app_config.h"

double AppSettingInvoke::getScreenWidth(){
    return AppSetting::m_screenWidth;
}
double AppSettingInvoke::getScreenHeight(){
    return AppSetting::m_screenHeight;
}

bool AppSettingInvoke::hasTopNotch(){
    return AppSetting::m_withTopnotch;
}

void AppSettingInvoke::setTopNotch(bool hasTopNotch){
    AppSetting::m_withTopnotch = hasTopNotch;
    emit setTopNotchChanged();
}


QColor AppSettingInvoke::getDefaultTextColor(){
    return AppSetting::m_defautTextColor;
}

void AppSettingInvoke::setDefaultTextColor(QColor color ){
    AppSetting::m_defautTextColor = color;
    emit setDefaultTextColorChanged(color);
}

QColor AppSettingInvoke::getErrorButtonColor(){
    return AppSetting::m_errorButtonColor;
}
void AppSettingInvoke::setErrorButtonColor(QColor color){
    AppSetting::m_errorButtonColor = color;
    emit setErrorButtonColorChanged(color);
}

QColor AppSettingInvoke::getHeaderTextColor(){
    return AppSetting::m_headerTextColor;
}
void AppSettingInvoke::setHeaderTextColor(QColor color){
    AppSetting::m_headerTextColor = color;
    emit setHeaderTextColorChanged(color);
}

QColor AppSettingInvoke::getHeaderBgColor(){
    return AppSetting::m_headerBgColor;
}

void AppSettingInvoke::setHeaderBgColor(QColor color){
    AppSetting::m_headerBgColor = color;
    emit setHeaderBgColorChanged(color);
}
AppConfig * AppSettingInvoke::getAppConfig(){
    return AppSetting::m_app;
}

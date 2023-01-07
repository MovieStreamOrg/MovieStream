#ifndef APP_SETTING_INVOKE_H
#define APP_SETTING_INVOKE_H
#include <QObject>
#include <QColor>
#include "app/header/app_config.h"
#endif // APP_SETTING_INVOKE_H
class AppSettingInvoke:public QObject{
    Q_OBJECT
    Q_PROPERTY(double getScreenWidth READ getScreenWidth NOTIFY getScreenWidthChanged)
    Q_PROPERTY(double getScreenHeight READ getScreenHeight NOTIFY getScreenHeightChanged)
    Q_PROPERTY(bool hasTopNotch READ hasTopNotch WRITE setTopNotch NOTIFY setTopNotchChanged)
    Q_PROPERTY(QColor getDefaultTextColor READ getDefaultTextColor WRITE setDefaultTextColor NOTIFY setDefaultTextColorChanged)
    Q_PROPERTY(QColor getErrorButtonColor READ getErrorButtonColor WRITE setErrorButtonColor NOTIFY setErrorButtonColorChanged)
    Q_PROPERTY(QColor getHeaderTextColor READ getHeaderTextColor WRITE setHeaderTextColor NOTIFY setHeaderTextColorChanged)
    Q_PROPERTY(QColor getHeaderBgColor READ getHeaderBgColor WRITE setHeaderBgColor NOTIFY setHeaderBgColorChanged)
    Q_PROPERTY(AppConfig  *app READ getAppConfig NOTIFY setAppConfigChanged)

signals:
    void getScreenWidthChanged();
    void getScreenHeightChanged();
    void setTopNotchChanged();
    void setDefaultTextColorChanged(QColor);
    void setErrorButtonColorChanged(QColor);
    void setHeaderTextColorChanged(QColor);
    void setHeaderBgColorChanged(QColor);
    void setAppConfigChanged();

public:
    double getScreenWidth();
    double getScreenHeight();
    bool hasTopNotch();
    void setTopNotch(bool);

    QColor getDefaultTextColor();
    void setDefaultTextColor(QColor);

    QColor getErrorButtonColor();
    void setErrorButtonColor(QColor);

    QColor getHeaderTextColor();
    void setHeaderTextColor(QColor);

    QColor getHeaderBgColor();
    void setHeaderBgColor(QColor);

    AppConfig * getAppConfig();


};

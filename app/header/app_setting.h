#ifndef APP_SETTING_H
#define APP_SETTING_H

#include "app/header/app_config.h"
#include <QObject>
#include <QColor>

#include <QRgb>
#endif // APP_SETTING_H


class AppSetting{

public:
    static bool m_withTopnotch;
    static double m_screenWidth;
    static double m_screenHeight;
    static QColor m_defautTextColor;
    static QColor m_successButtonColor;
    static QColor m_errorButtonColor;
    static QColor m_headerTextColor;
    static QColor m_headerBgColor;
    static AppConfig *m_app;


    static inline QRgb hexToRgb(const char *hex){
        int r, g, b;
        std::sscanf(hex, "#%02x%02x%02x", &r, &g, &b);
        return qRgb(r,g,b);
    }

};

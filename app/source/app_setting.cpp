#include "app/header/app_setting.h"
#include <QColor>
#include <QRgb>
bool AppSetting::m_withTopnotch = false;
double AppSetting::m_screenWidth =480;
double AppSetting::m_screenHeight =800;
QColor AppSetting::m_defautTextColor = AppSetting::hexToRgb("#00263E");
QColor AppSetting::m_successButtonColor;
QColor AppSetting::m_errorButtonColor = AppSetting::hexToRgb("#880000");
QColor AppSetting::m_headerTextColor = AppSetting::hexToRgb("#2f2f2f");
QColor AppSetting::m_headerBgColor = AppSetting::hexToRgb("#e6b9bf");
AppConfig * AppSetting::m_app;

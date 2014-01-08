QT       += core gui widgets macextras
TARGET = QINAppStoreWindow
TEMPLATE = app
CONFIG += debug
LIBS += -framework Cocoa

SOURCES += \
    examplemainwindow.cpp

HEADERS += \
    QINAppStoreMainWindow.h \
    examplemainwindow.h
FORMS    += \
    examplemainwindow.ui

OBJECTIVE_HEADERS += \
    INAppStoreWindow/INAppStoreWindow/INAppStoreWindow.h \
    INAppStoreWindow/INAppStoreWindow/INWindowButton.h

OBJECTIVE_SOURCES += \
    INAppStoreWindow/INAppStoreWindow/INAppStoreWindow.m \
    INAppStoreWindow/INAppStoreWindow/INWindowButton.m \
    main.mm \
    QINAppStoreMainWindow.mm

RESOURCES += \
    icons.qrc

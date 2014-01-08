#include <QApplication>

#include "INAppStoreWindow/INAppStoreWindow/INAppStoreWindow.h"
#include "examplemainwindow.h"
#include <Cocoa/Cocoa.h>
#include <QLabel>
#include <QPushButton>
#include <QVBoxLayout>
#include <QMacNativeWidget>
#include <QDesktopWidget>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    ExampleMainWindow w;
    w.show();

    a.exec();
    [pool release];

    return 0;
}

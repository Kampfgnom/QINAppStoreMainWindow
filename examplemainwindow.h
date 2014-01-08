#ifndef EXAMPLEMAINWINDOW_H
#define EXAMPLEMAINWINDOW_H

#include "QINAppStoreMainWindow.h"

namespace Ui {
class ExampleMainWindow;
}

class ExampleMainWindow : public QINAppStoreMainWindow
{
    Q_OBJECT

public:
    explicit ExampleMainWindow(QWidget *parent = 0);
    ~ExampleMainWindow();

private slots:
    void on_actionTest_Toolbaraction_triggered();

private:
    Ui::ExampleMainWindow *ui;
};

#endif // EXAMPLEMAINWINDOW_H

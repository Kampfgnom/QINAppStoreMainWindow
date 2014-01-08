#ifndef EXAMPLEMAINWINDOW_H
#define EXAMPLEMAINWINDOW_H

#include <QMainWindow>

namespace Ui {
class ExampleMainWindow;
}

class ExampleMainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit ExampleMainWindow(QWidget *parent = 0);
    ~ExampleMainWindow();

private:
    Ui::ExampleMainWindow *ui;
};

#endif // EXAMPLEMAINWINDOW_H

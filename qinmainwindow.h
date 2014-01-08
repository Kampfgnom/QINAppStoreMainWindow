#ifndef QINMAINWINDOW_H
#define QINMAINWINDOW_H

#include <QMainWindow>

namespace Ui {
class QINMainWindow;
}

class QINMainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit QINMainWindow(QWidget *parent = 0);
    ~QINMainWindow();

private:
    Ui::QINMainWindow *ui;
};

#endif // QINMAINWINDOW_H

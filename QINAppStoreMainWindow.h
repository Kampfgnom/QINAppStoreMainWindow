#ifndef QINAPPSTOREMAINWINDOW_H
#define QINAPPSTOREMAINWINDOW_H

#include <QMainWindow>

namespace Ui {
class QINAppStoreMainWindow;
}

class QINAppStoreMainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit QINAppStoreMainWindow(QWidget *parent = 0);
    ~QINAppStoreMainWindow();

private:
    Ui::QINAppStoreMainWindow *ui;
};

#endif // QINAPPSTOREMAINWINDOW_H

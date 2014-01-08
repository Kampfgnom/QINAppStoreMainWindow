#ifndef QINAPPSTOREMAINWINDOW_H
#define QINAPPSTOREMAINWINDOW_H

#include <QMainWindow>

class QMacNativeWidget;

class QINAppStoreMainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit QINAppStoreMainWindow(QWidget *parent = 0);
    ~QINAppStoreMainWindow();
    void addTitleBarAction(QAction *action, int x, int y);

public slots:
    void setVisible(bool visible) Q_DECL_OVERRIDE;

private:
    void *m_windowHandle;
    QMacNativeWidget *nativeWidget;
};

#endif // QINAPPSTOREMAINWINDOW_H

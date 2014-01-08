#include "QINAppStoreMainWindow.h"
#include "ui_QINAppStoreMainWindow.h"

QINAppStoreMainWindow::QINAppStoreMainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::QINAppStoreMainWindow)
{
    ui->setupUi(this);
}

QINAppStoreMainWindow::~QINAppStoreMainWindow()
{
    delete ui;
}

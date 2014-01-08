#include "qinmainwindow.h"
#include "ui_qinmainwindow.h"

QINMainWindow::QINMainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::QINMainWindow)
{
    ui->setupUi(this);
}

QINMainWindow::~QINMainWindow()
{
    delete ui;
}

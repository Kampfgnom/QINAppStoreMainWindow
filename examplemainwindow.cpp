#include "examplemainwindow.h"
#include "ui_examplemainwindow.h"

#include <QMessageBox>

ExampleMainWindow::ExampleMainWindow(QWidget *parent) :
    QINAppStoreMainWindow(parent),
    ui(new Ui::ExampleMainWindow)
{
    ui->setupUi(this);

    statusBar()->showMessage(tr("test message"));
    addTitleBarAction(ui->actionTest_Toolbaraction, 70, 12);
}

ExampleMainWindow::~ExampleMainWindow()
{
    delete ui;
}

void ExampleMainWindow::on_actionTest_Toolbaraction_triggered()
{
    QMessageBox msg;
    msg.setText(tr("Action triggered"));
    msg.exec();
}

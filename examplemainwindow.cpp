#include "examplemainwindow.h"
#include "ui_examplemainwindow.h"

ExampleMainWindow::ExampleMainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::ExampleMainWindow)
{
    ui->setupUi(this);
}

ExampleMainWindow::~ExampleMainWindow()
{
    delete ui;
}

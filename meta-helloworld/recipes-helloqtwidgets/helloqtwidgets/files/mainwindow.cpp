#include <QOpenGLContext>
#include <QDebug>
#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(this, &QWidget::customContextMenuRequested,
            this, [=](const QPoint& pos){
        reportCustomContextMenuRequested2(pos);
    });

    m_glContext = new QOpenGLContext();
    qApp->setProperty("mayaSharedQOpenGLContext", QVariant::fromValue(m_glContext));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::reportCustomContextMenuRequested1(const QPoint& pos)
{
    qDebug().noquote().nospace() << "Context menu requested at " << pos << ".";
}

void MainWindow::reportCustomContextMenuRequested2(const QPoint& pos, const QString& message)
{
    qDebug().noquote().nospace() << "Context menu requested at " << pos << "." << message;
}

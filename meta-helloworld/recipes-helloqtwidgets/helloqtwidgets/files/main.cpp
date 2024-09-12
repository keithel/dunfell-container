#include "mainwindow.h"

#include <QApplication>
#include <QLabel>

#include <QOpenGLContext>
#include <QSurfaceFormat>

#include <QString>
#include <QDebug>

int showMainWindow(int argc, char *argv[])
{
    QSurfaceFormat defaultFormat;
    defaultFormat.setVersion(4,1);
    QSurfaceFormat::setDefaultFormat(defaultFormat);
    QApplication a(argc, argv);
    MainWindow w;
    QVariant ctxVariant = QApplication::instance()->property("mayaSharedQOpenGLContext");
    QOpenGLContext *context = ctxVariant.value<QOpenGLContext*>();
    qDebug() << "OpenGL version:" << context->format().version();
    
    w.show();
    return a.exec();
}

int main(int argc, char**argv)
{
    //return showMainWindow(argc, argv);

    QApplication app(argc, argv);
    QLabel label("Hello, World");
    label.setAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
    label.show();

    app.exec();
}

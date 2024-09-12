#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

class QOpenGLContext;

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

public slots:
    void reportCustomContextMenuRequested1(const QPoint& pos);
    void reportCustomContextMenuRequested2(const QPoint& pos, const QString& message = "A default message");

private:
    Ui::MainWindow *ui;

    QOpenGLContext *m_glContext;
};
#endif // MAINWINDOW_H

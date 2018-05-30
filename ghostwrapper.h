#ifndef GHOSTWRAPPER_H
#define GHOSTWRAPPER_H

#include <QObject>
#include "qtghost.h"

class ghostWrapper : public QObject
{
    Q_OBJECT

    Qtghost *ghost;
    QQmlApplicationEngine *engineI;
    QObject *webview;

public:
    ghostWrapper(QObject *parent=Q_NULLPTR);
    void init(QGuiApplication *app,
              QQmlApplicationEngine *engine);
    Q_INVOKABLE void startRecording();
    Q_INVOKABLE void stopRecording();
    Q_INVOKABLE void play();

signals:

public slots:
};

#endif // GHOSTWRAPPER_H

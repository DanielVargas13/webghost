#include "ghostwrapper.h"
#include <QQmlContext>
#include <QQmlApplicationEngine>

ghostWrapper::ghostWrapper(QObject *parent) : QObject(parent)
{
}

void ghostWrapper::init(QGuiApplication *app,
                        QQmlApplicationEngine *engine)
{
    ghost = new Qtghost(app, engine); //Qtghost needs app and QML engine
}

void ghostWrapper::startRecording()
{
    ghost->record_start();
}

void ghostWrapper::stopRecording()
{
    ghost->record_stop();
}

void ghostWrapper::play()
{
    ghost->play();
}

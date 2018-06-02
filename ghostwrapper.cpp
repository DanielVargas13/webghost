#include "ghostwrapper.h"
#include <QQmlContext>
#include <QQmlApplicationEngine>

ghostWrapper::ghostWrapper(QObject *parent) : QObject(parent)
{
    ghost = nullptr;
}

ghostWrapper::~ghostWrapper()
{
    if (ghost != nullptr) {
        delete ghost;
    }
}

void ghostWrapper::init(QGuiApplication *app,
                        QQmlApplicationEngine *engine)
{
    ghost = new Qtghost(app, engine); //Qtghost needs app and QML engine
    Q_ASSERT(ghost->getVersion() == "0.0.2");
    ghost->setStoreAllMouseMoves(true);
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

#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QtWebEngine/qtwebengineglobal.h>
#include "ghostwrapper.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseOpenGLES);
    QGuiApplication app(argc, argv);

    app.setApplicationVersion("0.01");
    app.setOrganizationDomain("https://github.com/antonioalecrim/webghost");

    QtWebEngine::initialize();
    QQmlApplicationEngine engine;
    ghostWrapper gw;

    engine.rootContext()->setContextProperty("ghost", &gw);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    gw.init(&app, &engine);


    return app.exec();
}

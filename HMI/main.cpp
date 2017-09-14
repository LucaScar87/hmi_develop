#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "coverart.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    //QtWebEngine::initialize();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("coverArt", new CoverArt);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    return app.exec();
}

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
    CoverArt *g_coverArt = new CoverArt;

    engine.rootContext()->engine()->addImageProvider("coverart",g_coverArt);
    engine.rootContext()->setContextProperty("coverart",g_coverArt);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}

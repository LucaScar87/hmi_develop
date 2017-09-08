// ***** IconProvider.h ******
#ifndef IMAGEPROVIDER_H
#define IMAGEPROVIDER_H
#include <QQuickImageProvider>
#include <QFileIconProvider>
#include <QMimeDatabase>
class IconProvider : public QQuickImageProvider
{
public:
    IconProvider();
    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize);
protected:
    QFileIconProvider   m_provider;
    QMimeDatabase       m_mimeDB;
signals:
public slots:
};
#endif // IMAGEPROVIDER_H

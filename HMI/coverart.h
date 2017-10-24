#ifndef CoverArt_H
#define CoverArt_H

#include <QObject>
#include <QImage>
#include <QQuickImageProvider>

#include<iostream>
#include<stdio.h>
#include<stdlib.h>
#include <cstdio>

#include <mpegfile.h>
#include<tbytevector.h>
#include <attachedpictureframe.h>
#include <id3v2tag.h>
#include<id3v2frame.h>
#include <mp4file.h>
#include <mp4tag.h>
#include <mp4coverart.h>
#include <mp4item.h>

#define DEBUG 1

#if DEBUG
#define Debug(x) std::cout << x <<endl<<endl
#else
#define Debug(x)
#endif

#if DEBUG
#define DebugErr(x) std::cerr << x <<endl<<endl
#else
#define DebugErr(x)
#endif

using namespace std;
using namespace TagLib::ID3v2;

class CoverArt : public QObject, public QQuickImageProvider
{
    Q_OBJECT
    //Q_PROPERTY(double totalPrice READ totalPrice WRITE setTotalPrice NOTIFY totalPriceChanged)
    Q_PROPERTY(QString mMp3path READ getCoverArturl)
    Q_PROPERTY(QString mMp3artist READ getArtistName)
    Q_PROPERTY(QString mMp3track READ getTitleName)
    Q_PROPERTY(QString mMp3album READ getAlbumName)

public:
    CoverArt(QObject *parent = 0);

    QString getCoverArturl(void) { return mMp3path; }
    QString getArtistName(void) { return mMp3artist; }
    QString getTitleName(void) { return mMp3track; }
    QString getAlbumName(void) { return mMp3album; }

    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize);

//signals:

public slots:
    void writeCoverArt(const QString pMp3pathToImage);

protected:
   QString mMp3path;
   QString mMp3artist;
   QString mMp3track;
   QString mMp3album;
   QString mOldCoverArtUrl;

private:
   QImage mCoverArt;

};


#endif // UTILTS_H

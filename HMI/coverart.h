#ifndef CoverArt_H
#define CoverArt_H

#include <QObject>
#include<iostream>
#include<stdio.h>
#include<stdlib.h>

#include <mpegfile.h>
#include<tbytevector.h>
#include <attachedpictureframe.h>
#include <id3v2tag.h>
#include<id3v2frame.h>
#include <mp4file.h>
#include <mp4tag.h>
#include <mp4coverart.h>

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

class CoverArt : public QObject
{
   Q_OBJECT
   //Q_PROPERTY(double totalPrice READ totalPrice WRITE setTotalPrice NOTIFY totalPriceChanged)
   Q_PROPERTY(QString mMp3path READ getCoverArturl)
   Q_PROPERTY(QString mMp3artist READ getArtistName)
   Q_PROPERTY(QString mMp3track READ getTitleName)
   Q_PROPERTY(QString mMp3album READ getAlbumName)
public:
   CoverArt(QObject *parent = 0) :
     QObject(parent),
     mMp3path("")
   {
   }

   QString getCoverArturl(void) { return mMp3path; }
   QString getArtistName(void) { return mMp3artist; }
   QString getTitleName(void) { return mMp3track; }
   QString getAlbumName(void) { return mMp3album; }

//signals:

public slots:
   void setMp3Path(const QString pMp3path,const QString pCoverArtFolder)
   {
       writeCoverArt(pMp3path,pCoverArtFolder);
   }
   void writeCoverArt(QString pMp3pathToImage, QString pCoverArtFolderWrite)
   {
       Debug("File name:"<< pMp3pathToImage.toStdString().substr(8));
       Debug("Folder location:"<< pCoverArtFolderWrite.toStdString());

       pCoverArtFolderWrite = pCoverArtFolderWrite.mid(8) + "/outputFile.png";

       Debug("Image output location:"<< pCoverArtFolderWrite.toStdString());

       TagLib::FileName filename(pMp3pathToImage.toStdString().substr(8).c_str());

       TagLib::String fileType = filename.toString().substr(filename.toString().size() - 3).upper();

       if(fileType == "M4A")
       {
           DebugErr("File already not implemented");
           mMp3path = "undefined_audio";
       }
       else if(fileType == "MP3")
       {
           TagLib::MPEG::File mp3File(filename);
           Tag * mp3Tag;
           FrameList listOfMp3Frames;
           AttachedPictureFrame * pictureFrame;

           mp3Tag = mp3File.ID3v2Tag();
           if(mp3Tag)
           {
               listOfMp3Frames = mp3Tag->frameListMap()["APIC"];//look for picture frames only

               mMp3artist = mp3Tag->artist().toCString();
               mMp3track = mp3Tag->title().toCString();

               if(!listOfMp3Frames.isEmpty())
               {
                   FrameList::ConstIterator it= listOfMp3Frames.begin();
                   for(; it != listOfMp3Frames.end() ; it++)
                   {
                       pictureFrame = static_cast<AttachedPictureFrame *> (*it);//cast Frame * to AttachedPictureFrame*

                       //Warning. format of picture assumed to be jpg. This may be false, for example it may be png.
                       FILE * fout;
                       fopen_s(&fout, pCoverArtFolderWrite.toStdString().c_str(), "wb");

                       Debug("processing the file "<< pMp3pathToImage.toStdString());

                       fwrite(pictureFrame->picture().data(), pictureFrame->picture().size(), 1, fout);
                       fclose(fout);

                       Debug(" The picture has been written to");

                       mMp3path = "file:///" + pCoverArtFolderWrite;
                   }
               }
               else
               {
                   DebugErr("there seem to be no picture frames (APIC) frames in this file");
                   mMp3path = "undefined_audio";
               }
           }
           else
           {
               DebugErr("File = "<<pMp3pathToImage.toStdString()<<"does not appear to have any mp3 tags");
               mMp3path = "undefined_audio";
           }
       }
       else
       {
           DebugErr("File = "<<pMp3pathToImage.toStdString()<<" not audio file");
           mMp3path = "undefined";
       }

   }
protected:
   QString mMp3path;
   QString mMp3artist;
   QString mMp3track;
   QString mMp3album;
};


#endif // UTILTS_H

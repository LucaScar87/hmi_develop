#include "coverart.h"

CoverArt::CoverArt(QObject *parent)
    : QObject(parent),
    QQuickImageProvider(QQmlImageProviderBase::Image)
{
}

QImage CoverArt::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    if(mCoverArt.isNull()){
           Debug("Request image: (image is null)");
       }else{
           Debug("Request image: image is OK");
       }
       return mCoverArt;
}


void CoverArt::writeCoverArt(const QString pMp3pathToImage)
{
   Debug("File name:"<< pMp3pathToImage.toStdString().substr(8));

   TagLib::FileName filename(pMp3pathToImage.toStdString().substr(8).c_str());

   TagLib::String fileType = filename.toString().substr(filename.toString().size() - 3).upper();

   if(fileType == "M4A"){
       Debug("M4A file");
       TagLib::MP4::File mp4File(filename);
       TagLib::MP4::Tag * mp4Tag = mp4File.tag();
       TagLib::MP4::ItemListMap mp4ItemsListMap = mp4Tag->itemListMap();
       TagLib::MP4::Item mp4CoverItem = mp4ItemsListMap["covr"];
       TagLib::MP4::CoverArtList coverArtList = mp4CoverItem.toCoverArtList();

       mMp3artist = mp4Tag->artist().toCString();
       mMp3track = mp4Tag->title().toCString();
       mMp3album = mp4Tag->album().toCString();

       Debug("mMp3artist:"<<mMp3artist.toStdString().c_str());

       if (!coverArtList.isEmpty()){
           Debug("coverArtList is not Empty()");
           TagLib::MP4::CoverArt coverArt = coverArtList.front();
           mCoverArt.loadFromData((const uchar *)
                              coverArt.data().data(),coverArt.data().size());
           mMp3path = "image://coverart";
       }else{
           mMp3path = "undefined_audio";
           Debug("coverArtList is Empty()");
       }
   }else if(fileType == "MP3"){
       Debug("MP3 file");
       TagLib::MPEG::File mp3File(filename);
       Tag * mp3Tag;
       FrameList listOfMp3Frames;
       AttachedPictureFrame * pictureFrame;

       mp3Tag = mp3File.ID3v2Tag();
       if(mp3Tag){
           listOfMp3Frames = mp3Tag->frameListMap()["APIC"];
           mMp3artist = mp3Tag->artist().toCString();
           mMp3track = mp3Tag->title().toCString();
           mMp3album = mp3Tag->album().toCString();

           if(!listOfMp3Frames.isEmpty()){
               FrameList::ConstIterator it= listOfMp3Frames.begin();
               for(; it != listOfMp3Frames.end() ; it++){
                   pictureFrame = static_cast<AttachedPictureFrame *> (*it);
                   Debug("processing the file "<< pMp3pathToImage.toStdString());
                   mCoverArt.loadFromData((const uchar *)pictureFrame->picture().data(),pictureFrame->picture().size());
                   mMp3path = "image://coverart";
               }
           }else{
               DebugErr("There seem to be no picture frames (APIC) frames in this file");
               mMp3path = "undefined_audio";
           }
       }else{
           DebugErr("File = "<<pMp3pathToImage.toStdString()<<"does not appear to have any mp3 tags");
           mMp3path = "undefined_audio";
           mMp3artist = "";
           mMp3track = "";
           mMp3album = "";
       }
   }else if(fileType == "MP4"){
       DebugErr("File = "<<pMp3pathToImage.toStdString()<<" is a video file");
       mMp3path = "video_file";
       mMp3artist = "";
       mMp3track = "";
       mMp3album = "";
   }else{
       DebugErr("File = "<<pMp3pathToImage.toStdString()<<" not audio file");
       mMp3path = "undefined_audio";
       mMp3artist = "";
       mMp3track = "";
       mMp3album = "";
   }

}

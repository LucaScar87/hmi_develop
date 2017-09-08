/*********************************************************************************************************************************
 *Description: A simple program using taglib to extract pictures attached to mp3 id3v2 tags
 *Author: Dr Deo [at] stackoverflow *dot* com
 *AOB: I hope you will find this useful and are free to use it for anything, but there is no waranty and use at your own risk :)
 *********************************************************************************************************************************
*/
#include<iostream>
#include<stdio.h>

/*taglib specific includes*/
#include<tbytevector.h>//ByteVector
#include<mpegfile.h>//mp3 file
#include<id3v2tag.h>//tag
#include<id3v2frame.h>//frame
#include <attachedPictureFrame.h>//attachedPictureFrame

using namespace std ;
using namespace TagLib::ID3v2 ;

int main(int argc, char * argv[])
{
    if(argc !=2)
    {
        cout<<"usage: drag an mp3 file on to the program and it will extract the attached image"<<endl<<endl;
        system("pause");//on linux you can replace this with cin.get()
        exit(1);
    }

    TagLib::MPEG::File mp3File(argv[1]);
    Tag * mp3Tag;
    FrameList listOfMp3Frames;
    AttachedPictureFrame * pictureFrame;

    mp3Tag= mp3File.ID3v2Tag();
    if(mp3Tag)
    {
        listOfMp3Frames = mp3Tag->frameListMap()["APIC"];//look for picture frames only
        if(!listOfMp3Frames.isEmpty())
        {
            FrameList::ConstIterator it= listOfMp3Frames.begin();
            for(; it != listOfMp3Frames.end() ; it++)
            {
                pictureFrame = static_cast<AttachedPictureFrame *> (*it);//cast Frame * to AttachedPictureFrame*

                //Warning. format of picture assumed to be jpg. This may be false, for example it may be png.
                FILE * fout;
                fopen_s(&fout, "outputFile.jpg", "wb");
                cout<<"processing the file "<< argv[1] <<endl<<endl;
                fwrite(pictureFrame->picture().data(), pictureFrame->picture().size(), 1, fout);
                fclose(fout);
                cout<<" The picture has been written to \t outputFile.jpg  \nRemember that the file type .jpg is just assumed for simplicity"<<endl<<endl;
            }
        }
        else cerr<<"there seem to be no picture frames (APIC) frames in this file"<<endl<<endl;
    }
    else cerr<<"the file "<<argv[1]<<"does not appear to have any mp3 tags"<<endl<<endl;

    system("pause");//on linux you can replace this with cin.get()
    return 0;
}

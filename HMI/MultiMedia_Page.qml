import QtQuick 2.4

MultiMedia_PageForm {
    fileDialog.onAccepted: {
        coverart.writeCoverArt(fileDialog.fileUrl)
        mediaplayer.source = fileDialog.fileUrl
        track_name.text = qsTr(coverart.mMp3artist + " - " + coverart.mMp3track)
        album_name.text = qsTr(coverart.mMp3album)
        track_name.visible = (coverart.mMp3artist.length == 0)?false:true
        album_name.visible = (coverart.mMp3album.length == 0)?false:true
        info_name.visible = (coverart.mMp3artist.length == 0 || coverart.mMp3track.length == 0)?false:true

        if(coverart.mMp3path == "undefined_audio"){
            coverArt_animatedimage.visible = true;
            coverArt_animatedimage.playing = !AnimatedImage.Ready
            coverArt_image.visible = false;
            placeholder_image.visible = false
            videoOutput.visible = false
        }else if(coverart.mMp3path == "video_file"){
            coverArt_image.visible = false
            coverArt_animatedimage.visible = false
            videoOutput.visible = true
            placeholder_image.visible = false
            mediaplayer.pause()
        }else{
            coverArt_image.source =  coverart.mMp3path + "?abc=" + Math.random()
            coverArt_animatedimage.visible = false
            videoOutput.visible = false
            placeholder_image.visible = false
            coverArt_image.visible = true
        }

        if(info_name.visible == true){
            coverArt_image.anchors.leftMargin = 300
            coverArt_animatedimage.anchors.leftMargin = 300
        }else{
            coverArt_image.anchors.leftMargin = 70
            coverArt_animatedimage.anchors.leftMargin = 70
        }
    }
    fileDialog.onRejected: {
        //console.log("Canceled")
        //Qt.quit()
    }
    fileManager_stop.onPressedChanged: {
        if(fileDialog.fileUrl != ""){
            mediaplayer.stop()
            track_name.visible = false
            album_name.visible = false
            placeholder_image.visible = true
            coverArt_animatedimage.visible = false
            coverArt_image.visible = false
            info_name.visible = false
            coverArt_animatedimage.playing = !AnimatedImage.Ready
        }
    }
    fileManager_pause.onPressedChanged:
    {
        coverArt_animatedimage.playing = !AnimatedImage.Ready
        mediaplayer.pause()
    }
    fileManager_play.onPressedChanged: {
        if(fileDialog.fileUrl != ""){
            mediaplayer.play()

            if(mediaplayer.hasVideo === true || mediaplayer.hasAudio === true){
                videoOutput.visible = (mediaplayer.hasVideo === true)?true:false
                if(coverart.mMp3path == "video_file"){
                    coverArt_animatedimage.visible = false
                    coverArt_image.visible = false
                    placeholder_image.visible = false
                }else if(coverart.mMp3path == "undefined_audio" ){
                    coverArt_animatedimage.visible = true
                    coverArt_animatedimage.playing = AnimatedImage.Ready
                    coverArt_image.visible = false
                    placeholder_image.visible = false
                }else{
                    coverArt_image.visible = true
                    coverArt_animatedimage.visible = false
                    placeholder_image.visible = false
                }

                track_name.visible = (mediaplayer.hasVideo === true)?false:true
                info_name.visible = (coverart.mMp3artist.length == 0 || coverart.mMp3track.length == 0)?false:true
            }
        }
    }
}

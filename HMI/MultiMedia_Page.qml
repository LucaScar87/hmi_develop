import QtQuick 2.4

MultiMedia_PageForm {


    fileDialog.onAccepted: {
        //DEBUG
        //console.log("You chose: " + fileDialog.fileUrls)

    }
    fileDialog.onRejected: {
        console.log("Canceled")
        //Qt.quit()
    }

    fileManager_stop.onPressedChanged: mediaplayer.stop()
    fileManager_pause.onPressedChanged: mediaplayer.pause()
    fileManager_play.onPressedChanged: {
        mediaplayer.play()
        //DEBUG
        //console.log("Has video?:" + mediaplayer.hasVideo)
        //console.log("Has audio?:" + mediaplayer.hasAudio)
        videoOutput.visible = (mediaplayer.hasVideo == 1)?true:false
        placeholder_music.visible = (mediaplayer.hasVideo == 0)?true:false
        placeholder_music.source = (mediaplayer.metaData.coverArtUrlLarge)?mediaplayer.metaData.coverArtUrlLarge:"placeholder_music.jpg"
        track_name.text = qsTr(mediaplayer.metaData.author + " - " + mediaplayer.metaData.title)
        console.log("albumTitle:" + mediaplayer.metaData.albumTitle)
        console.log("albumArtist:" + mediaplayer.metaData.albumArtist)
        console.log("title:" + mediaplayer.metaData.title)
        console.log("author:" + mediaplayer.metaData.author)
        console.log("coverArtUrlLarge:" + mediaplayer.metaData.coverArtUrlLarge)
        console.log("coverArtUrlSmall:" + mediaplayer.metaData.coverArtUrlSmall)
    }
}

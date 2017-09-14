import QtQuick 2.4

MultiMedia_PageForm {


    fileDialog.onAccepted: {
        coverArt.setMp3Path(fileDialog.fileUrl,fileDialog.folder)
        placeholder_music.source = (coverArt.mMp3path == "undefined_audio")?"placeholder_music.jpg":coverArt.mMp3path
        track_name.text = qsTr(coverArt.mMp3artist + " - " + coverArt.mMp3track)
        track_name.visible = (coverArt.mMp3path == "undefined")?false:true
        placeholder_music.visible = true
        mediaplayer.stop()
    }
    fileDialog.onRejected: {
        //console.log("Canceled")
        //Qt.quit()
    }

    fileManager_stop.onPressedChanged: {
        mediaplayer.stop()
        track_name.visible = false
        placeholder_music.visible = false

    }
    fileManager_pause.onPressedChanged: mediaplayer.pause()

    fileManager_play.onPressedChanged: {
        mediaplayer.play()
        videoOutput.visible = (mediaplayer.hasVideo === 1)?true:false
        placeholder_music.visible = (mediaplayer.hasVideo === 1)?false:true
        track_name.visible = (mediaplayer.hasVideo === 1)?false:true
        track_name.text = qsTr(mediaplayer.metaData.author + " - " + mediaplayer.metaData.title)
    }
}

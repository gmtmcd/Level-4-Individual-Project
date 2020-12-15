//
//  RecordingRowView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 11/12/2020.
//

import SwiftUI

/**
 View to show a row for each recording made
 Used within RecordingsListView
 Controls the users ability to click on playback on a row and hear back their audio
 Shows the name of the audio as the title
 */
struct RecordingRowView: View {
    var audioURL: URL
    
    @ObservedObject var playbackAudio = PlaybackAudio()
    
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
            Spacer()

            if playbackAudio.isPlayingBack == false {
                // Button to play audio back
                Button(action: {
                    self.playbackAudio.startAudioPlayback(audio: self.audioURL)
                }) {
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                }
            } else {
                // Button to stop the playback of audio
                Button(action: {
                    self.playbackAudio.stopAudioPlayback()
                }) {
                    Image(systemName: "stop.fill")
                        .imageScale(.large)
                }
            }
        }
    }
}

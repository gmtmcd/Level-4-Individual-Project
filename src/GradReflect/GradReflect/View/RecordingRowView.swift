//
//  RecordingRowView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 11/12/2020.
//

import SwiftUI

struct RecordingRowView: View {
    var audioURL: URL
    
    @ObservedObject var playbackAudio = PlaybackAudio()
    
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
            Spacer()

            if playbackAudio.isPlayingBack == false {
                Button(action: {
                    self.playbackAudio.startAudioPlayback(audio: self.audioURL)
                }) {
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                }
            } else {
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

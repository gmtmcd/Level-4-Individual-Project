//
//  RecordingsListView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 03/12/2020.
//

import SwiftUI

struct RecordingsListView: View {
    
    @ObservedObject var recordAudio: RecordAudio
    
    var body: some View {
        List {
            ForEach(recordAudio.recordings, id: \.dateCreated){ recording in
                RecordingsRowView(audioURL: recording.fileURL)
            }
        }
    }
}

struct RecordingsRowView: View {
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

struct RecordingsListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsListView(recordAudio: RecordAudio())
    }
}

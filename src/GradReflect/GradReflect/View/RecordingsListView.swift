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
    
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
            Spacer()
        }
    }
}

struct RecordingsListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsListView(recordAudio: RecordAudio())
    }
}

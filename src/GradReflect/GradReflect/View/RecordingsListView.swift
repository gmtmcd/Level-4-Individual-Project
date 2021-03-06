//
//  RecordingsListView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 03/12/2020.
//

import SwiftUI

/**
 View to display all the previous recordings made by user
 Allows user to delete notes
 Used within RecordingsView
 */
struct RecordingsListView: View {
    
    @ObservedObject var recordAudio: RecordAudio
    
    // Main body view
    var body: some View {
        List {
            Section(header:
                        HStack {
                            Image(systemName: "info.circle.fill")
                            Text("Enter filename before recording, clear filename before making new recording")
                        }){
                ForEach(recordAudio.recordings, id: \.dateCreated){ recording in
                    RecordingRowView(audioURL: recording.fileURL)
                }
                .onDelete(perform:delete)
            }
            .textCase(nil)
            
        } // End of list
        .listStyle(InsetGroupedListStyle())
    }
    
    // Function to add ability to delete a recording using inbuilt delete, offsets represent which row is being deleted
    func delete(at offsets: IndexSet){
        var urlsBeingDeleted = [URL]()
        for index in offsets {
            urlsBeingDeleted.append(recordAudio.recordings[index].fileURL)
        }
        recordAudio.deleteAudios(urlsBeingDeleted: urlsBeingDeleted)
    }
    
}

// Preview
struct RecordingsListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsListView(recordAudio: RecordAudio())
    }
}

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
            Text("empty list for now")
        }
    }
}

struct RecordingsListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsListView(recordAudio: RecordAudio())
    }
}

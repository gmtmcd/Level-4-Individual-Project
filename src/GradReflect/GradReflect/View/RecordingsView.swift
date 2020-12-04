//
//  RecordingsView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 03/12/2020.
//

import SwiftUI

struct RecordingsView: View {
    //add when letting this view be accessed
    //@StateObject var router: Router
    
    @ObservedObject var recordAudio: RecordAudio
    
    
    var body: some View {
        NavigationView {
            VStack {
                // Present list of recordings
                RecordingsListView(recordAudio: recordAudio)
                
                // Record or stop recording buttons shown depending on whether there is a recording happening
                if recordAudio.isRecording == false {
                    Button(action: {self.recordAudio.startRecording()}){
                        Image(systemName: "record.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                } else {
                    Button(action: {self.recordAudio.stopRecording()}){
                        Image(systemName: "stop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                }
                
            } // end of stack
            .navigationBarTitle("Reflection Recording")
        } // end of nav view
        
        
    }
}

struct RecordingsView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsView(recordAudio: RecordAudio())
    }
}

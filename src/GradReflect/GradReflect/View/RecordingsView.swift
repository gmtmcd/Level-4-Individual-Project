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
    @State var usersFileName: String = ""
    @StateObject var router: Router
    
    var body: some View {
        NavigationView {
            VStack {
                // Present list of recordings
                RecordingsListView(recordAudio: recordAudio)
                TextField("Enter Name for recording", text: $usersFileName)
                    .modifier(ClearButton(text: $usersFileName))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                
                // Record or stop recording buttons shown depending on whether there is a recording happening
                if recordAudio.isRecording == false {
                    Button(action: {self.recordAudio.startRecording(usersFileName: usersFileName)}){
                        Image(systemName: "record.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                } else {
                    Button(action: {self.recordAudio.stopRecording()}){
                        Image(systemName: "stop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                }
                
            } // end of stack
            .navigationBarTitle("Reflection Recording")
            .navigationBarItems(
                leading: Button(action: {
                    router.currentPage = .SkillView
                }, label: {
                    Text("Home")
                }))
        } // end of nav view
        
        
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        HStack{
            content
            if !text.isEmpty {
                Button(
                    action: {self.text = ""},
                    label: {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    })
            }
        }
    }
}

struct RecordingsView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsView(recordAudio: RecordAudio(), router: Router())
    }
}

//
//  RecordingsView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 03/12/2020.
//

import SwiftUI
import AVFoundation

struct RecordingsView: View {
    
    @ObservedObject var recordAudio: RecordAudio
    @State var usersFileName: String = ""
    @StateObject var router: Router
    
    @State var alert = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Present list of recordings
                RecordingsListView(recordAudio: recordAudio)
                
                // Get the filename for a recording
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
            .navigationBarTitle("Recordings 🎙", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    router.currentPage = .SkillView
                }, label: {
                    Text("Home")
                }),
                trailing: EditButton())
            
            // Alert for when there is no permission for microphone, redirects to skills
            .alert(isPresented: $alert) { () -> Alert in
                let button = Alert.Button.default(Text("Go back to skills")){
                    print("going back to skills")
                    router.currentPage = .SkillView
                }
                return Alert(title: Text("Permissions Required"), message: Text("Go to settings to enable access"), dismissButton: button)
            }
            
            // when this view appears, check that the user has permission for mic
            .onAppear{
                do{
                    let session = AVAudioSession.sharedInstance()
                    try session.setCategory(.playAndRecord)
                    
                    // check permission
                    session.requestRecordPermission { (granted) in
                        // If no permission then display the error, redirect to skill page
                        if !granted{
                            self.alert.toggle()
                        }
                        // otherwise carry on
                        else{
                            print("Permissions enabled")
                        }
                    }
                }
                catch{
                    print("Error with the permissions checker")
                }
            }
        } // end of nav view
        
    }
}

// Button to clear the text field once a user has created a recording and wants to name a new one
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

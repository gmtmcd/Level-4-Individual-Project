//
//  AboutThisAppView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 15/12/2020.
//

import SwiftUI

struct AboutThisAppView: View {
    
    @StateObject var router: Router
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("What is this app?")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(10)
                    Section{
                        Text("Grad Reflect is a space for you to reflect, using Cognitive Behavioral Therapy (CBT), on experiences where you've used your graduate attributes.\n\nGraduate attributes, sometimes referred to as 'soft skills', are skills learned during someone's time at university that aren't necessarily a direct result of the courses they are doing. They are considered vital in the workplace, with employers often noting that these skills are considered more important than technical based skills that can be taught after hiring.\n\nThese can involve, but are not limited to:\n - Communication \n - Critical thinking \n - Adaptability \n - Teamwork \n - Self-efficacy \n - Application of knowledge \n - Ethics \n - Professionalism.\n\nBy using CBT techniques this app hopes to encourage the development of these skills that evolve through your real-world experiences and reflection.")
                    }
                    .padding(5)
                    
                    Text("How to use this app")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(10)
                    Section(header: Text("Home 🏠")){
                        Text("Here you can find details of all the skills you will be developing through the use of this app. Each skill has a description to help you understand what situations can be reflected on and how this skill can be used in the workplace.\n\nIf you are familiar with these skills the skill cards can be skipped and you can head straight to any section of the app.")
                    }
                    .padding(5)
                    Section(header: Text("My Notes 📘")){
                        Text("This section is for collecting any reflections you make on your daily experiences. Each note takes a CBT approach to the questions it asks, encouraging deeper and more meaningful reflections that will help you develop an awareness of how and when you use these skills.\n\nEach section reflects the CBT model of Situation, Thoughts, Emotions, Behaviour and Future Alternative Thought/Behaviour.\n\nNotes require a title to be saved. Once saved notes can be reviewed and deleted, they cannot be edited to immitate the written note format of CBT. There is also a search functionality that can be used to search for the title of a note or a skill type to filter the notes shown by a skill.")
                    }
                    .padding(5)
                    Section(header: Text("Recordings 🎙")){
                        Text("This section can be used when you don't have enough time to make a full written note and want to quickly make a recording.\n\nIf you want to name a recording, enter in the filename into the textfield before pressing the record button. This will name the recording your chosen name followed by the date and time of the recording. If no name is given the recording will just be given the date and time. \n\nIf you want to make two recordings in a row, the previous recording title must be removed from the text field to enter in the new one or leave it blank.\n\nRecordings can be played back, paused, and deleted.\n\nTo enable recordings you must allow access to the microphone in the settings for this app on your device.")
                    }
                    .padding(5)
                    Section(header: Text("Statistics 📊")){
                        Text("This section gives you feedback on the stats of your notes. Stats are separated by skill and follow the same corresponding colour scheme as the skill cards.")
                    }
                    .padding(5)
                    Section(header: Text("Settings ⚙️")){
                        Text("Here you can find details about the app. This section also allows you to change the theme of the app to suit your preferences.\nYou can turn on notifcations which at the moment will fire a notification 10 seconds after pressing as the app is a proof of concept. In future versions of the app this will turn on notifications to fire once a week to encourage you to maintain a steady schedule of reflection.\n You can find useful links here for more information as well as a link to the developer GitHub.")
                    }
                    .padding(5)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                                HStack {
                                    Text("About This App")
                                    Image(systemName: "info.circle.fill")
                                }
                            }
            }
            .navigationBarItems(
                leading: Button(action: {
                    withAnimation{
                        router.currentPage = .SettingsView
                    }
                }, label: {
                    Text("Back")
                }))

            
        }
        
    }
}

struct AboutThisAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutThisAppView(router: Router())
    }
}

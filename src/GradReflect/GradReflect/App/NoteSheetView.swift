//
//  NoteSheetView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 03/11/2020.
//

import SwiftUI
import CoreData

struct NoteSheetView: View {
    let gradAttribute = ["Communication", "Critical Thinking", "Adaptability", "Teamwork", "Self-Efficacy", "Ethics & Professionalism"]
    //let currentDateTime = Date()

    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode

    @State var selectedAttribute = 1
    @State var situation = ""
    @State var thoughts = ""
    @State var emotionsScale: Float = 0.0
    @State var behaviour = ""
    @State var futureAlternate = ""
    @State var whyEmotions = ""
    @State var name = ""
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Note Title:")) {
                    TextField("Title", text: $name)
                        .keyboardType(.default)
                }
                
                Section(header : Text("Choose the applicable soft skill")) {
                    Picker(selection: $selectedAttribute, label: Text("Graduate Attribute")) {
                        ForEach(0 ..< gradAttribute.count){
                            Text(self.gradAttribute[$0]).tag($0)
                        }
                    }
                    //where the stepper would be
                }
                
                Section(header: Text("Describe the situation in which you developed this skill")) {
                    TextField("Situation", text: $situation)
                        .keyboardType(.default)
                }
                
                Section(header: Text("Describe the thoughts you had during this event")) {
                    TextField("Thoughts", text: $thoughts)
                        .keyboardType(.default)
                }
                
                Section(header: Text("Describe how you felt during this event")) {
                    HStack {
                        Image(systemName: "hand.thumbsdown")
                            .resizable()
                            .frame(width:20, height: 20)
                        Slider(value: $emotionsScale, in: 1.0...5.0)
                            .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .frame(width:20, height: 20)
                    }
                    .padding()
                    Text("Value: \(Int(emotionsScale))")
                }
                
                Section(header: Text("Describe why you believe you felt this way")) {
                    TextField("Cause of emotions", text: $whyEmotions)
                        .keyboardType(.default)
                }
                
                Section(header: Text("How did this make you behave, examine the cause and effect")) {
                    TextField("Behaviour", text: $behaviour)
                        .keyboardType(.default)
                }
                
                Section(header: Text("How will behave in the future in a similar situation, the same or different, and why?")) {
                    TextField("Future Actions", text: $futureAlternate)
                        .keyboardType(.default)
                }
                
                Button(action: {
                    let newNote = NoteEntry(context: viewContext)
                    newNote.name = self.name
                    newNote.entryTime = Date()
                    newNote.gradAttribute = self.gradAttribute[self.selectedAttribute]
                    newNote.situation = self.situation
                    newNote.thoughts = self.thoughts
                    //newNote.emotions = self.emotions
                    newNote.emotionsScale = self.emotionsScale
                    newNote.whyEmotions = self.whyEmotions
                    newNote.behaviour = self.behaviour
                    newNote.futureAlternate = self.futureAlternate
                    newNote.id = UUID()
                    do {
                        try viewContext.save()
                        print("Note saved.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Save Note")
                }
            }
            .navigationTitle("Create New Note")
        }
    }
}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

struct NoteSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NoteSheetView()
    }
}

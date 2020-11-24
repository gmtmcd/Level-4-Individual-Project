//
//  NoteAddView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 03/11/2020.
//

import SwiftUI
import CoreData

struct NoteAddView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    let gradAttribute = ["Communication", "Critical Thinking", "Adaptability", "Teamwork", "Self-Efficacy", "Ethics & Professionalism"]

    @State var name = ""
    @State var selectedAttribute = 1
    @State var situation = ""
    @State var thoughts = ""
    @State var emotionsScale: Float = 0.0
    @State var behaviour = ""
    @State var futureAlternate = ""
    @State var whyEmotions = ""
    
    // State controlling the alerts being shown
    @State private var showingTitleInfo = false
    @State private var showingSkillInfo = false
    @State private var showingSituationInfo = false
    @State private var showingThoughtsInfo = false
    @State private var showingEmotionsInfo = false
    @State private var showingBehaviourInfo = false
    @State private var showingFutureInfo = false
    @State private var showingWhyInfo = false
    
    
    var body: some View {
        NavigationView {
            Form {
                // NOTE TITLE
                Section(header: Button(action: {
                    self.showingTitleInfo = true
                    }, label: {
                        Text("Note Title:")
                        Image(systemName : "questionmark.circle.fill")
                            .imageScale(.large)
                        
                    }).alert(isPresented: $showingTitleInfo) {
                        Alert(title: Text("Question Info"), message: Text("Give your note a title, this is how the note will be stored for reviewing later"), dismissButton: .default(Text("OK")))
                    }
                ) {
                    TextField("Title", text: $name)
                        .keyboardType(.default)
                }
                
                // NOTE SKILL
                Section(header: Button(action: {
                    self.showingSkillInfo = true
                    }, label: {
                        Text("What graduate skill did you develop?")
                        Image(systemName : "questionmark.circle.fill")
                            .imageScale(.large)
                        
                    }).alert(isPresented: $showingSkillInfo) {
                        Alert(title: Text("Question Info"), message: Text("You will be asked to reflect based on an experience where you feel you have developed on one of these skills. Throughout the survey, an example of an experience where someone settled a dispute in their team will be used to assist in your own reflection."), dismissButton: .default(Text("OK")))
                    }
                ) {
                    Picker(selection: $selectedAttribute, label: Text("Graduate Attribute")) {
                        ForEach(0 ..< gradAttribute.count){
                            Text(self.gradAttribute[$0]).tag($0)
                        }
                    }
                }
                
                //NOTE SITUATION
                Section(header: Button(action: {
                    self.showingSituationInfo = true
                    }, label: {
                        Text("Describe the situation in which you developed this skill")
                        Image(systemName : "questionmark.circle.fill")
                            .imageScale(.large)
                        
                    }).alert(isPresented: $showingSituationInfo) {
                        Alert(title: Text("Question Info"), message: Text("The situation is the concrete experience, this only covers the facts of what happened with no interpretation. An example could include settling a dispute between peers for Teamwork"), dismissButton: .default(Text("OK")))
                    }
                ) {
                    TextField("Situation", text: $situation)
                        .keyboardType(.default)
                }
                
                //NOTE THOUGHTS
                Section(header: Button(action: {
                    self.showingThoughtsInfo = true
                    }, label: {
                        Text("What were your thoughts during this experience?")
                        Image(systemName : "questionmark.circle.fill")
                            .imageScale(.large)
                        
                    }).alert(isPresented: $showingThoughtsInfo) {
                        Alert(title: Text("Question Info"), message: Text("Thoughts help to interpret a situation, there are different ways to interpret a single situation. These thoughts can be positive or negative. For example, thinking that a dispute between your peers could cause delays further down the line, thinking it could damage the overall harmony of the team, etc"), dismissButton: .default(Text("OK")))
                    }
                ) {
                    TextField("Thoughts", text: $thoughts)
                        .keyboardType(.default)
                }
                
                //NOTE EMOTIONS
                Section(header: Button(action: {
                    self.showingEmotionsInfo = true
                    }, label: {
                        Text("How did you feel during this situation?")
                        Image(systemName : "questionmark.circle.fill")
                            .imageScale(.large)
                        
                    }).alert(isPresented: $showingEmotionsInfo) {
                        Alert(title: Text("Question Info"), message: Text("These emotions will be based on your thoughts about the experience and can be both negative and positive. This scale does not describe the scenario, but instead your emotional response to the experience."), dismissButton: .default(Text("OK")))
                    }
                ) {
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

                //NOTE WHY EMOTIONS
                Section(header: Button(action: {
                    self.showingWhyInfo = true
                    }, label: {
                        Text("Why do you think you felt this way?")
                        Image(systemName : "questionmark.circle.fill")
                            .imageScale(.large)
                        
                    }).alert(isPresented: $showingWhyInfo) {
                        Alert(title: Text("Question Info"), message: Text("The reasons behind your emotions can stem from many things, it could be the result of previous experiences, foreseeable impacts, etc. For example, in a team dispute, a person could feel negative because in a previous team it resulted in a bad working environment. An example of why they could feel positive could be that it gave them the opportunity to take a proactive role in settling the dispute, creating a good environment for their team."), dismissButton: .default(Text("OK")))
                    }
                ) {
                    TextField("Cause of emotions", text: $whyEmotions)
                        .keyboardType(.default)
                }
                
                //NOTE BEHAVIOUR
                Section(header: Button(action: {
                    self.showingBehaviourInfo = true
                    }, label: {
                        Text("How did you behave in this experience?")
                        Image(systemName : "questionmark.circle.fill")
                            .imageScale(.large)
                        
                    }).alert(isPresented: $showingBehaviourInfo) {
                        Alert(title: Text("Question Info"), message: Text("This requires you to examine the cause and effect.  How does the resulting behaviour directly relate to your thoughts and feelings? For example, someone taking two arguing team members aside and discussing how to compromise. This could be because they did not want to ruin the team environment that had been positive up until the dispute, and wanted to create the best product they could as a team."), dismissButton: .default(Text("OK")))
                    }
                ) {
                    TextField("Behaviour", text: $behaviour)
                        .keyboardType(.default)
                }
                
                
                //NOTE FUTURE
                Section(header: Button(action: {
                    self.showingFutureInfo = true
                    }, label: {
                        Text("How would you want to behave in the future? Would you act the same or differently, and why?")
                        Image(systemName : "questionmark.circle.fill")
                            .imageScale(.large)
                        
                    }).alert(isPresented: $showingFutureInfo) {
                        Alert(title: Text("Question Info"), message: Text("Here we are examining alternate thought. You have to examine all of your previous answers and decide if this is how you would handle a similar situation, and whether your behaviour resulted in the best possible outcome. This will help you to make new connections and create different, more positive experiences in the future. For example, someone might behave in the same way in settling the dispute, however they may act sooner next time to ensure there is no impact on team cohesion."), dismissButton: .default(Text("OK")))
                    }
                ) {
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

struct NoteAddView_Previews: PreviewProvider {
    static var previews: some View {
        NoteAddView()
    }
}

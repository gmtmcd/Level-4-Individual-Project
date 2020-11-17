//
//  NoteReviewView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 10/11/2020.
//

import SwiftUI
import CoreData

struct NoteReviewView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    var reviewNote = NoteEntry()

    
    var body: some View {
        NavigationView {
            Form {
                Section(header : Text("Note Title:")) {
                    Text("\(reviewNote.name)")
                }
                
                Section(header : Text("Choose the applicable soft skill")) {
                    Text("\(reviewNote.gradAttribute)")
                }

                Section(header: Text("Describe the situation in which you developed this skill")) {
                    Text("\(reviewNote.situation)")
                }

                Section(header: Text("Describe the thoughts you had during this event")) {
                    Text("\(reviewNote.thoughts)")
                }

                Section(header: Text("Describe how you felt during this event")) {
                    Text("Value: \(Int(reviewNote.emotionsScale))")
                }

                Section(header: Text("Describe why you believe you felt this way")) {
                    Text("\(reviewNote.whyEmotions)")
                }

                Section(header: Text("How did this make you behave, examine the cause and effect")) {
                    Text("\(reviewNote.behaviour)")
                }

                Section(header: Text("How will behave in the future in a similar situation, the same or different, and why?")) {
                    Text("\(reviewNote.futureAlternate)")
                }
//                Button(action: {presentationMode.wrappedValue.dismiss()}){
//                    Text("Close Note")
//                }
            }
            .navigationTitle("Reviewing Note")
        }
    }
}

struct NoteReviewView_Previews: PreviewProvider {
    
    static var previews: some View {
        let reviewNote = NoteEntry(context: PersistenceController.preview.container.viewContext)
        reviewNote.name = "Note name"
        reviewNote.gradAttribute = "Critical Thinking"
        reviewNote.situation = "Critical Thinking"
        reviewNote.thoughts = "Critical Thinking"
        reviewNote.emotionsScale = 3
        reviewNote.whyEmotions = "Critical Thinking"
        reviewNote.behaviour = "Critical Thinking"
        reviewNote.futureAlternate = "Critical Thinking"

        return NoteReviewView(reviewNote: reviewNote)
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
    }
}

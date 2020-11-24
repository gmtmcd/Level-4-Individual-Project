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
    
    var reviewNote: NoteEntry

    
    var body: some View {
        NavigationView {
            Form {
                Section(header : Text("Note Title:")) {
                    Text("\(reviewNote.name)")
                }
                
                Section(header : Text("What graduate skill did you develop?")) {
                    Text("\(reviewNote.gradAttribute)")
                }

                Section(header: Text("Describe the situation in which you developed this skill")) {
                    Text("\(reviewNote.situation)")
                }

                Section(header: Text("What were your thoughts during this experience?")) {
                    Text("\(reviewNote.thoughts)")
                }

                Section(header: Text("How did you feel during this situation?")) {
                    Text("Value: \(Int(reviewNote.emotionsScale))")
                }

                Section(header: Text("Why do you think you felt this way?")) {
                    Text("\(reviewNote.whyEmotions)")
                }

                Section(header: Text("How did you behave in this experience?")) {
                    Text("\(reviewNote.behaviour)")
                }

                Section(header: Text("How would you want to behave in the future? Would you act the same or differently, and why?")) {
                    Text("\(reviewNote.futureAlternate)")
                }
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("Close Note")
                }
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

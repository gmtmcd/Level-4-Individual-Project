//
//  NotesRowView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 20/11/2020.
//

import SwiftUI

struct NotesRowView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var showNoteReview = false
    
    var reviewNote: NoteEntry
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("\(reviewNote.name)")
                    .font(.headline)
                Text("\(reviewNote.entryTime, formatter: itemFormatter)")
            }
            Spacer()
        }
        .frame(height:50)
        .onTapGesture{
            showNoteReview = true
        }
        .sheet(isPresented: $showNoteReview){
            NoteReviewView(reviewNote: reviewNote)
                .environment(\.managedObjectContext, viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


struct NotesRowView_Previews: PreviewProvider {
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
        reviewNote.entryTime = Date()
        
        return NotesRowView(reviewNote: reviewNote)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

//
//  NotesRowView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 20/11/2020.
//

import SwiftUI

/**
 View to present one row of notes
 Displays the name of the note and the time and date it was created
 Handles the tapping of a note in list to review the entry
 Used in NotesListView
 */
struct NotesRowView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var showNoteReview = false
    
    var reviewNote: NoteEntry
    
    // Main body view
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("\(reviewNote.name)")
                    .font(.headline)
                Text("\(reviewNote.entryTime, formatter: itemFormatter)")
            }
            Spacer()
        } // End of HStack
        // Make the whole row tappable
        .contentShape(Rectangle())
        .frame(height:50)
        // When user taps on a note, display the note entry on a view
        .onTapGesture{
            showNoteReview = true
        }
        .sheet(isPresented: $showNoteReview){
            NoteReviewView(reviewNote: reviewNote)
                .environment(\.managedObjectContext, viewContext)
        }
    }
}

// Formats the date and time of the entry
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_GB")
    formatter.setLocalizedDateFormatFromTemplate("dd/MM/yy H:mm")
    return formatter
}()

// Preview
struct NotesRowView_Previews: PreviewProvider {
    // Dummy data to use for the preview
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

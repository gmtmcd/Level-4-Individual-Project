//
//  NotesListView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI
import CoreData

/**
 View to contain all the notes a user has created
 Allows a user to review a note and create a new one and search and filter the notes
 */
struct NotesListView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @State var showNoteSheet = false
    
    // Gather notes created by user from Core Data sorted by the date entered
    @FetchRequest(entity:NoteEntry.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \NoteEntry.entryTime, ascending:false)])
    var notes: FetchedResults<NoteEntry>

    // Controls which view is shown
    @StateObject var router: Router
    
    // Holds users search term to filter notes
    @State private var searchTerm = ""
    
    // Main body view
    var body: some View{
        NavigationView {
            VStack{
                SearchBarView(searchTerm: $searchTerm)
                
                // Displays the list of notes with or without the filter entered
                List {
                    ForEach((notes.filter({ searchTerm.isEmpty ? true : ($0.name.localizedCaseInsensitiveContains(searchTerm) || $0.gradAttribute.localizedCaseInsensitiveContains(searchTerm)) }))) { note in
                        NotesRowView(reviewNote:note)
                            .environment(\.managedObjectContext, viewContext)
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewContext.delete(notes[index])
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } // End of List
                .listStyle(PlainListStyle())
                .navigationBarTitle("My Notes 📘", displayMode: .inline)
                .navigationBarItems(
                    // Buttons to return to Skill Cards
                    leading: Button(action: {
                        withAnimation{
                            router.currentPage = .SkillView
                        }
                    }, label: {
                        Text("Home")
                    }),
                    
                    // Button to show view to create a new note
                    trailing:Button(action: {
                    showNoteSheet = true
                    }, label: {
                        Image(systemName : "note.text.badge.plus")
                            .imageScale(.large)
                    }))
                    .sheet(isPresented: $showNoteSheet){
                        NoteAddView()
                            .environment(\.managedObjectContext, viewContext)
                    }
            } // End of VStack
        } // End of Nav View
    }
}

// Preview
struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView(router: Router()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

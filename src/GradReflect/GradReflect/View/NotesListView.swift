//
//  NotesListView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI
import CoreData

struct NotesListView: View {

    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity:NoteEntry.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \NoteEntry.entryTime, ascending:false)])
    var notes: FetchedResults<NoteEntry>

    @State var showNoteSheet = false
    
    @StateObject var router: Router
    
    //should this be here??
    @State private var searchTerm = ""
    

    var body: some View{
        NavigationView {
            VStack{
                SearchBarView(searchTerm: $searchTerm)
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
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("My Notes 📘", displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action: {
                        router.currentPage = .SkillView
                    }, label: {
                        Text("Home")
                    }),
                    
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
            }
            
        }
    }
}


struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView(router: Router()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

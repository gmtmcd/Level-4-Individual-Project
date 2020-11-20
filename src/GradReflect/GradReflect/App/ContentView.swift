//
//  ContentView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity:NoteEntry.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \NoteEntry.entryTime, ascending: true)])
    var notes: FetchedResults<NoteEntry>

    @State var showNoteSheet = false
    
    @StateObject var router: Router
    

    var body: some View{
        NavigationView {
            List {
                ForEach(notes) { note in
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
            .navigationTitle("My Notes")
            .navigationBarItems(
                leading: Button(action: {
                    router.currentPage = .page1
                }, label: {
                    Text("Menu")
                }),
                
                trailing:Button(action: {
                showNoteSheet = true
                }, label: {
                    Image(systemName : "plus.circle")
                        .imageScale(.large)
                }))
                .sheet(isPresented: $showNoteSheet){
                    NoteSheetView()
                        .environment(\.managedObjectContext, viewContext)
                }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView(router: Router()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

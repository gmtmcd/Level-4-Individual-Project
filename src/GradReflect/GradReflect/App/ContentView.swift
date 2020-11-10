//
//  ContentView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //This might be removed?
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity:NoteEntry.entity(), sortDescriptors: [])
    var notes: FetchedResults<NoteEntry>

    @State var showNoteSheet = false

    var body: some View{
        NavigationView {
            List {
                ForEach(notes) { note in
                    HStack {
                        VStack(alignment: .leading){
                            Text("\(note.gradAttribute)")
                                .font(.headline)
                            Text("\(note.situation)")
                                .font(.subheadline)
                        }
                        Spacer()
                        Button(action: {print("Send data")}) {
                            Text("Review")
                                .foregroundColor(.blue)
                        }
                    }
                    .frame(height:50)
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
            .navigationBarItems(trailing: Button(action: {
                showNoteSheet = true
            }, label: {
                Image(systemName : "plus.circle")
                    .imageScale(.large)
            }))
            .sheet(isPresented: $showNoteSheet){
                NoteSheetView()
            }
        }
        
    }
    
    func reviewNote(note: NoteEntry) {
        //let reviewingNote = self.
    }
    
    //******THis is may need to be removed!********
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
//    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

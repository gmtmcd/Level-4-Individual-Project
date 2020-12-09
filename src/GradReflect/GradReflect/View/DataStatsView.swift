//
//  DataStatsView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 09/12/2020.
//

import SwiftUI

struct DataStatsView: View {
    
    @FetchRequest(entity:NoteEntry.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \NoteEntry.entryTime, ascending:false)])
    var notes: FetchedResults<NoteEntry>
    
    
    var body: some View {
        NavigationView {
            TabView{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.tabViewStyle(PageTabViewStyle())
            // the constant data here
        }
        
    }
}

struct DataStatsView_Previews: PreviewProvider {
    static var previews: some View {
        DataStatsView()
    }
}

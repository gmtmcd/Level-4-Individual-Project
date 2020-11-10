//
//  NoteReviewView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 10/11/2020.
//

import SwiftUI

struct NoteReviewView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity:NoteEntry.entity(), sortDescriptors: [])
    var notes: FetchedResults<NoteEntry>
    
    @State var selectedAttribute = 1
    @State var situation = ""
    @State var thoughts = ""
    @State var emotionsScale: Float = 0.0
    @State var behaviour = ""
    @State var futureAlternate = ""
    @State var whyEmotions = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NoteReviewView_Previews: PreviewProvider {
    static var previews: some View {
        NoteReviewView()
    }
}

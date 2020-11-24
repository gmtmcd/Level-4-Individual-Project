//
//  RootView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 17/11/2020.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var router: Router
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        switch router.currentPage {
        case .SkillView:
            SkillView(router: router)
        case .NotesListView:
            NotesListView(router: router).environment(\.managedObjectContext, viewContext)
        case .SettingsView:
            SettingsView(router: router)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(router: Router()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

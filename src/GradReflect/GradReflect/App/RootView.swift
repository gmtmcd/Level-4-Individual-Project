//
//  RootView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 17/11/2020.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var router: Router
    
    var body: some View {
        switch router.currentPage {
        case .page1:
            MenuView(router: router)
        case .page2:
            ContentView(router: router).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(router: Router())
    }
}

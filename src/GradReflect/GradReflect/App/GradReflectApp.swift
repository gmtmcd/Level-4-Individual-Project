//
//  GradReflectApp.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI
import CoreData

@main
struct GradReflectApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isMenu") var isMenu: Bool = true
    
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
//            if isMenu {
//                MenuView()
//                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            } else {
//                ContentView()
//                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            }
            
            RootView(router: Router())
            
            //this if statement can perhaps be removed, currently just here to show how app storage works and to swicth between a tab view to a list view
        }
    }
}


struct GradReflectApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

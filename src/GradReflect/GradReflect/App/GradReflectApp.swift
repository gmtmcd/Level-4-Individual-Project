//
//  GradReflectApp.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI
import CoreData

/**
 This is the file called when the app opens and controls what is shown
 Calls RootView that can change between all views
 Enables the users choice of dark and light mode to be implemented
 */
@main
struct GradReflectApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var router = Router()
    @AppStorage("darkModeOn") private var darkModeOn = false
    
    var body: some Scene {
        WindowGroup {
            RootView(router: router).environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(darkModeOn ? .dark : .light)
        }
    }
}

// Preview
struct GradReflectApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

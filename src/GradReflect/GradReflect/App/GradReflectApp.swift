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
    
    @StateObject var router = Router()
    @AppStorage("darkModeOn") private var darkModeOn = false
    
    var body: some Scene {
        WindowGroup {
            RootView(router: router).environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(darkModeOn ? .light : .dark)

        }
    }
}


struct GradReflectApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

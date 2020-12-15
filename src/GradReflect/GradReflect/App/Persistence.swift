//
//  Persistence.swift
//  GradReflect
//
//  Created by Gemma McDonald on 03/11/2020.
//


import CoreData

/**
 Persistence controls the Core Data settings
 */
struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = NoteEntry(context: viewContext)
            newItem.id = UUID()
            newItem.situation = "description of situation"
            newItem.thoughts = "description of thoughts"
            newItem.emotionsScale = 1
            newItem.whyEmotions = "description of why they felt the emotions"
            newItem.behaviour = "description of how this made them behave"
            newItem.futureAlternate = "description of how theyd bahave in future"
            newItem.name = "name of note"
            newItem.entryTime = Date()

        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "GradReflect")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

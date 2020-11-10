//
//  NoteEntry+CoreDataProperties.swift
//  GradReflect
//
//  Created by Gemma McDonald on 03/11/2020.
//
//

import Foundation
import CoreData


extension NoteEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntry> {
        return NSFetchRequest<NoteEntry>(entityName: "NoteEntry")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var gradAttribute: String
    @NSManaged public var situation: String
    @NSManaged public var thoughts: String
    //@NSManaged public var emotions: String //Float
    @NSManaged public var emotionsScale: Float
    @NSManaged public var behaviour: String
    @NSManaged public var futureAlternate: String
    @NSManaged public var whyEmotions: String
    

}

extension NoteEntry : Identifiable {

}

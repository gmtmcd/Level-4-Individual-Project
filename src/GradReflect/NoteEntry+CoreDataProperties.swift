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
    @NSManaged public var emotions: String
    @NSManaged public var behaviour: String
    @NSManaged public var futureAlternate: String
    @NSManaged public var whyEmotions: String
    
    //this might not be something that is needed?
//    var attributeGrad: GradAttributeEnum {
//        set {
//            gradAttribute = newValue.rawValue
//        }
//        get {
//            GradAttributeEnum(rawValue: gradAttribute) ?? .communication
//        }
//    }

}

extension NoteEntry : Identifiable {

}

//This also might not be needed when i turn this into a scroller for these options
//enum GradAttributeEnum: String {
//    case communication = "Communication"
//    case criticalThinking = "CriticalThinking"
//    case adaptability = "Adaptability"
//    case teamWork = "Teamwork"
//    case selfEfficacy = "SelfEfficacy"
//    case ethics = "ethics"
//}

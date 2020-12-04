//
//  RecordingsHelper.swift
//  GradReflect
//
//  Created by Gemma McDonald on 04/12/2020.
//

import Foundation

// Function takes a file paths and returns the date it was created
func getDateCreated(for file:URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
       let dateCreated = attributes[FileAttributeKey.creationDate] as? Date {
        return dateCreated
    } else { // If this fails just return todays date
        return Date()
    }
}

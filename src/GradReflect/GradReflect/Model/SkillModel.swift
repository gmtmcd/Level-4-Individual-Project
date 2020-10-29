//
//  SkillModel.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

//import Foundation
import SwiftUI

//Skills Data Model

struct Skill: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColours: [Color]
    var description: String
    //var nutrition: [String] //not sure if this will be needed, this is the info from the data file
    
}


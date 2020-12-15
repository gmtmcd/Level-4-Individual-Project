//
//  SkillModel.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI

/**
 Skills Data Model for the Skill Data
 */
struct Skill: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColours: [Color]
}


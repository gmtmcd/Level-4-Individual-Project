//
//  Router.swift
//  GradReflect
//
//  Created by Gemma McDonald on 17/11/2020.
//

import Foundation
import SwiftUI

/**
 Controls what view is shown as user navigates through app
 */
class Router: ObservableObject {
    @Published var currentPage: Page = .SkillView
}

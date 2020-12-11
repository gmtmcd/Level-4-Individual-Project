//
//  forTesting.swift
//  GradReflect
//
//  Created by Gemma McDonald on 11/12/2020.
//

import SwiftUI

struct forTesting: View {
    var body: some View {
        let str = ""
        let trimmed = str.trimmingCharacters(in: .whitespacesAndNewlines)
        Text(trimmed)
//        let empty = []
//        Text(empty.count)
    }
}

struct forTesting_Previews: PreviewProvider {
    static var previews: some View {
        forTesting()
    }
}

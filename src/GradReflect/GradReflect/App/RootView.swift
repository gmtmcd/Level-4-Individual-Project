//
//  RootView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 17/11/2020.
//

import SwiftUI

struct RootView: View {
    
    //@State var currentPage: Page = .page1
    @StateObject var router: Router
    
    var body: some View {
        switch router.currentPage {
        case .page1:
            MenuView()
        case .page2:
            ContentView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(router: Router())
    }
}

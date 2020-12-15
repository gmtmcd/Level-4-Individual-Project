//
//  AboutThisAppView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 15/12/2020.
//

import SwiftUI

struct AboutThisAppView: View {
    
    @StateObject var router: Router
    
    var body: some View {
        NavigationView{
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                                HStack {
                                    Text("About This App")
                                    Image(systemName: "info.circle.fill")
                                }
                            }
            }
            .navigationBarItems(
                leading: Button(action: {
                    withAnimation{
                        router.currentPage = .SettingsView
                    }
                }, label: {
                    Text("Back")
                }))

            
        }
        
    }
}

struct AboutThisAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutThisAppView(router: Router())
    }
}

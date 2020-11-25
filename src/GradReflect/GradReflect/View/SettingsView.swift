//
//  SettingsView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 24/11/2020.
//

import SwiftUI

struct SettingsView: View {

    @StateObject var router: Router
    @ObservedObject var notifManager = NotificationManager()
    
    var body: some View {
        NavigationView{
            //I think the extra stuff on this vstack can be removed
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0){
                Form{
                    Section(header: Text("Useful Links")){
                        SettingsLinksRowView(icon: "graduationcap.fill", colour: Color.orange, text: "Moodle", link: "https://moodle.gla.ac.uk/login/index.php")
                        SettingsLinksRowView(icon: "chevron.left.slash.chevron.right", colour: Color.black, text: "GitHub", link:"https://github.com/gmtmcd/Level-4-Individual-Project")
                        SettingsLinksRowView(icon: "shield.fill", colour: Color.blue, text: "MyGlasgow-Grad Attributes", link:"https://www.gla.ac.uk/myglasgow/students/attributes/")
                    }
                    
                    
                    Section(header: Text("About application")){
                        SettingsRowView(icon: "gear", leftTxt: "Application", rightTxt: "GradReflect")
                        SettingsRowView(icon: "checkmark.seal", leftTxt: "Compatibility", rightTxt: "iPhone")
                        SettingsRowView(icon: "keyboard", leftTxt: "Developer", rightTxt: "Gemma McDonald")
                        SettingsRowView(icon: "flag", leftTxt: "Version", rightTxt: "1.0.0")
                    }
                    
                    Section(header: Text("Notifications")){
                        Button(action: {
                            withAnimation {
                                self.notifManager.sendNotif(title: "GradReflect", subtitle: nil, body: "Hey! Time to reflect on your skills!", launchIn: 10)
                            }
                        }) {
                            Text("Turn on Notifications")
                        }
                    }
                    
                } //End of Form
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // Footer for the form
                Text("Created by Gemma McDonald")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(10)
                    .foregroundColor(Color.secondary)
                
            } // End of VStack
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    router.currentPage = .SkillView
                }, label: {
                    Text("Home")
                }))
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(router: Router())
    }
}

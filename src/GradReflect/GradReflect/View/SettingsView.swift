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
    
    @AppStorage("darkModeOn") private var darkModeOn = false
    
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
                    
                    
                    Section(header: Text("About this app")){
                        Button(action: {
                            withAnimation{
                                router.currentPage = .AboutThisAppView
                            }
                        }) {
                            // Manually add this settings row so that the right side can contain a chevron right icon to let the user know they are able to click it
                            HStack {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .fill(Color.gray)
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.black)
                                }
                                .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                Text("About GradReflect").foregroundColor(Color.gray)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        SettingsRowView(icon: "gear", leftTxt: "Application", rightTxt: "GradReflect")
                        SettingsRowView(icon: "checkmark.seal", leftTxt: "Compatibility", rightTxt: "iPhone")
                        SettingsRowView(icon: "keyboard", leftTxt: "Developer", rightTxt: "Gemma McDonald")
                        SettingsRowView(icon: "swift", leftTxt: "Version", rightTxt: "1.0.0")
                        SettingsRowView(icon: "calendar", leftTxt: "Created", rightTxt: " December 2020/21")
                    }
                    
                    Section(header: Text("Notifications")){
                        Button(action: {
                            withAnimation {
                                self.notifManager.sendNotif(title: "GradReflect", subtitle: nil, body: "Hey! Time to reflect on your skills!", launchIn: 10)
                            }
                        }) {
                            HStack {
                                Image(systemName: "bell.fill")
                                Text("Turn on Notifications")
                            }
                            
                        }
                    }
                    
                    Section(header: Text("Appearance")){
                        Button(action: {
                            darkModeOn.toggle()
                        }) {
                            HStack{
                                Image(systemName: "sun.max.fill")
                                Text("Switch Theme")
                            }
                        }
                    }
                    
                    
                } //End of Form
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
            } // End of VStack
            .navigationBarTitle("Settings ⚙️", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    withAnimation{
                        router.currentPage = .SkillView
                    }
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

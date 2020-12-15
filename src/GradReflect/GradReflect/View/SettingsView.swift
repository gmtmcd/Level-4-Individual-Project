//
//  SettingsView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 24/11/2020.
//

import SwiftUI

/**
 View to show the settings for the app
 Displays information about the app and links to an about view
 Links to sites that may be useful to user
 Allows user to turn on notifs and toggle dark and light mode
 */
struct SettingsView: View {

    @StateObject var router: Router
    @ObservedObject var notifManager = NotificationManager()
    
    // Stores user input for dark/light mode
    @AppStorage("darkModeOn") private var darkModeOn = false
    
    // Main body view
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    // SHow the useful links to websites
                    Section(header: Text("Useful Links")){
                        SettingsLinksRowView(icon: "graduationcap.fill", colour: Color.orange, text: "Moodle", link: "https://moodle.gla.ac.uk/login/index.php")
                        SettingsLinksRowView(icon: "chevron.left.slash.chevron.right", colour: Color.black, text: "GitHub", link:"https://github.com/gmtmcd/Level-4-Individual-Project")
                        SettingsLinksRowView(icon: "shield.fill", colour: Color.blue, text: "MyGlasgow-Grad Attributes", link:"https://www.gla.ac.uk/myglasgow/students/attributes/")
                    }
                    
                    // Show details about this app and link to more detail view
                    Section(header: Text("About this app")){
                        // Button to take to view with app instructions
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
                    
                    // User can turn on notifications, notif fires 10 secs after clicking due to proff of concept app
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
                    
                    // User can switch dark and light mode
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
                // Button to return to settings page
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

// Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(router: Router())
    }
}

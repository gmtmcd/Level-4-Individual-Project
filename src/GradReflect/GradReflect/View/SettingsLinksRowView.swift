//
//  SettingsLinksRowView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 24/11/2020.
//

import SwiftUI

/**
 View show a row for setting for the rows that contain a link in them
 Used in SettingsView
 */
struct SettingsLinksRowView: View {
    
    var icon: String
    var colour: Color
    var text: String
    var link: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(colour)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(Color.white)
            } // End of Zstack
            .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(text).foregroundColor(Color.gray)
            Spacer()
            // Button to open link on the row
            Button(action: {
                //Open link
                guard let url = URL(string: self.link),
                      UIApplication.shared.canOpenURL(url) else {
                    return
                }
                UIApplication.shared.open(url as URL)
            }) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design:.rounded))
            }
        } // End of hstack
    }
}

// Preview
struct SettingsLinksRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLinksRowView(icon: "graduationcap.fill", colour: Color.orange, text: "Moodle", link: "https://moodle.gla.ac.uk/login/index.php")
    }
}

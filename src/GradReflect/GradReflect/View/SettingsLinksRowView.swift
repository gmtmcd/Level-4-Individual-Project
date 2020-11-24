//
//  SettingsLinksRowView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 24/11/2020.
//

import SwiftUI

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
            }
            .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(text).foregroundColor(Color.gray)
            Spacer()
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
            //.accentColor(Color(.systemGray2))
        }
    }
}

struct SettingsLinksRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLinksRowView(icon: "graduationcap.fill", colour: Color.orange, text: "Moodle", link: "https://moodle.gla.ac.uk/login/index.php")
    }
}

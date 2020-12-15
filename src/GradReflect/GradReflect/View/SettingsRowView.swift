//
//  SettingsRowView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 24/11/2020.
//

import SwiftUI

/**
 View show one row of settings for the about section
 Used in SettingsView
 Takes the detials given and creates a row for the details
 */
struct SettingsRowView: View {
    
    var icon: String
    var leftTxt: String
    var rightTxt: String
    
    var body: some View {
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.gray)
                Image(systemName: icon)
                    .foregroundColor(.black)
            } // End of Zstack
            .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(leftTxt).foregroundColor(Color.gray)
            Spacer()
            Text(rightTxt)
        } // End of Hstack
    }
}

// Preview
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(icon: "gear", leftTxt: "Application", rightTxt: "GradReflect")
    }
}

//
//  NotesButtonView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI

struct NotesButtonView: View {
    // Properties
    @AppStorage("isMenu") var isMenu: Bool?
    
    
    // Body
    
    var body: some View {
        Button(action: {
            isMenu = false
        }) {
            HStack (spacing: 8){
                Text("Notes")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal,16)
            .padding(.vertical, 10)
            .background(Capsule().strokeBorder(Color.white,lineWidth: 2))//creates the line around the button
        }// End of button
        .accentColor(.white)
    }
}

// Preview

struct NotesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NotesButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}

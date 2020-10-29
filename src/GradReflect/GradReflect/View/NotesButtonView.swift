//
//  NotesButtonView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI

struct NotesButtonView: View {
    // Properties
    
    // Body
    
    var body: some View {
        Button(action: {
            print("Exit")
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

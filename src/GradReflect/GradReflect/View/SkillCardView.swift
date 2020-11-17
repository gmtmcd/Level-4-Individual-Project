//
//  SkillCardView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI

struct SkillCardView: View {
    
    // Properties
    @State private var isAnimating: Bool = false
    @AppStorage("isMenu") var isMenu: Bool?
    //@State var goToContentView: Bool = false
    
    var skill: Skill
    
    // Body
    
    var body: some View {
        ZStack {
            VStack(spacing:20) {
                // Skill : Image
                Image(skill.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green:0, blue: 0.5, opacity: 0.50), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // Skill : Title
                Text(skill.title)
                    .foregroundColor(Color.white)//change colour of text
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(radius: 2, x:2, y:2)//not always needed to do the colour 0's
                
                // Skill: Headline
                Text(skill.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,16)//how much space at the sides
                    .frame(maxWidth:480)
                
                //Button: Start
                //NotesButtonView()
//                if (goToContentView) {
//                    ContentView(goToMenuView: self.$goToContentView)
//                } else {
                    Button(action: {
                        //self.goToContentView.toggle()
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
                //}
                
            }// End of VStack
        } // End of ZStack
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)//makes the background extend more than just around the image
        .background(LinearGradient(gradient: Gradient(colors: skill.gradientColours), startPoint: .top, endPoint: .bottom)) //this dictates the background
        .cornerRadius(20) //this gives the background of image a rounded edge
        .padding(.horizontal,20)
    }
}

// Preview

struct SkillCardView_Previews: PreviewProvider {
    static var previews: some View {
        SkillCardView(skill: skillData[0])
            .previewLayout(.fixed(width:320, height: 640))
    }
}

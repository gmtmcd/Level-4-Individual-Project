//
//  SkillView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI

struct SkillView: View {
    //Properties
    @State private var isAnimating: Bool = false
    @StateObject var router: Router

    
    var skills: [Skill] = skillData
    
    //Body
    
    var body: some View {
        VStack {
            TabView{
                ForEach(skills[0...5]) { skill in
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
            }//End of tab
            .tabViewStyle(PageTabViewStyle())
            .padding(.vertical,20)
            
            HStack {
                Button(action: {
                    router.currentPage = .NotesListView
                }) {
                    HStack (spacing: 8){
                        Text("Notes")
                        
                        Image(systemName: "arrow.right.circle")
                            .imageScale(.large)
                    }
                    .padding(.horizontal,16)
                    .padding(.vertical, 10)
                    .background(Capsule().strokeBorder(Color.black,lineWidth: 2))//creates the line around the button
                }// End of button
                .accentColor(.black)
                
                Button(action: {
                    router.currentPage = .SettingsView
                }) {
                    HStack (spacing: 8){
                        Text("Settings")
                        
                        Image(systemName: "arrow.right.circle")
                            .imageScale(.large)
                    }
                    .padding(.horizontal,16)
                    .padding(.vertical, 10)
                    .background(Capsule().strokeBorder(Color.black,lineWidth: 2))//creates the line around the button
                }// End of button
                .accentColor(.black)
                
            }
            
            
            
        }//End of VStack
    }
}

//Preview

struct SkillView_Previews: PreviewProvider {
    static var previews: some View {
        SkillView(router: Router())
    }
}
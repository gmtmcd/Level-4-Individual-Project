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
                ForEach(skills[0...6]) { skill in
                    ZStack {
                        VStack(spacing:20) {
                            // Skill : Image
                            Image(skill.image)
                                .resizable()
                                .frame(width:UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/3.5)
                                .scaledToFit()
                                .shadow(color: Color(red: 0, green:0, blue: 0.5, opacity: 0.50), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 6, y: 8)
                                .scaleEffect(isAnimating ? 1.0 : 0.6)
                            
                            // Skill : Title
                            Text(skill.title)
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .shadow(radius: 2, x:2, y:2)
                            
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
                    .background(LinearGradient(gradient: Gradient(colors: skill.gradientColours), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(20)
                    .padding(.horizontal,20)
                }
            }//End of tab
            .tabViewStyle(PageTabViewStyle())
            
            VStack {
                HStack {
                    Button(action: {
                        router.currentPage = .NotesListView
                    }) {
                        HStack (spacing: 8){
                            Text("Notes")
                            Image(systemName: "arrow.right.circle")
                                .imageScale(.large)
                        }
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color(red: 139 / 255, green: 30 / 255, blue: 63 / 255))
                        .cornerRadius(8)

                    }// End of button
                    
                    Button(action: {
                        router.currentPage = .RecordingsView
                    }) {
                        HStack (spacing: 8){
                            Text("Recordings")
                            Image(systemName: "arrow.right.circle")
                                .imageScale(.large)
                        }
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color(red: 139 / 255, green: 30 / 255, blue: 63 / 255))
                        .cornerRadius(8)
                    }// End of button
                    
                } //end of hstack
                
                HStack{
                    Button(action: {
                        router.currentPage = .SettingsView
                    }) {
                        HStack (spacing: 8){
                            Text("Settings")
                            Image(systemName: "arrow.right.circle")
                                .imageScale(.large)
                        }
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color(red: 139 / 255, green: 30 / 255, blue: 63 / 255))
                        .cornerRadius(8)
                    }// End of button
                    
                    // Add button soon to take to data/stats analysis???
                    Button(action: {
                        router.currentPage = .DataStatsView
                    }) {
                        HStack (spacing: 8){
                            Text("Statistics")
                            Image(systemName: "arrow.right.circle")
                                .imageScale(.large)
                        }
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color(red: 139 / 255, green: 30 / 255, blue: 63 / 255))
                        .cornerRadius(8)
                    }// End of button
                    
                } //End of Hstack
                
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

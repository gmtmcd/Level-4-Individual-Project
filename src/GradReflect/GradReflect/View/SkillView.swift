//
//  SkillView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI

/**
 View that contains the buttons to take user to the other main views
 View takes the users through each skill and gives details about it
 Also contains a main card that directs users where to go
 */
struct SkillView: View {
    
    // Router in charge of controlling what view is shown
    @StateObject var router: Router
    
    @State private var isAnimating: Bool = false
    var skills: [Skill] = skillData
    
    // Main body view
    var body: some View {
        VStack {
            TabView{
                ForEach(skills[0...6]) { skill in
                    ZStack {
                        VStack(spacing:20) {
                            // Skill Image
                            Image(skill.image)
                                .resizable()
                                .frame(width:UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/3.5)
                                .scaledToFit()
                                .shadow(color: Color(red: 0, green:0, blue: 0.5, opacity: 0.50), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 6, y: 8)
                                .scaleEffect(isAnimating ? 1.0 : 0.6)
                            
                            // Skill Title
                            Text(skill.title)
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .shadow(radius: 2, x:2, y:2)
                            
                            // Skill Headline
                            Text(skill.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal,16)
                                .frame(maxWidth:480)
                               
                        }// End of VStack
                    } // End of ZStack
                    // Handles the image zooming in between each skill card
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.5)) {
                            isAnimating = true
                        }
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)//makes the background extend more than just around the image
                    .background(LinearGradient(gradient: Gradient(colors: skill.gradientColours), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(20)
                    .padding(.horizontal,10)
                }
            } //End of tab
            .tabViewStyle(PageTabViewStyle())
            
            // Buttons to take user to each of the other apps main functionality pages
            VStack {
                HStack {
                    
                    // Button to direct to Notes
                    Button(action: {
                        withAnimation {
                            router.currentPage = .NotesListView
                        }
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
                    
                    // Button to direct to Recordings
                    Button(action: {
                        withAnimation{
                            router.currentPage = .RecordingsView
                        }
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
                    
                    // Button to direct to Statistics
                    Button(action: {
                        withAnimation{
                            router.currentPage = .DataStatsView
                        }
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
                    
                    // Button to direct to Settings
                    Button(action: {
                        withAnimation{
                            router.currentPage = .SettingsView
                        }
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
                   
                } //End of Hstack
                
            }
        }//End of VStack
    }
}

// Preview
struct SkillView_Previews: PreviewProvider {
    static var previews: some View {
        SkillView(router: Router())
    }
}

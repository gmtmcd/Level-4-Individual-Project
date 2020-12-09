//
//  DataStatsView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 09/12/2020.
//

import SwiftUI

struct DataStatsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity:NoteEntry.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \NoteEntry.entryTime, ascending:false)])
    var notes: FetchedResults<NoteEntry>
    
    @StateObject var router: Router
    
    var skills: [Skill] = skillData
    
    var body: some View {
        NavigationView {
            VStack {
                TabView{
                    ForEach(skills[1...6]) { skill in
                        ZStack {
                            VStack (spacing: 20){
                                Text(skill.title)
                                    .foregroundColor(Color.white)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .shadow(radius: 2, x:2, y:2)
                                
                                Text("Number of entries for skill: \(getNumberEntries(skill: skill.title))")
                                    .foregroundColor(Color.white)
                                
                                Text("Average emotional response to skill: ")
                                    .foregroundColor(Color.white)
                                
                                Text("Average number of words per entry: ")
                                    .foregroundColor(Color.white)
                                
                            }
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)//makes the background extend more than just around the image
                        .background(Color.gray)
                        .cornerRadius(20)
                        .padding(.horizontal,20)
                        //.padding(.vertical, 20)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .navigationTitle("Statistics")
                .navigationBarItems(
                    leading: Button(action: {
                        router.currentPage = .SkillView
                    }, label: {
                        Text("Home")
                    }))
                
                VStack(spacing: 20) {
                    Text("Total note entries: \(notes.count)")
                        .fontWeight(.bold)
                    Text("Total words in entries: ")
                        .fontWeight(.bold)
                    
                }
                .padding(.horizontal, 15)
                
                
            }//end of vstack

        }
        
    }
    
    func getNumberEntries(skill: String) -> Int{
        var counter: Int = 0
        for note in notes {
            if note.gradAttribute == skill {
                counter += 1
            }
        }
        return counter
    }
    
}

struct DataStatsView_Previews: PreviewProvider {
    static var previews: some View {
        DataStatsView(router: Router()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

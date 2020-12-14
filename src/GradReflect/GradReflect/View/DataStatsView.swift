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
    var formatted: String = ""
    
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
                                    .font(.title3)
                                
                                if getNumberEntries(skill: skill.title) == 0 {
                                    Text("Average words per entry: 0")
                                        .foregroundColor(Color.white)
                                        .font(.title3)
                                } else {
                                    Text("Average words per entry: \(String(format: "%.2f", getNumberWords(skill: skill.title)/Float(getNumberEntries(skill: skill.title))))")
                                        .foregroundColor(Color.white)
                                        .font(.title3)
                                }
                                
                                Text("Average emotion for skill: \(getAvgEmotion(skill: skill.title))")
                                    .foregroundColor(Color.white)
                                    .font(.title3)
                                
                            }
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(LinearGradient(gradient: Gradient(colors: skill.gradientColours), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(20)
                        .padding(.horizontal,20)
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
                        .font(.title3)
                    Text("Average words for all entries: \(String(format: "%.2f",(getNumberWords(skill:"Communication") + getNumberWords(skill:"Critical Thinking") + getNumberWords(skill:"Adaptability") + getNumberWords(skill:"Teamwork") + getNumberWords(skill:"Self-efficacy & Applying Knowledge") + getNumberWords(skill:"Ethics & Professionalism"))/Float(notes.count)))")
                        .fontWeight(.bold)
                        .font(.title3)
                    
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
    
    func getAvgEmotion(skill: String) -> Int {
        var total: Int = 0
        var counter: Int = 0
        for note in notes {
            if note.gradAttribute == skill {
                counter += 1
                total += note.emotionsScale
            }
        }
        if counter == 0 {
            return 0
        } else {
            return total/counter
        }
    }
    
    func getNumberWords(skill: String) -> Float {
        var totalWords: Float = 0.0
        var words: Int = 0
        for note in notes {
            if note.gradAttribute == skill {
                words = checkEmpty(listStrings: note.situation.components(separatedBy: " "))
                words += checkEmpty(listStrings: note.thoughts.components(separatedBy: " "))
                words += checkEmpty(listStrings: note.behaviour.components(separatedBy: " "))
                words += checkEmpty(listStrings: note.futureAlternate.components(separatedBy: " "))
                words += checkEmpty(listStrings: note.whyEmotions.components(separatedBy: " "))
                totalWords += Float(words)
            }
        }
        return totalWords
    }
    func checkEmpty(listStrings: [String]) -> Int{
        if listStrings == [""] {
            return 0
        } else {
            return listStrings.count
        }
    }
    
}

struct DataStatsView_Previews: PreviewProvider {
    static var previews: some View {
        DataStatsView(router: Router()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

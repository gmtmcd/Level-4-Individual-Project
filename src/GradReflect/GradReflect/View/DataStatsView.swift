//
//  DataStatsView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 09/12/2020.
//

import SwiftUI

/**
 View to show the user the stats of the notes
 Goes through each skill and displays as a card with the stats
 Contains the functions used to find the stats
 Can be directed to from the home skill view
 */
struct DataStatsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Get all notes made by user from Core Data
    @FetchRequest(entity:NoteEntry.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \NoteEntry.entryTime, ascending:false)])
    var notes: FetchedResults<NoteEntry>
    
    // Router to control views shown
    @StateObject var router: Router
    
    // Skill data to use to format the skill cards with the stats
    var skills: [Skill] = skillData
    
    // Main body view
    var body: some View {
        NavigationView {
            VStack {
                TabView{
                    ForEach(skills[1...6]) { skill in
                        ZStack {
                            VStack (spacing: 20){
                                // Skill title
                                Text(skill.title)
                                    .foregroundColor(Color.white)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .shadow(radius: 2, x:2, y:2)
                                
                                Text("Number of entries for skill: \(getNumberEntries(skill: skill.title))")
                                    .foregroundColor(Color.white)
                                    .font(.title3)
                                
                                // Check that the number of entries arent 0 and therefore cause a NaN result by dividing by 0
                                if getNumberEntries(skill: skill.title) == 0 {
                                    Text("Average words per entry: 0")
                                        .foregroundColor(Color.white)
                                        .font(.title3)
                                // If its not zero then get the avg words per entry
                                } else {
                                    Text("Average words per entry: \(String(format: "%.2f", getNumberWords(skill: skill.title)/Float(getNumberEntries(skill: skill.title))))")
                                        .foregroundColor(Color.white)
                                        .font(.title3)
                                }
                                
                                Text("Average emotion for skill: \(getAvgEmotion(skill: skill.title))")
                                    .foregroundColor(Color.white)
                                    .font(.title3)
                                
                            }
                        } // End of Zstack
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(LinearGradient(gradient: Gradient(colors: skill.gradientColours), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(20)
                        .padding(.horizontal,10)
                    }
                } // End of tabview
                .tabViewStyle(PageTabViewStyle())
                
                // Show stats over all note entries
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
            .navigationBarTitle("Statistics 📊", displayMode: .inline)
            .navigationBarItems(
                // Button to return to home skill view
                leading: Button(action: {
                    withAnimation{
                        router.currentPage = .SkillView
                    }
                }, label: {
                    Text("Home")
                }))
        }
        
    }
    
    // returns the number of entries for a skill
    func getNumberEntries(skill: String) -> Int{
        var counter: Int = 0
        for note in notes {
            if note.gradAttribute == skill {
                counter += 1
            }
        }
        return counter
    }
    
    // returns the avg emotion for a skill
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
    
    // returns the number of total words over all entries for a skill
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
    // check that data in a note isnt empty so that it doesnt count an empty value as a word
    func checkEmpty(listStrings: [String]) -> Int{
        if listStrings == [""] {
            return 0
        } else {
            return listStrings.count
        }
    }
    
}

// Preview
struct DataStatsView_Previews: PreviewProvider {
    static var previews: some View {
        DataStatsView(router: Router()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

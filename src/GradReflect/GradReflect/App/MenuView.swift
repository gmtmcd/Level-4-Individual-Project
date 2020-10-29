//
//  MenuView.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI

struct MenuView: View {
    //Properties
    
    var skills: [Skill] = skillData
    
    //Body
    
    var body: some View {
        TabView{
            ForEach(skills[0...5]) { item in
                SkillCardView(skill: item)
            }
        }//End of tab
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical,20)
    }
}

//Preview

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(skills: skillData)
    }
}

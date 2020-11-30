//
//  SkillData.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

//import Foundation
import SwiftUI

// File containing Skill data

let skillData: [Skill] = [
    Skill(
        title: "GradReflect",
        headline: "App description\n Scroll for info on skills ->",
        image: "communication",
        gradientColours: [Color.yellow, Color.orange]
        //description: "Communication description"
    ),
    Skill(
        title: "Communication",
        headline: "Communication is a very important grad skill etc etc",
        image: "communication",
        gradientColours: [Color.blue, Color.purple]
        //description: "Communication description"
    ),
    Skill(
        title: "Critical Thinking",
        headline: "Critical thinking etc etc",
        image: "critical_thinking",
        gradientColours: [Color.red, Color.pink]
        //description: "Critical thinking description"
    ),
    Skill(
        title: "Adaptability",
        headline: "Adaptability etc etc",
        image: "adaptability",
        gradientColours: [Color.black, Color.gray]
        //description: "Adaptability description"
    ),
    Skill(
        title: "Teamwork",
        headline: "Teamwork is a very important grad skill etc etc",
        image: "teamwork",
        gradientColours: [Color.primary, Color.secondary]
        //description: "Teamwork description"
    ),
    Skill(
        title: "Self-efficacy/application of knowledge",
        headline: "Self-efficacy/application of knowledge is a very important grad skill etc etc",
        image: "knowledge",
        gradientColours: [Color.black, Color.gray]
        //description: "Self-efficacy/application of knowledge description"
    ),
    Skill(
        title: "Ethics/Professionalism",
        headline: "Ethics/Professionalism is a very important grad skill etc etc",
        image: "ethics",
        gradientColours: [Color.blue, Color.purple]
        //description: "Ethics/Professionalism description"
    )
]

// ADD THIS TO THE SKILL CARDS SO THERES ONE THAT HAS GENERAL OVERSIGHT
//Graduate attributes, sometimes referred to as 'soft skills', are skills learned during someone's time at university, that aren't necessarily a direct result of the courses they are doing. These skills are developed primarily through real-world experiences and reflection.

struct SkillData_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

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
        headline: "Grad Reflect is a space for you to reflect on experiences where you've used your graduate soft skills. Using CBT techniques it will help you to develop them.\n\n Scroll for info on skills ➡️\n Go straight to notes or settings below ⬇️",
        image: "AppLogo",
        gradientColours: [Color.yellow, Color.orange]
    ),
    Skill(
        title: "Communication",
        headline: "This covers both written and oral communication. You will need to be able to be clear and concise, being able to interrogate ideas and present them persuasively and confidently. In this skill topic you will reflect on situations where you have exercised these abilities.",
        image: "CommunicationIcon",
        gradientColours: [Color.blue, Color.purple]
    ),
    Skill(
        title: "Critical Thinking",
        headline: "This entails situations where you have used your problem solving skills, this will be useful in the workplace when required to create innovative solutions that work for clients. Here, you can reflect on when you have had to overcome obstacles or create solutions to difficult issues.",
        image: "criticalThinkingIcon",
        gradientColours: [Color.red, Color.pink]
    ),
    Skill(
        title: "Adaptability",
        headline: "Adaptability describes situations where you have had to adapt to fit with changing circumstances. ",
        image: "adaptabilityIcon",
        gradientColours: [Color.black, Color.gray]
    ),
    Skill(
        title: "Teamwork",
        headline: "Teamwork is a critical skills in the workplace. You must be able to collaborate with others and reach a consensus.",
        image: "teamworkIcon",
        gradientColours: [Color.primary, Color.secondary]
    ),
    Skill(
        title: "Self-efficacy & Applying Knowledge",
        headline: "Self-efficacy and application of knowledge is when someone takes the technical knowledge they have gained throughout university and apply it to the workplace. Here you will reflect on situations where you have evaluated and synthesised information.",
        image: "selfEfficacyIcon",
        gradientColours: [Color.black, Color.gray]
    ),
    Skill(
        title: "Ethics & Professionalism",
        headline: "This is about acting ethically, responsibly and with maturity and integrity. Here you will discuss how you present yourself and your attitude in a work environment, and also reflecting on your interpersonal skills.",
        image: "ethicsIcon",
        gradientColours: [Color.blue, Color.purple]
    )
]

// ADD THIS TO THE SKILL CARDS SO THERES ONE THAT HAS GENERAL OVERSIGHT
// Graduate attributes, sometimes referred to as 'soft skills', are skills learned during someone's time at university, that aren't necessarily a direct result of the courses they are doing. These skills are developed primarily through real-world experiences and reflection.

struct SkillData_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

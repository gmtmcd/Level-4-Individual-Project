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
        headline: "Grad Reflect is a space for you to reflect on experiences where you've used your graduate soft skills. Using CBT techniques it will help you to develop these skills that are developed primarily through real-world experiences and reflection.\n\n Scroll for info on skills ➡️\n Go straight to notes or settings below ⬇️",
        image: "AppLogo",
        gradientColours: [Color.yellow, Color.orange]
    ),
    Skill(
        title: "Communication",
        headline: "This covers both written and oral communication. This involves being clear and concise, and able to interrogate ideas and present them persuasively and confidently. In this skill topic you will reflect on situations where you have exercised these abilities.",
        image: "CommunicationIcon",
        gradientColours: [Color.blue, Color.green]
    ),
    Skill(
        title: "Critical Thinking",
        headline: "This entails situations where you have used your problem solving skills, this will be useful in the workplace when required to create innovative solutions that work for clients. Here for example, you can reflect on when you have had to overcome obstacles or create solutions to difficult issues.",
        image: "criticalThinkingIcon",
        gradientColours: [Color.red, Color.pink]
    ),
    Skill(
        title: "Adaptability",
        headline: "Adaptability describes situations where you have had to adapt to fit with changing circumstances and quickly learn new skills. Demonstrating this skill requires flexibility to respond effectively even when things don't go to plan. ",
        image: "adaptabilityIcon",
        gradientColours: [Color.pink, Color.yellow]
    ),
    Skill(
        title: "Teamwork",
        headline: "Teamwork is a critical skill in the workplace and allows you to work well with others. It involves collaborating with others and reaching a consensus, promoting strong working relationships and maximising the individual strengths of team members.",
        image: "teamworkIcon",
        gradientColours: [Color.black, Color.blue]
    ),
    Skill(
        title: "Self-efficacy & Applying Knowledge",
        headline: "Self-efficacy and application of knowledge is taking the technical knowledge gained throughout university and applying it to the workplace. Here you will reflect on situations where you have evaluated and synthesised information.",
        image: "selfEfficacyIcon",
        gradientColours: [Color.blue, Color.purple]
    ),
    Skill(
        title: "Ethics & Professionalism",
        headline: "This is about acting ethically, responsibly and with maturity and integrity. Here you will discuss how you present yourself and your attitude in a work environment, and also reflecting on your interpersonal skills.",
        image: "ethicsIcon",
        gradientColours:[Color.purple, Color.pink]
    )
]

struct SkillData_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

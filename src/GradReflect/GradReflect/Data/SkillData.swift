//
//  SkillData.swift
//  GradReflect
//
//  Created by Gemma McDonald on 29/10/2020.
//

import SwiftUI

/**
 File containing Skill data that will dictate what is shown on the Skill Cards
 */
let skillData: [Skill] = [
    Skill(
        title: "GradReflect",
        headline: "Access your notes and make new ones in the 'Notes' section\n Make a quick recording in 'Recordings'\n For your note stats, head to the 'Statistics' section\n To change settings and get more info about this app, go to 'Settings'\nScroll for info about skills ➡️",
        image: "AppLogo",
        //purple to pink
        gradientColours: [Color(red: 139 / 255, green: 30 / 255, blue: 63 / 255), Color(red: 235 / 255, green: 186 / 255, blue: 185 / 255)]
    ),
    Skill(
        title: "Communication",
        headline: "This covers both written and oral communication. This involves being clear and concise, and able to interrogate ideas and present them persuasively and confidently. In this skill topic you will reflect on situations where you have exercised these abilities.",
        image: "CommunicationIcon",
        // navy to green
        gradientColours: [Color(red: 0 / 255, green: 27 / 255, blue: 46 / 255), Color(red: 56 / 255, green: 119 / 255, blue: 128 / 255)]
    ),
    Skill(
        title: "Critical Thinking",
        headline: "This entails situations where you have used your problem solving skills, this will be useful in the workplace when required to create innovative solutions that work for clients. Here for example, you can reflect on when you have had to overcome obstacles or create solutions to difficult issues.",
        image: "criticalThinkingIcon",
        // blues
        gradientColours: [Color(red: 73 / 255, green: 182 / 255, blue: 255 / 255), Color(red: 119 / 255, green: 155 / 255, blue: 231 / 255)]
    ),
    Skill(
        title: "Adaptability",
        headline: "Adaptability describes situations where you have had to adapt to fit with changing circumstances and quickly learn new skills. Demonstrating this skill requires flexibility to respond effectively even when things don't go to plan. ",
        image: "adaptabilityIcon",
        // teal to green
        gradientColours: [Color(red: 14 / 255, green: 124 / 255, blue: 123 / 255), Color(red: 23 / 255, green: 190 / 255, blue: 187 / 255)]
    ),
    Skill(
        title: "Teamwork",
        headline: "Teamwork is a critical skill in the workplace and allows you to work well with others. It involves collaborating with others and reaching a consensus, promoting strong working relationships and maximising the individual strengths of team members.",
        image: "teamworkIcon",
        // deep green to blue
        gradientColours: [Color(red: 22 / 255, green: 37 / 255, blue: 33 / 255), Color(red: 79 / 255, green: 124 / 255, blue: 172 / 255)]
    ),
    Skill(
        title: "Self-efficacy & Applying Knowledge",
        headline: "Self-efficacy and application of knowledge is taking the technical knowledge gained throughout university and applying it to the workplace. Here you will reflect on situations where you have evaluated and synthesised information.",
        image: "selfEfficacyIcon",
        // pinks
        gradientColours: [Color(red: 249 / 255, green: 98 / 255, blue: 125 / 255), Color(red: 242 / 255, green: 131 / 255, blue: 182 / 255)]
    ),
    Skill(
        title: "Ethics & Professionalism",
        headline: "This is about acting ethically, responsibly and with maturity and integrity. Here you will discuss how you present yourself and your attitude in a work environment, and also reflecting on your interpersonal skills.",
        image: "ethicsIcon",
        // purpley blues
        gradientColours:[Color(red: 164 / 255, green: 128 / 255, blue: 207 / 255), Color(red: 119 / 255, green: 155 / 255, blue: 231 / 255)]
    )
]

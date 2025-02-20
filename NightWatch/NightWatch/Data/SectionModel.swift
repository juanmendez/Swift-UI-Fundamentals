//
//  SectionModel.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct SectionModel {
    let sectionHeaderModel: SectionHeaderModel
    let tasks: [String]
}

let sectionHeaderModels = [
    SectionHeaderModel(symbolSystemName: "moon.stars", headerText: "Nightly Task", fontColor: .black),
    SectionHeaderModel(symbolSystemName: "sunset", headerText: "Weekly Task", fontColor: .orange),
    SectionHeaderModel(symbolSystemName: "calendar", headerText: "Monthly Task", fontColor: .red),
]

let sectionModels = [
    SectionModel(
        sectionHeaderModel: sectionHeaderModels[0],
        tasks: nightlyTasks
    ),
    SectionModel(
        sectionHeaderModel: sectionHeaderModels[1],
        tasks: weeklyTasks
    ),
    SectionModel(
        sectionHeaderModel: sectionHeaderModels[2],
        tasks: monthlyTasks
    ),
]

//
//  ContentData.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/12/25.
//
import SwiftUI

struct TaskModel: Hashable {
    let name: String
    let isCompleted: Bool
    let lastCompleted: Date?

    init(name: String, isCompleted: Bool = false, lastCompleted: Date? = nil) {
        self.name = name
        self.isCompleted = isCompleted
        self.lastCompleted = lastCompleted
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(isCompleted)
        hasher.combine(lastCompleted)
    }
}

let nightlyTasks = [
    TaskModel(name: "Check all windows"),
    TaskModel(name: "Check all doors"),
    TaskModel(name: "Check that the safe is locked"),
    TaskModel(name: "Check the mailbox"),
    TaskModel(name: "Inspect security cameras"),
    TaskModel(name: "Clear ice from sidewalks"),
    TaskModel(name: "Document \"strange and unusual\" occurrences"),
]

let weeklyTasks = [
    TaskModel(name: "Check inside all vacant rooms"),
    TaskModel(name: "Walk the perimeter of the property"),
]

let monthlyTasks = [
    TaskModel(name: "Test security alarm"),
    TaskModel(name: "Test motion detectors"),
    TaskModel(name: "Test smoke alarms"),
]

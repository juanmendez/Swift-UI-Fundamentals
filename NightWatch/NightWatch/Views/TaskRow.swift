//
//  TaskRow.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/25/25.
//

import Foundation
import SwiftUI

struct TaskRow: View {
    let task: TaskModel
    
    var body: some View {
        VStack {
            if task.isCompleted {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundStyle(.gray)
                        .strikethrough()
                }
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}

#Preview("Task Row", body: {
    VStack {
        TaskRow(task: TaskModel(name: "Check all windows", isCompleted: false))
        TaskRow(task: TaskModel(name: "Check all windows", isCompleted: true))
    }
})

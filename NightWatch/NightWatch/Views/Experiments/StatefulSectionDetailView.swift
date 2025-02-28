//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct StatefulSectionDetailView: View {
    let task: TaskModel
    let resetHandler: (TaskModel) -> Void

    init(task: TaskModel, tapHandler: @escaping (TaskModel) -> Void = { _ in }) {
        self.task = task
        self.resetHandler = tapHandler
    }

    var body: some View {
        VStack {
            HStack {
                if task.isCompleted {
                    Image(systemName: "checkmark.square")
                } else {
                    Image(systemName: "square")
                }

                Text(task.name)
            }
            
            Button("reset") {
                resetHandler(task)
            }
        }
    }
}

#Preview {
    @Previewable
    @State
    var statefulTask = TaskModel(name: "hello", isCompleted: true)
    
    StatefulSectionDetailView(task: statefulTask) { task in
        // Kotlin does a better job copying!!!
        statefulTask = TaskModel(name: task.name, isCompleted: !task.isCompleted)
    }
}

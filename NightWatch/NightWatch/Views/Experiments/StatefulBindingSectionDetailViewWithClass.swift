//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

@Observable
class TaskModelObservable {
    let name: String
    var isCompleted: Bool
    var lastCompleted: Date?

    init(taskText: String, isCompleted: Bool = false, lastCompleted: Date? = nil) {
        self.name = taskText
        self.isCompleted = isCompleted
        self.lastCompleted = lastCompleted
    }
}

struct StatefulBindingSectionDetailViewWithClass: View {
    @Bindable
    var task: TaskModelObservable

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    task.isCompleted.toggle()
                }) {
                    if task.isCompleted {
                        Image(systemName: "checkmark.square")
                    } else {
                        Image(systemName: "square")
                    }
                }.buttonStyle(PlainButtonStyle())

                Text(task.name)
            }

            Toggle(isOn: $task.isCompleted) {
                Text("Task complete")
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable
    @State
    var statefulTask = TaskModelObservable(taskText: "Study Swift", isCompleted: true)

    StatefulBindingSectionDetailViewWithClass(task: statefulTask)
}

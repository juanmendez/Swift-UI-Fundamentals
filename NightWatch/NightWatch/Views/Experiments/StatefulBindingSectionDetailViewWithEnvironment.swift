//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct StatefulBindingSectionDetailViewWithEnvironment: View {
    @Environment(TaskModelObservable.self) var task

    var body: some View {
        @Bindable var bindableTask: TaskModelObservable = self.task

        VStack(alignment: .leading) {

            Button(action: {
                bindableTask.isCompleted.toggle()
            }) {
                HStack {
                    if task.isCompleted {
                        Image(systemName: "checkmark.square")
                    } else {
                        Image(systemName: "square")
                    }

                    Text(task.name)
                }.buttonStyle(PlainButtonStyle())
            }

            Toggle(isOn: $bindableTask.isCompleted) {
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

    StatefulBindingSectionDetailViewWithEnvironment()
        .environment(statefulTask)
}

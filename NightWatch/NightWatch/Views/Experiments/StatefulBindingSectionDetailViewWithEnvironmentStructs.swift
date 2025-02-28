//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct CustomEnvironmentKey: EnvironmentKey {
    static let defaultValue: TaskModel = TaskModel(name: "", isCompleted: false, lastCompleted: nil)
}

extension EnvironmentValues {
    var customValue: TaskModel {
        get { self[CustomEnvironmentKey.self] }
        set { self[CustomEnvironmentKey.self] = newValue }
    }
}

struct StatefulBindingSectionDetailViewWithEnvironmentStructsIntermediate: View {
    var task: TaskModel
    var toggleHandler: (TaskModel) -> Void = { _ in }

    var body: some View {
        StatefulBindingSectionDetailViewWithEnvironmentStructs(task: task, toggleHandler: toggleHandler)
    }
}

struct StatefulBindingSectionDetailViewWithEnvironmentStructs: View {
    var task: TaskModel
    var toggleHandler: (TaskModel) -> Void = { _ in }

    var body: some View {
        VStack(alignment: .leading) {

            Button(action: {
                toggleHandler(task)
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
        }
        .padding()
    }
}

/**
 I find it simpler to use hoisting as declared in Jetpack Compose..
 I am aware of passing through a state and handlers across several intermediate Views..
 But I also believe is the creator of the Swift UI design to be as flat as possible.
 */
#Preview {
    @Previewable
    @State
    var statefulTask = TaskModel(name: "Study Swift", isCompleted: true)

    StatefulBindingSectionDetailViewWithEnvironmentStructsIntermediate(task: statefulTask) { task in
        statefulTask = TaskModel(name: task.name, isCompleted: !task.isCompleted, lastCompleted: task.lastCompleted)
    }
}

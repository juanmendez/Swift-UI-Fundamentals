//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct SectionDetailView: View {
    let task: TaskModel
    var onCompletionChange: (TaskModel) -> Void = { _ in }
    var body: some View {
        VStack {
            Text(task.name)
            Image("FloorPlan")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button(
                action: {
                    onCompletionChange(task)
                },
                label: {
                    if task.isCompleted {
                        Text("Mark Incomplete")
                    } else {
                        Text("Mark complete")
                    }
                })
        }
    }
}

#Preview {
    SectionDetailView(task: TaskModel(name: "hello", isCompleted: false))
}

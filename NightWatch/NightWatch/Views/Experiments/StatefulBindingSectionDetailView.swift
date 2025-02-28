//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct StatefulBindingSectionDetailView: View {
    @Binding var task: TaskModel

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
            
            Button("Mark as complete") {
                task = TaskModel(name: task.name, isCompleted: !task.isCompleted)
            }
        }
    }
}

#Preview {
    @Previewable
    @State
    var statefulTask = TaskModel(name: "Study Swift", isCompleted: true)
    
    StatefulBindingSectionDetailView(task: $statefulTask)
}

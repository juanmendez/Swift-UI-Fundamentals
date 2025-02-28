//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct SectionView: View {
    let sectionModel: SectionModel
    let onMoveHandler: ((IndexSet, Int) -> Void)
    let onDeleteHandler: (TaskModel) -> Void
    let onCompletionChange: (TaskModel) -> Void

    init(
        sectionModel: SectionModel,
        onMoveHandler: @escaping (IndexSet, Int) -> Void = { _, _ in },
        onDeleteHandler: @escaping (TaskModel) -> Void = { _ in },
        onCompletionChange: @escaping (TaskModel) -> Void = { _ in }
    ) {
        self.sectionModel = sectionModel
        self.onMoveHandler = onMoveHandler
        self.onDeleteHandler = onDeleteHandler
        self.onCompletionChange = onCompletionChange
    }

    var body: some View {
        Section(
            content: {
                ForEach(sectionModel.tasks, id: \.self) { task in
                    NavigationLink {
                        SectionDetailView(task: task, onCompletionChange: self.onCompletionChange)
                    } label: {
                        TaskRow(task: task)
                    }
                }
                .onDelete { indexSet in
                    onDeleteHandler(sectionModel.tasks[indexSet.first ?? 0])
                }
                .onMove { indices, newOffset in
                    onMoveHandler(indices, newOffset)
                }
            },
            header: {
                SectionHeaderView(
                    sectionHeaderModel: sectionModel.sectionHeaderModel
                )
            }
        )
    }
}

#Preview {
    SectionView(
        sectionModel: SectionModel(
            sectionHeaderModel: SectionHeaderModel(symbolSystemName: "moon.stars", headerText: "Nightly Task", fontColor: .black),
            tasks: nightlyTasks
        )
    )
}

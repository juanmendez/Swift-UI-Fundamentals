//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct ExperimentListGestures: View {
    var sectionModel: SectionModel

    var onMoveHandler: ((IndexSet, Int) -> Void)
    var onDeleteHandler: (TaskModel) -> Void

    var body: some View {
        List {
            SectionView(
                sectionModel: sectionModel,
                onMoveHandler: onMoveHandler,
                onDeleteHandler: onDeleteHandler
            )

        }
        .listStyle(GroupedListStyle())
    }
}

/**
 This privew is action like a ViewModel. I don't like how the last chapter starts adding logic within rather than be controlled by its ViewModel.
 */
#Preview {
    @Previewable
    @State
    var sectionModel = SectionModel(
        sectionHeaderModel: sectionHeaderModels[0],
        tasks: nightlyTasks
    )

    var tasks = nightlyTasks

    ExperimentListGestures(
        sectionModel: sectionModel
    ) { indices, newOffset in

        tasks.move(fromOffsets: indices, toOffset: newOffset)
        sectionModel = SectionModel(sectionHeaderModel: sectionModel.sectionHeaderModel, tasks: tasks)

    } onDeleteHandler: { taskModel in
        tasks.removeAll(where: { $0 == taskModel })
        sectionModel = SectionModel(sectionHeaderModel: sectionModel.sectionHeaderModel, tasks: tasks)
    }
}

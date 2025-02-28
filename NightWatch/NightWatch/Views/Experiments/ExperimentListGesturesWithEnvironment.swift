//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct ExperimentListGesturesWithEnvironmentParetView : View {
    var body: some View {
        ExperimentListGesturesWithEnvironment()
    }
}

struct ExperimentListGesturesWithEnvironment: View {
    @Environment(ExperimentListGesturesWithEnvironmentViewModel.self) private var viewModel

    var body: some View {
        List {
            SectionView(
                sectionModel: viewModel.sectionModel,
                onMoveHandler: viewModel.onMoveHandler,
                onDeleteHandler: viewModel.onDeleteHandler
            )

        }
        .listStyle(GroupedListStyle())
    }
}

@Observable
class ExperimentListGesturesWithEnvironmentViewModel {
    var tasks = nightlyTasks

    var sectionModel = SectionModel(
        sectionHeaderModel: sectionHeaderModels[0],
        tasks: nightlyTasks
    )

    func onMoveHandler(indices: IndexSet, newOffset: Int) {
        tasks.move(fromOffsets: indices, toOffset: newOffset)
        sectionModel = SectionModel(sectionHeaderModel: sectionModel.sectionHeaderModel, tasks: tasks)
    }

    func onDeleteHandler(taskModel: TaskModel) {
        tasks.removeAll(where: { $0 == taskModel })
        sectionModel = SectionModel(sectionHeaderModel: sectionModel.sectionHeaderModel, tasks: tasks)
    }
}

/**
 This privew is action like a ViewModel. I don't like how the last chapter starts adding logic within rather than be controlled by its ViewModel.
 */
#Preview {
    @Previewable
    @State var viewModel = ExperimentListGesturesWithEnvironmentViewModel()

    ExperimentListGesturesWithEnvironmentParetView().environment(viewModel)
}

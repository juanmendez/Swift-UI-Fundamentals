//
//  SectionsViewModel.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/23/25.
//

import Combine
import Foundation

class SectionsViewModel: ObservableObject {

    @Published private(set) var sectionModels = [SectionModel]()

    @Published var focusOn = false

    private var cancellables = Set<AnyCancellable>()

    private var _originalSectionModels = [SectionModel]()

    private var originalSectionModels: [SectionModel] {
        get {
            _originalSectionModels
        }

        set {
            _originalSectionModels = newValue
            filterByOnFocus(newSectionModels: _originalSectionModels, isFocusOn: focusOn)
        }
    }

    init() {
        $focusOn.sink { value in
            self.filterByOnFocus(newSectionModels: self._originalSectionModels, isFocusOn: value)
        }.store(in: &cancellables)

        reset()
    }

    func onMoveHandler(sectionModel: SectionModel, indices: IndexSet, newOffset: Int) {
        var mySectionModels = originalSectionModels

        if let sectionIndex = mySectionModels.firstIndex(where: { $0 == sectionModel }) {
            let sectionModel = mySectionModels[sectionIndex]
            var sectionModelTasks = sectionModel.tasks
            sectionModelTasks.move(fromOffsets: indices, toOffset: newOffset)

            mySectionModels.replaceSubrange(
                sectionIndex..<sectionIndex + 1,
                with: [
                    SectionModel(
                        sectionHeaderModel: sectionModel.sectionHeaderModel,
                        tasks: sectionModelTasks
                    )
                ]
            )

            originalSectionModels = mySectionModels
        }
    }

    func onDeleteTask(task: TaskModel) {
        var mySectionModels = originalSectionModels

        if let sectionIndex = mySectionModels.firstIndex(where: { $0.tasks.contains(task) }) {
            let sectionModel = mySectionModels[sectionIndex]
            let sectionModelTasks = sectionModel.tasks.filter { $0 != task }

            if(!sectionModelTasks.isEmpty) {
                mySectionModels.replaceSubrange(
                    sectionIndex..<sectionIndex + 1,
                    with: [
                        SectionModel(
                            sectionHeaderModel: sectionModel.sectionHeaderModel,
                            tasks: sectionModelTasks
                        )
                    ]
                )
            } else {
                mySectionModels.remove(at: sectionIndex)
            }
            
            originalSectionModels = mySectionModels
        }
    }
    
    func onCompletionChange(task: TaskModel) {
        var mySectionModels = originalSectionModels

        if let sectionIndex = mySectionModels.firstIndex(where: { $0.tasks.contains(task) }) {
            let sectionModel = mySectionModels[sectionIndex]
            var sectionModelTasks = sectionModel.tasks

            if let taskIndex = sectionModelTasks.firstIndex(of: task) {
                let updatedTask = TaskModel(name: task.name, isCompleted: !task.isCompleted)
                sectionModelTasks.replaceSubrange(taskIndex..<taskIndex + 1, with: [updatedTask])

                mySectionModels.replaceSubrange(
                    sectionIndex..<sectionIndex + 1,
                    with: [
                        SectionModel(
                            sectionHeaderModel: sectionModel.sectionHeaderModel,
                            tasks: sectionModelTasks
                        )
                    ]
                )

                originalSectionModels = mySectionModels
            }
        }
    }

    private func filterByOnFocus(newSectionModels: [SectionModel], isFocusOn: Bool) {
        sectionModels = newSectionModels.map { sectionModel in
            if isFocusOn {
               SectionModel(sectionHeaderModel: sectionModel.sectionHeaderModel, tasks: sectionModel.tasks.filter { !$0.isCompleted })
            } else {
                sectionModel
            }
        }.filter {
            !$0.tasks.isEmpty
        }
    }

    func reset() {
        originalSectionModels = [
            SectionModel(
                sectionHeaderModel: sectionHeaderModels[0],
                tasks: nightlyTasks
            ),
            SectionModel(
                sectionHeaderModel: sectionHeaderModels[1],
                tasks: weeklyTasks
            ),
            SectionModel(
                sectionHeaderModel: sectionHeaderModels[2],
                tasks: monthlyTasks
            ),
        ]
    }
}

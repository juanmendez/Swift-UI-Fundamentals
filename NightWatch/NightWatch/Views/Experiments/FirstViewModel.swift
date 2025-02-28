//
//  FirstViewModel.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/20/25.
//

import Combine
import SwiftUI

struct FirstViewModel<C: TaskViewModelContract>: View {
    @ObservedObject var viewModel: C

    var body: some View {
        VStack {
            Toggle(
                isOn: Binding(
                    get: { viewModel.isCompleted },
                    set: { _ in
                        viewModel.toggleCompletion()
                    }
                )
            ) {
                Text(viewModel.taskText)
            }
            .padding()

            Text(viewModel.isCompleted ? "Task is completed" : "Task is not completed")
        }
        .padding()
    }
}

/// This protocol is the contract between the ViewModel and the View.
/// If the ViewModel has many requirements which are difficult to mock in a preview
/// then it is easy to use an implementation of the protocol instead.
protocol TaskViewModelContract: ObservableObject {
    var taskText: String { get }
    var isCompleted: Bool { get }

    func toggleCompletion()
}

class TaskViewModel: TaskViewModelContract {
    @Published private(set) var taskText: String = "Study Swift"
    @Published private(set) var isCompleted: Bool = false

    func toggleCompletion() {
        isCompleted = !isCompleted
    }
}

class FakeViewModel: TaskViewModelContract {
    @Published private(set) var taskText: String = "Study Kotlin"
    @Published private(set) var isCompleted: Bool = false

    func toggleCompletion() {
        isCompleted = !isCompleted
    }
}

#Preview("real view model") {
    FirstViewModel(viewModel: TaskViewModel())
}

#Preview("fake view model") {
    FirstViewModel(viewModel: FakeViewModel())
}

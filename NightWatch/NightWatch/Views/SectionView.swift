//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct SectionView: View {
    let sectionModel: SectionModel
    var body: some View {
        Section(
            content: {
                ForEach(sectionModel.tasks, id: \.self) { taskName in
                    NavigationLink(taskName) {
                        SectionDetailView(title: taskName)
                    }
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

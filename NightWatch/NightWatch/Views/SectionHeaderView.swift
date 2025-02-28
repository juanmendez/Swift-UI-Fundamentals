//
//  SectionHeader.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct SectionHeaderView: View {
    let sectionHeaderModel: SectionHeaderModel

    var body: some View {
        HStack {
            Image(systemName: sectionHeaderModel.symbolSystemName)
            Text(sectionHeaderModel.headerText)
        }
        .headerStyle(color: sectionHeaderModel.fontColor)
    }
}

#Preview {
    SectionHeaderView(
        sectionHeaderModel: SectionHeaderModel(symbolSystemName: "moon.stars", headerText: "Nightly Tasks")
    )
}

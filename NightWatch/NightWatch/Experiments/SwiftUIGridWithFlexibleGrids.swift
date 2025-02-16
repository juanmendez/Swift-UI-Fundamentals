//
//  SwiftUIGrid.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/15/25.
//

import SwiftUI

struct SwifUiWithFlexibleGrids: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [
                GridItem(.flexible(minimum: 0, maximum: .infinity)),
                GridItem(.flexible(minimum: 0, maximum: .infinity)),
                GridItem(.flexible(minimum: 0, maximum: .infinity)),
            ]) {
                ForEach(nightlyTasks, id: \.self) { taskName in
                    Text(taskName)
                }
            }
        }

        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.flexible(minimum: 0, maximum: .infinity)),
                    GridItem(.flexible(minimum: 0, maximum: .infinity)),
                ],
                spacing: 60
            ) {
                ForEach(nightlyTasks, id: \.self) { taskName in
                    Text(taskName)
                }
            }
        }
    }
}

#Preview {
    SwifUiWithFlexibleGrids()
}

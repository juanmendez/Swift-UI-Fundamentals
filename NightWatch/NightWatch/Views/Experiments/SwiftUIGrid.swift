//
//  SwiftUIGrid.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/15/25.
//

import SwiftUI

struct SwiftUIGrid: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [
                GridItem(.fixed(100)),
                GridItem(.fixed(100)),
                GridItem(.fixed(100)),
            ]) {
                ForEach(nightlyTasks, id: \.self) { taskName in
                    Text(taskName)
                }
            }
        }

        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.fixed(100)),
                    GridItem(.fixed(100)),
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
    SwiftUIGrid()
}

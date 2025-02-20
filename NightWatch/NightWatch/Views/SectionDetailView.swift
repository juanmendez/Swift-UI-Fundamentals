//
//  SectionView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct SectionDetailView: View {
    let title: String
    var body: some View {
        VStack {
            Text(title)
        }
    }
}

#Preview {
    SectionDetailView(title: "Test")
}

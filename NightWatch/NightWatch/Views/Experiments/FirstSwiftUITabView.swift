//
//  FirstSwiftUITabView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/19/25.
//

import SwiftUI

struct FirstSwiftUITabView: View {
    var body: some View {
        TabView() {
            SectionHeaderView(sectionHeaderModel: sectionHeaderModels[0]).tabItem{
                Image(systemName: "person.crop.circle")
                Text("My Profile")
            }
            
            SectionHeaderView(sectionHeaderModel: sectionHeaderModels[1]).tabItem{
                Image(systemName: "cart")
                Text("My Cart")
            }
            
            SectionHeaderView(sectionHeaderModel: sectionHeaderModels[2]).tabItem{
                Image(systemName: "gear")
                Text("Settings")
            }
        }
    }
}

#Preview {
    FirstSwiftUITabView()
}

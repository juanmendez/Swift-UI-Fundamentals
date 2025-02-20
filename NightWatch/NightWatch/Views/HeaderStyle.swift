//
//  HeaderStyle.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

// Here is a customed modifier
struct HeaderStyle: ViewModifier {
    var color: Color = .yellow
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.heavy)
            .foregroundStyle(color)
            .textCase(.uppercase)
            .underline()
    }
}

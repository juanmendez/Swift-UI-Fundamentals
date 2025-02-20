//
//  SectionHeaderModel.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/17/25.
//
import SwiftUI

struct SectionHeaderModel {
    let symbolSystemName: String
    let headerText: String
    let fontColor: Color
    
    init(symbolSystemName: String, headerText: String, fontColor: Color = .black) {
        self.symbolSystemName = symbolSystemName
        self.headerText = headerText
        self.fontColor = fontColor
    }
}

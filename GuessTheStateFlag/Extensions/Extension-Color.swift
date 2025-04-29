//
//  Extension-Color.swift
//  GuessTheStateFlag
//
//  Created by KBrewer on 7/3/23.
//

import SwiftUI

/// Varied gradients for backgrounds in different colors depending on light/dark mode
extension Color {
    static let lightModeColors = Gradient(colors: [.indigo, .cyan, .mint, .blue, .teal, .cyan, .mint, .indigo])
    static let darkModeColors = Gradient(colors: [.white, .red, .blue, .red, .white])
}


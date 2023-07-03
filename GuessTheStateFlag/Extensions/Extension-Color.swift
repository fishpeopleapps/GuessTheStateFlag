//
//  Extension-Color.swift
//  GuessTheStateFlag
//
//  Created by KBrewer on 7/3/23.
//

import SwiftUI

/// Varied gradients for backgrounds in different colors depending on light/dark mode
extension Color {
    static let darkModeColors = Gradient(colors: [.pink, .cyan, .mint, .indigo, .teal, .orange, .pink])
    static let lightModeColors = Gradient(colors: [.brown, .orange, .yellow, .red, .brown])
}

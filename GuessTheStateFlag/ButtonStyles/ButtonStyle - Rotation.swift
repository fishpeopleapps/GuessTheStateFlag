//
//  ButtonStyle - Rotation.swift
//  GuessTheStateFlag
//
//  Created by Kimberly Brewer on 7/6/23.
//

import SwiftUI

/// Rotates the button with animation up to 90 degrees while it is being pressed
struct RotationButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .rotationEffect(.degrees(configuration.isPressed ? 90 : 0))
            .animation(.easeIn(duration: 0.3), value: configuration.isPressed)
    }
}

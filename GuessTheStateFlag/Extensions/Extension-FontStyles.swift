//
//  Extension-FontStyles.swift
//  GuessTheStateFlag
//
//  Created by KBrewer on 7/3/23.
//

import SwiftUI

/// Holds the parameters for Title text so it can be applied where necessary when utilizing the extension below
struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.thickMaterial)
            .fontDesign(.monospaced)
            .fontWeight(.medium)
            .minimumScaleFactor(0.8)
            .padding()
    }
}

struct HeadlineText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontDesign(.monospaced)
            .fontWeight(.heavy)
            .foregroundStyle(.ultraThickMaterial)
    }
}

extension View {
    /// Takes the ViewModifier TitleText and turns it into an easy to use modifier
    /// - Returns: An easy to use modifier on text for title style
    func titleTextStyle() -> some View {
        modifier(TitleText())
    }
    /// Takes the ViewModifier HeadlineText and turns it into an easy to use modifer
    /// - Returns: An easy to use modifier on text for headline style
    func headlineTextStyle() -> some View {
        modifier(HeadlineText())
    }
}

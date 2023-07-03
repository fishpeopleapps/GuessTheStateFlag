//
//  ContentView.swift
//  GuessTheStateFlag
//
//  Created by KBrewer on 7/3/23.
//
// TODO: Conintue to comment Code
// TODO: Add a custom animation
// TODO: Add haptics if the user gets it wrong
// TODO: ooh add a bonus point if you can guess the capital
// TODO: make an app icon

import SwiftUI

struct ContentView: View {
    /// Detects if the user is using light or dark mode
    @Environment(\.colorScheme) var colorScheme
    /// We will be displaying three flags, this creates a correct answer within the three displayed
    var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            AngularGradient(
                gradient: colorScheme == .dark ? Color.darkModeColors : Color.lightModeColors,
                center: .center
            )
            VStack {
                VStack {
                    Text("Guess the Flag of")
                        .titleTextStyle()
                    Text(states[correctAnswer])
                        .headlineTextStyle()
                }
                VStack(spacing: 20) {
                    ForEach(0..<3) { num in
                        Button {
                            // flagged was tapped
                        } label: {
                            Image(states[num])
                                .cornerRadius(CGFloat(40), corners: [.topRight, .bottomLeft])
                                .shadow(color: .white, radius: 5)
                        }
                    }
                }
                .padding()
            }
           // .background(.ultraThinMaterial) // I don't like this
            .cornerRadius(15)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

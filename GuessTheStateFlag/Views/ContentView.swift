//
//  ContentView.swift
//  GuessTheStateFlag
//
//  Created by KBrewer on 7/3/23.
//
// TODO: I would like to move out the final func but I am not sure how to change views
// TODO: Improve launch screen with a photo/logo
// TODO: Also why does the launch screen stay up so long?

import SwiftUI

struct ContentView: View {
    /// Detects if the user is using light or dark mode
    @Environment(\.colorScheme) var colorScheme
    @State private var showingAlert = false
    @State private var displayBonusRound = false
    /// We're going to keep the userScore here so it can be updated within the BonusRoundView
    @Environment(GameBrain.self) var game
    /// Stores the userguess so the correct answer can be displayed in the alert
    @State private var userGuess = ""
    @State var correctCapital = ""
    @AppStorage("HighScore") private var highScore = 0
    /// View
    var body: some View {
        ZStack {
            /// Background
            AngularGradient(
                gradient: colorScheme == .dark ? Color.darkModeColors : Color.lightModeColors,
                center: .center
            )
            .ignoresSafeArea()
            /// Main View Area
            GeometryReader { geo in
                VStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text("Guess the Flag of")
                        .headlineTextStyle()
                    Text(stateList[game.correctAnswer].stateName)
                        .titleTextStyle()
                }
                .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.20)
                    VStack(spacing: 10) {
                        ForEach(0..<3) { num in
                            Button {
                                correctCapital = stateList[num].capital
                                game.animationAmt += 45.0
                                checkAnswer(num)
                                userGuess = stateList[num].stateName
                                game.nextQuestion()
                            } label: {
                                Flag(name: stateList[num].stateName)
                            }
                            .buttonStyle(RotationButton())
                        }

                    }
                    .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.65)
                VStack {
                    Text("Current Score: \(game.userScore)")
                        .headlineTextStyle()
                    Button("End Game, High Score: \(highScore)") {
                        game.endGame()
                    }.tint(.secondary)
                    Button("Reset Score") {
                        game.userScore = 0
                    }.tint(.secondary)
                }
                .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.15)
                }
            }
        }
        .sheet(isPresented: $displayBonusRound, content: {
            BonusRoundView(correctAnswer: correctCapital)
        })
        .alert("Wrong", isPresented: $showingAlert) {
            Button("Continue", action: game.nextQuestion)
        } message: {
            Text("That flag was \(userGuess)")
        }
    }
    /// Checks to see if the flag guessed matches the correct answer
    /// - Parameter num: The index tapped
    func checkAnswer(_ num: Int) {
        if num == game.correctAnswer {
            game.userScore += 1
            game.rightAnswer()
            displayBonusRound.toggle()
        } else {
            showingAlert = true
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environment(GameBrain())
    }
}

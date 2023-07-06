//
//  ContentView.swift
//  GuessTheStateFlag
//
//  Created by KBrewer on 7/3/23.
//
// TODO: Add a bonus point if you can guess the capital

import SwiftUI

struct ContentView: View {
    /// Detects if the user is using light or dark mode
    @Environment(\.colorScheme) var colorScheme
    /// We will be displaying three flags, this creates a correct answer within the three displayed
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingAlert = false
    @State private var showingSheet = false
    /// Keeps the user score in UserDefaults
    @AppStorage("score") var score: Int = 0
    /// Stores the userguess so the correct answer can be displayed in the alert
    @State private var userGuess = "Minnesota"
    /// Starts the rotation animation effect at 0
    @State private var animationAmt: Double = 0
    var body: some View {
        ZStack {
            AngularGradient(
                gradient: colorScheme == .dark ? Color.darkModeColors : Color.lightModeColors,
                center: .center
            )
            .ignoresSafeArea()
            GeometryReader { geo in
            VStack {
                VStack {
                    Text("Guess the Flag of")
                        .titleTextStyle()
                    Text(stateList[correctAnswer].stateName)
                        .headlineTextStyle()
                }
                .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.20)

                    VStack(spacing: 10) {
                        ForEach(0..<3) { num in
                            Button {
                                animationAmt += 45.0
                                checkAnswer(num)
                                userGuess = stateList[num].stateName
                            } label: {
                                    Image(stateList[num].stateName)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(CGFloat(40), corners: [.topRight, .bottomLeft])
                                        .shadow(color: .white, radius: 5)
                            }
                            .buttonStyle(RotationButton())
                        }

                    }
                    .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.65)
                VStack {
                    Text("Current Score: \(score)")
                        .headlineTextStyle()
                    Button("Reset Score") {
                        score = 0
                    }.tint(.secondary)
                }
                .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.15)

                }
            }

        }
        .alert("Wrong", isPresented: $showingAlert) {
            Button("Continue", action: nextQuestion)
        } message: {
            Text("That flag was \(userGuess)")
        }
    }
    /// Checks to see if the flag guessed matches the correct answer
    /// - Parameter num: The index tapped
    func checkAnswer(_ num: Int) {
        if num == correctAnswer {
            score += 1
            rightAnswer()
            nextQuestion()
        } else {
            showingAlert = true
        }
    }
    /// Shuffles the state list and chooses a new correct answer
    func nextQuestion() {
        animationAmt = 0
        stateList.shuffle()
        correctAnswer = Int.random(in: 0..<2)
    }
    /// Haptic vibration if user selects the correct answer
    func rightAnswer() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

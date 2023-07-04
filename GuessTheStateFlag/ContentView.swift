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
// TODO: make the image sizes dynamic
// TODO: allow users to reset their score

import SwiftUI

struct ContentView: View {
    /// Detects if the user is using light or dark mode
    @Environment(\.colorScheme) var colorScheme
    /// We will be displaying three flags, this creates a correct answer within the three displayed
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingAlert = false
    @State private var alertTitle = "Wrong"
    @AppStorage("score") var score: Int = 0

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
                    Text(stateList[correctAnswer].stateName)
                        .headlineTextStyle()
                }
                VStack(spacing: 10) {
                    ForEach(0..<3) { num in
                        Button {
                            checkAnswer(num)
                            print("Displaying \(stateList[num].stateName)")
                        } label: {
                            Image(stateList[num].stateName)
                                .cornerRadius(CGFloat(40), corners: [.topRight, .bottomLeft])
                                .shadow(color: .white, radius: 5)

                        }
                    }
                    Text("Current Score: \(score)")
                        .headlineTextStyle()
                    Button("Reset Score") {
                        score = 0
                    }.tint(.secondary)
                }
                .padding()
            }

        }
        .ignoresSafeArea()
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("Continue", action: nextQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func checkAnswer(_ num: Int) {
        if num == correctAnswer {
            score += 1
            nextQuestion()
        } else {
            showingAlert = true
        }
    }
    
    func nextQuestion() {
        stateList.shuffle()
        correctAnswer = Int.random(in: 0..<2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

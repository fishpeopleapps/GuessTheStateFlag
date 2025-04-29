//
//  GameBrain.swift
//  GuessTheStateFlag
//
//  Created by Kimberly Brewer on 7/31/23.
//
// TODO: Persist data to userDefaults

import SwiftUI

@Observable
class GameBrain {
    var userScore = 0
    var animationAmt: Double = 0
    /// We will be displaying three flags, this creates a correct answer within the three displayed
    var correctAnswer = Int.random(in: 0...2)
    /// Haptic vibration if user selects the correct answer
    func rightAnswer() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    func endGame() {
        // do more cool stuff here
        UserDefaults.standard.set(userScore, forKey: "HighScore")
    }
    /// Shuffles the state list and chooses a new correct answer
    func nextQuestion() {
        animationAmt = 0
        stateList.shuffle()
        correctAnswer = Int.random(in: 0..<2)
    }
}

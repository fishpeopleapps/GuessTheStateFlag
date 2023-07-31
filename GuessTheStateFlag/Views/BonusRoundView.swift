//
//  BonusRoundView.swift
//  GuessTheStateFlag
//
//  Created by Kimberly Brewer on 7/31/23.
//
// TODO: Improve UI
// TODO: Improve answerPool function so it's not so ugly and it doesn't have a change of inputting the correct answer twice
// TODO: Let the user know they got it right
// TODO: Let the user know they got it wrong

import SwiftUI

struct BonusRoundView: View {
    var correctAnswer: String
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var game: GameBrain
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Bonus Point")
                    .titleTextStyle()
                Text("What is the capital?")
                    .foregroundStyle(.white)
                ForEach(answerPool(correctAnswer), id: \.self) { answer in
                    Text(answer)
                        .foregroundColor(.black)
                        .frame(width: 140, height: 45)
                        .background(.mint)
                        .cornerRadius(15)
                        .onTapGesture {
                            if answer == correctAnswer {
                                game.userScore += 1
                                dismiss()
                            } else {
                                print("You got it wrong")
                                dismiss()
                            }
                        }
                }
            }
        }
        .environmentObject(game)
    }
    func answerPool(_ correctAnswer: String) -> [String] {
        var answerPool = [String]()
        answerPool.append(correctAnswer)
        answerPool.append(stateList[Int.random(in: 0...15)].capital)
        answerPool.append(stateList[Int.random(in: 16...30)].capital)
        answerPool.append(stateList[Int.random(in: 31...stateList.count - 1)].capital)
        return answerPool.shuffled()
    }
}

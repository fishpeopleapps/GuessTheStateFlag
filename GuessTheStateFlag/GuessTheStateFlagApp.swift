//
//  GuessTheStateFlagApp.swift
//  GuessTheStateFlag
//
//  Created by KBrewer on 7/3/23.
//

import SwiftUI

@main
struct GuessTheStateFlagApp: App {
    @State private var gameBrain = GameBrain()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(gameBrain)
        }
    }
}

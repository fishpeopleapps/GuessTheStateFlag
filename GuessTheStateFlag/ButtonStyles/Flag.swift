//
//  Flag.swift
//  GuessTheStateFlag
//
//  Created by Kimberly Brewer on 12/25/23.
//

import SwiftUI

struct Flag: View {
    var name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .cornerRadius(CGFloat(40), corners: [.topRight, .bottomLeft])
            .shadow(color: .white, radius: 5)
    }
}

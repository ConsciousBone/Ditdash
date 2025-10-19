//
//  LearnCharView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnCharView: View {
    @AppStorage("learnShowConversion") private var learnShowConversion = true
    // 0 is Off, 1 is On
    
    // i know theres better ways to do this, idrc though
    let textChars = [
        "a", "b", "c",
        "d", "e", "f",
        "g", "h", "i",
        "j", "k", "l",
        "m", "n", "o",
        "p", "q", "r",
        "s", "t", "u",
        "v", "w", "x",
        "y", "z"
    ]
    
    var body: some View {
        Form {
            Section {
                ForEach(textChars.indices, id: \.self) { index in
                    NavigationLink {
                        MorseLearnView(
                            text: textChars[index],
                            buttonMode: 0,
                            showConverted: learnShowConversion
                        )
                    } label: {
                        Text(textChars[index])
                    }
                }
            }
        }
        .navigationTitle("Letters")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnCharView()
}

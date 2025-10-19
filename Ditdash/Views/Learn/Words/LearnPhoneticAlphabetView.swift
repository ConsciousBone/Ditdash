//
//  LearnPhoneticAlphabetView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnPhoneticAlphabetView: View {
    let words = [
        "alpha", "bravo", "charlie",
        "delta", "echo", "foxtrot",
        "golf", "hotel", "india",
        "juliet", "kilo", "lima",
        "mike", "november", "oscar",
        "papa", "quebec", "romeo",
        "sierra", "tango", "uniform",
        "victor", "whiskey", "xray",
        "yankee", "zulu"
    ]
    var body: some View {
        Form {
            Section {
                ForEach(words.indices, id: \.self) { index in
                    NavigationLink {
                        MorseLearnView(
                            text: words[index],
                            buttonMode: 1,
                            showConverted: true
                        )
                    } label: {
                        Text(words[index])
                    }
                }
            }
        }
        .navigationTitle("Phonetic Alphabet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnPhoneticAlphabetView()
}

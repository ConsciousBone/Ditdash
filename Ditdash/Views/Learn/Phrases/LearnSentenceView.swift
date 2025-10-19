//
//  LearnSentenceView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnSentenceView: View {
    let sentences = [
        "the quick brown fox jumps over the lazy dog",
        "hello world", "good morning",
        "practice makes perfect", "time flies"
    ]
    var body: some View {
        Form {
            Section {
                ForEach(sentences.indices, id: \.self) { index in
                    NavigationLink {
                        MorseLearnView(
                            text: sentences[index],
                            buttonMode: 2,
                            showConverted: true
                        )
                    } label: {
                        Text(sentences[index])
                    }
                }
            }
        }
    }
}

#Preview {
    LearnSentenceView()
}

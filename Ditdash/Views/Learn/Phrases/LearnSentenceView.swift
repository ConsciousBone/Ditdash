//
//  LearnSentenceView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnSentenceView: View {
    @AppStorage("learnShowConversion") private var learnShowConversion = 1
    // 0 is Off, 1 is On
    
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
                            showConverted: learnShowConversion == 1
                        )
                    } label: {
                        Text(sentences[index])
                    }
                }
            }
        }
        .navigationTitle("Sentences")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnSentenceView()
}

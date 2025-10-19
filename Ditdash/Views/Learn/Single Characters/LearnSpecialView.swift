//
//  LearnSpecialView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnSpecialView: View {
    @AppStorage("learnShowConversion") private var learnShowConversion = true
    // 0 is Off, 1 is On
    
    let textChars = [
        ",", ".", "?",
        "\"", ":", "'",
        "-", "/", "(",
        ")", "!", "@"
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
        .navigationTitle("Symbols")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnSpecialView()
}

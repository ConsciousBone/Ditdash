//
//  LearnSpecialView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnSpecialView: View {
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
                            showConverted: true
                        )
                    } label: {
                        Text(textChars[index])
                    }
                }
            }
        }
    }
}

#Preview {
    LearnSpecialView()
}

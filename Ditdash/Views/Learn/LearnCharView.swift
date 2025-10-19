//
//  LearnCharView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnCharView: View {
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
    let morseChars = [
        ".-", "-...", "-.-.", // a b c
        "-..", ".", "..-.", // d e f
        "--.", "....", "..", // g h i
        ".---", "-.-", ".-..", // j k l
        "--", "-.", "---", // m n o
        ".--.", "--.-", ".-.", // p q r
        "...", "-", "..-", // s t u
        "...-", ".--", "-..-", // v w x
        "-.--", "--.."
    ]
    var body: some View {
        Form {
            Section {
                ForEach(textChars.indices, id: \.self) { index in
                    
                }
            }
        }
    }
}

#Preview {
    LearnCharView()
}

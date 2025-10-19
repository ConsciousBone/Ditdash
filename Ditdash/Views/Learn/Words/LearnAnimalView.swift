//
//  LearnAnimalView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnAnimalView: View {
    @AppStorage("learnShowConversion") private var learnShowConversion = 1
    // 0 is Off, 1 is On
    
    let animals = [
        "dog", "cat", "chicken",
        "cow", "donkey", "goat",
        "pig", "horse", "rat",
        "sheep", "mouse", "rabbit",
        "ant", "fly", "moth",
        "spider", "butterfly", "bee"
    ]
    
    var body: some View {
        Form {
            Section {
                ForEach(animals.indices, id: \.self) { index in
                    NavigationLink {
                        MorseLearnView(
                            text: animals[index],
                            buttonMode: 1,
                            showConverted: learnShowConversion == 1
                        )
                    } label: {
                        Text(animals[index])
                    }
                }
            }
        }
        .navigationTitle("Animals")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnAnimalView()
}

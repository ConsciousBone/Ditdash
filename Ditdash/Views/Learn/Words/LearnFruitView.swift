//
//  LearnFruitView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnFruitView: View {
    @AppStorage("learnShowConversion") private var learnShowConversion = true
    // 0 is Off, 1 is On
    
    let fruits = [
        "apple", "banana", "cherry",
        "dragonfruit", "elderberry", "fig",
        "grape", "hackberry", "jujube",
        "kiwi", "lime", "mango",
        "nectarine", "olive", "peach",
        "raspberry", "starfruit", "tangerine"
    ]
    
    var body: some View {
        Form {
            Section {
                ForEach(fruits.indices, id: \.self) { index in
                    NavigationLink {
                        MorseLearnView(
                            text: fruits[index],
                            buttonMode: 1,
                            showConverted: learnShowConversion
                        )
                    } label: {
                        Text(fruits[index])
                    }
                }
            }
        }
        .navigationTitle("Fruit")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnFruitView()
}

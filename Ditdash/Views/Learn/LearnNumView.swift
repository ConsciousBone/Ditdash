//
//  LearnNumView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnNumView: View {
    let textChars = [
        "0", "1", "2",
        "3", "4", "5",
        "6", "7", "8",
        "9"
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
        .navigationTitle("Numbers")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnNumView()
}

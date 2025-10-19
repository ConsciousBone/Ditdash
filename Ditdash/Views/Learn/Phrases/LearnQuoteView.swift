//
//  LearnQuoteView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnQuoteView: View {
    let quotes = [
        "you only live once", "believe you can and you're half way there",
        "to be or not to be, that is the question", "stay hungry, stay foolish",
        "less is more", "knowledge is power",
        "time is money", "i think, therefore i am"
    ]
    
    var body: some View {
        Form {
            Section {
                ForEach(quotes.indices, id: \.self) { index in
                    NavigationLink {
                        MorseLearnView(
                            text: quotes[index],
                            buttonMode: 2,
                            showConverted: true
                        )
                    } label: {
                        Text(quotes[index])
                    }
                }
            }
        }
    }
}

#Preview {
    LearnQuoteView()
}

//
//  LearnView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct LearnView: View {
    var body: some View {
        Form {
            Section {
                Text("Learn morse code with the innovative Ditdash Learn mode!")
            }
            
            Section {
                NavigationLink {
                    LearnCharView()
                } label: {
                    Label("Letters", systemImage: "characters.lowercase")
                }
                
                NavigationLink {
                    LearnNumView()
                } label: {
                    Label("Numbers", systemImage: "numbers")
                }
                
                NavigationLink {
                    LearnSpecialView()
                } label: {
                    Label("Symbols", systemImage: "exclamationmark.questionmark")
                }
            } header: {
                Text("Single Characters")
            }
            
            Section {
                NavigationLink {
                    LearnSentenceView()
                } label: {
                    Label("Sentences", systemImage: "text.word.spacing")
                }
                NavigationLink {
                    LearnQuoteView()
                } label: {
                    Label("Quotes", systemImage: "text.quote")
                }
            } header: {
                Text("Phrases")
            }
        }
        .navigationTitle("Learn")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnView()
}

//
//  ContentView.swift
//  Ditdash
//
//  Created by Evan Plant on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Morse", systemImage: "ellipsis") {
                MorseView()
            }
            Tab("Dictionary", systemImage: "book") {
                DictionaryView()
            }
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}

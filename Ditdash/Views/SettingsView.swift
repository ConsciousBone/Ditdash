//
//  SettingsView.swift
//  Ditdash
//
//  Created by Evan Plant on 14/10/2025.
//

import SwiftUI

struct SettingsView: View {
    // Accent colours
    @AppStorage("selectedAccentIndex") private var selectedAccentIndex = 5
    let accentColours = [
        Color.red.gradient,     Color.orange.gradient,
        Color.yellow.gradient,  Color.green.gradient,
        Color.mint.gradient,    Color.blue.gradient,
        Color.purple.gradient,  Color.brown.gradient,
        Color.white.gradient,   Color.black.gradient
    ]
    let accentColourNames = [
        "Red",     "Orange",
        "Yellow",  "Green",
        "Mint",    "Blue",
        "Purple",  "Brown",
        "White",   "Black"
    ]
    
    // Learn settings
    let learnButtonModes = ["Adaptive", "Full"]
    @AppStorage("learnButtonMode") private var learnButtonMode = 0
    // 0 is Adaptive, 1 is Full
    
    var body: some View {
        Form {
            Section {
                Picker(selection: $selectedAccentIndex) {
                    ForEach(accentColours.indices, id: \.self) { i in
                        Text(accentColourNames[i])
                    }
                } label: {
                    Label("Accent Color", systemImage: "paintpalette")
                }
            }
            
            Section {
                Picker(selection: $learnButtonMode) {
                    ForEach(learnButtonModes.indices, id: \.self) { i in
                        Text(learnButtonModes[i])
                    }
                } label: {
                    Label("Button Mode", systemImage: "button.horizontal")
                }
            } header: {
                Text("Learn")
            }
        }
    }
}

#Preview {
    SettingsView()
}

//
//  SettingsView.swift
//  Ditdash
//
//  Created by Evan Plant on 14/10/2025.
//

import SwiftUI

struct SettingsView: View {
    // Theme settings
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
    @AppStorage("selectedAccentIndex") private var selectedAccentIndex = 5
    
    let ditDashPositions = ["Top", "Bottom"]
    @AppStorage("ditDashPosition") private var ditDashPosition = 0
    // 0 is Top, 1 is Bottom
    
    let morsePositions = ["Top", "Bottom"]
    @AppStorage("morsePosition") private var morsePosition = 0
    // 0 is Top, 1 is Bottom
    
    // Learn settings
    let learnButtonModes = ["Adaptive", "Full"]
    @AppStorage("learnButtonMode") private var learnButtonMode = 0
    // 0 is Adaptive, 1 is Full
    
    @AppStorage("learnShowConversion") private var learnShowConversion = true
    // 0 is Off, 1 is On
    
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
                
                Picker(selection: $ditDashPosition) {
                    ForEach(ditDashPositions.indices, id: \.self) { i in
                        Text(ditDashPositions[i])
                    }
                } label: {
                    Label("Dit/Dash Alignment", systemImage: "align.vertical.center")
                }
                
                Picker(selection: $morsePosition) {
                    ForEach(morsePositions.indices, id: \.self) { i in
                        Text(morsePositions[i])
                    }
                } label: {
                    Label("Morse Alignment", systemImage: "align.vertical.center")
                }
            } header: {
                Text("Theming")
            }
            
            Section {
                Picker(selection: $learnButtonMode) {
                    ForEach(learnButtonModes.indices, id: \.self) { i in
                        Text(learnButtonModes[i])
                    }
                } label: {
                    Label("Button Mode", systemImage: "button.horizontal")
                }
                Toggle(isOn: $learnShowConversion, label: {
                    Label("Show Conversion", systemImage: "arrow.left.arrow.right")
                })
            } header: {
                Text("Learn")
            }
        }
    }
}

#Preview {
    SettingsView()
}

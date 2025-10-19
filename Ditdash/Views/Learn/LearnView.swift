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
                Text("Learn morse code with the Ditdash Learn mode!")
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
            }
        }
    }
}

#Preview {
    LearnView()
}

//
//  MorseView.swift
//  Ditdash
//
//  Created by Evan Plant on 14/10/2025.
//

import SwiftUI

struct MorseView: View {
    var body: some View {
        Spacer()
        Text("- - . / . . .") // demo text
            .font(.title.monospaced())
            .fontWeight(.bold)
            .padding()
            .multilineTextAlignment(.center)
        Spacer()
        
        HStack(spacing: 0) {
            Button {
                print("dit")
            } label: {
                Circle()
                    .frame(width: 25)
                    .foregroundStyle(.foreground)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(RoundedRectangle(cornerRadius: 15).foregroundStyle(.blue))
            .padding(7)
            Button {
                print("dash")
            } label: {
                ZStack {
                    Capsule()
                        .frame(width: 50, height: 25)
                        .foregroundStyle(.foreground)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(RoundedRectangle(cornerRadius: 15).foregroundStyle(.blue))
            .padding(7)
        }
        
        Spacer()
    }
}

#Preview {
    MorseView()
}

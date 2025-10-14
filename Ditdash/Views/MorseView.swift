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
        
        Text("example text")
            .font(.headline.monospaced())
            .padding()
            .multilineTextAlignment(.center)
        
        Spacer()
        
        VStack {
            HStack(spacing: 10) {
                Button {
                    print("dit")
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 25)
                            .foregroundStyle(.foreground)
                            .padding()
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                
                Button {
                    print("dash")
                } label: {
                    ZStack {
                        Capsule()
                            .frame(width: 75, height: 25)
                            .foregroundStyle(.foreground)
                            .padding()
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
            }
            
            HStack(spacing: 10) {
                Button {
                    print("clear")
                } label: {
                    ZStack {
                        Label("Clear", systemImage: "xmark")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: 50, maxHeight: 50)
                
                Button {
                    print("space")
                } label: {
                    ZStack {
                        Label("Space", systemImage: "space")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                Button {
                    print("next char")
                } label: {
                    ZStack {
                        Label("Next Char", systemImage: "line.diagonal")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                Button {
                    print("delete")
                } label: {
                    ZStack {
                        Label("Delete", systemImage: "delete.left")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                Button {
                    print("lock buttons")
                } label: {
                    ZStack {
                        Label("Lock", systemImage: "lock")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: 50, maxHeight: 50)
            }
        }
        .padding()
    }
}

#Preview {
    MorseView()
}

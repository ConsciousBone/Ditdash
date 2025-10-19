//
//  MorseView.swift
//  Ditdash
//
//  Created by Evan Plant on 14/10/2025.
//

import SwiftUI

struct MorseView: View {
    @State private var morse = ""
    @State private var morseConverted = ""
    @State private var buttonsLocked = false
    
    @AppStorage("ditDashPosition") private var ditDashPosition = 0
    // 0 is Top, 1 is Bottom
    @AppStorage("morsePosition") private var morsePosition = 0
    // 0 is Top, 1 is Bottom
    
    var body: some View {
        Spacer()
        
        if morsePosition == 1 {
            Text(morseConverted.isEmpty ? "Enter some morse..." : morseConverted)
                .foregroundStyle(morseConverted.isEmpty ? .tertiary : .secondary)
                .font(.headline.monospaced())
                .padding()
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        
        Text(morse.isEmpty ? ".-- --- ..-" : morse)
            .foregroundStyle(morse.isEmpty ? .secondary : .primary)
            .font(.title.monospaced())
            .fontWeight(.bold)
            .padding()
            .multilineTextAlignment(.center)
            .onChange(of: morse) {
                morseConverted = convertMorseToText(morse: morse)
            }
        
        if morsePosition == 0 {
            Spacer()
            
            Text(morseConverted.isEmpty ? "Enter some morse..." : morseConverted)
                .foregroundStyle(morseConverted.isEmpty ? .tertiary : .secondary)
                .font(.headline.monospaced())
                .padding()
                .multilineTextAlignment(.center)
            
            
        }
        
        Spacer()
        
        VStack {
            if ditDashPosition == 0 {
                HStack(spacing: 10) {
                    Button {
                        print("dit")
                        morse.append(".")
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
                    .disabled(buttonsLocked)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    
                    Button {
                        print("dash")
                        morse.append("-")
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
                    .disabled(buttonsLocked)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                }
            }
            
            HStack(spacing: 10) {
                Button {
                    print("clear")
                    morse = ""
                } label: {
                    ZStack {
                        Label("Clear", systemImage: "xmark")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .disabled(buttonsLocked)
                .frame(maxWidth: 50, maxHeight: 50)
                
                Button {
                    print("delete")
                    if morse.hasSuffix(" / ") { // remove slash and spaces
                            morse.removeLast(3)
                        } else if !morse.isEmpty { // remove last char
                            morse.removeLast()
                        }
                } label: {
                    ZStack {
                        Label("Delete", systemImage: "delete.left")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .disabled(buttonsLocked)
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                Button {
                    print("next char (space)")
                    morse.append(" ")
                } label: {
                    ZStack {
                        Label("Next Character", systemImage: "space")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .disabled(buttonsLocked)
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                Button {
                    print("space")
                    morse.append(" / ")
                } label: {
                    ZStack {
                        Label("Space", systemImage: "line.diagonal")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .disabled(buttonsLocked)
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                Button {
                    print("lock buttons")
                    withAnimation {
                        buttonsLocked.toggle()
                    }
                } label: {
                    ZStack {
                        Label("Lock", systemImage: buttonsLocked ? "lock" : "lock.open")
                            .foregroundStyle(.foreground)
                            .labelStyle(.iconOnly)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: 50, maxHeight: 50)
            }
            
            if ditDashPosition == 1 {
                HStack(spacing: 10) {
                    Button {
                        print("dit")
                        morse.append(".")
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
                    .disabled(buttonsLocked)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    
                    Button {
                        print("dash")
                        morse.append("-")
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
                    .disabled(buttonsLocked)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                }
            }
        }
        .padding()
    }
}

#Preview {
    MorseView()
}

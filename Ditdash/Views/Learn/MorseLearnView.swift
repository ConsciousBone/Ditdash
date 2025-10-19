//
//  MorseLearnView.swift
//  Ditdash
//
//  Created by Evan Plant on 19/10/2025.
//

import SwiftUI

struct MorseLearnView: View {
    let text: String
    let buttonMode: Int
    // 0 = dit, dash, backspace, clear (single characters)
    // 1 = dit, dash, backspace, space, clear (words)
    // 2 = dit, dash, backspace, space, slash, clear (phrases)
    let showConverted: Bool
    
    @State private var morse = ""
    @State private var morseConverted = ""
    @State private var buttonsLocked = false
    
    @State private var correctInput = false
    @State private var correctAlertShowing = false
    
    @AppStorage("ditDashPosition") private var ditDashPosition = 0
    // 0 is Top, 1 is Bottom
    @AppStorage("morsePosition") private var morsePosition = 0
    // 0 is Top, 1 is Bottom
    @AppStorage("learnButtonMode") private var learnButtonMode = 0
    // 0 is Adaptive, 1 is Full
    @AppStorage("learnClearUponCompletion") private var learnClearUponCompletion = true
    
    var body: some View {
        Text("Type \"\(text)\" in morse code.")
            .font(.title)
            .multilineTextAlignment(.center)
            .padding()
        
        Spacer()
        
        if showConverted && morsePosition == 1 {
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
                correctInput = learnConvertMorseToText(
                    morse: morse,
                    text: text
                )
                if correctInput {
                    correctAlertShowing.toggle()
                }
            }
        // yes i know this is a bad place for an alert, idrc though
            .alert("Correct answer!",
                isPresented: $correctAlertShowing,
                actions: {
                Button("OK", role: .cancel) {
                    if learnClearUponCompletion {
                        morse = ""
                    }
                }}, message: {
                    Text("\"\(text)\" is \"\(morse)\" in morse code.")
                }
            )
        
        if showConverted && morsePosition == 0 {
            Spacer()
            
            Text(morseConverted.isEmpty ? "Enter some morse..." : morseConverted)
                .foregroundStyle(morseConverted.isEmpty ? .tertiary : .secondary)
                .font(.headline.monospaced())
                .padding()
                .multilineTextAlignment(.center)
        }
        
        Spacer()
        
        Text(correctInput ? "Answer correct!" : "Answer incorrect.")
            .foregroundStyle(
                correctInput ? Color.green : Color.secondary
            )
        
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
                
                if buttonMode == 1 || buttonMode == 2 || learnButtonMode == 1 {
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
                }
                
                if buttonMode == 2 || learnButtonMode == 1 {
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
                }
                
                if learnButtonMode == 1 {
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

#Preview("a, buttonMode 0, showConverted false") {
    MorseLearnView(
        text: "a",
        buttonMode: 0,
        showConverted: false
    )
}
#Preview("abc, buttonMode 1, showConverted true") {
    MorseLearnView(
        text: "abc",
        buttonMode: 1,
        showConverted: true
    )
}
#Preview("abc, buttonMode 2, showConverted true") {
    MorseLearnView(
        text: "abc",
        buttonMode: 2,
        showConverted: true
    )
}


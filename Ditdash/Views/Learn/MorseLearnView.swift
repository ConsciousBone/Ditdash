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
    // 0 = dit, dash, backspace, clear
    // 1 = dit, dash, backspace, space, clear
    // 2 = dit, dash, backspace, space, slash, clear
    let showConverted: Bool
    
    @State private var morse = ""
    @State private var morseConverted = ""
    @State private var correctInput = false
    
    @State private var correctAlertShowing = false
    
    var body: some View {
        Text("Type \"\(text)\" in morse code.")
            .font(.title)
            .padding()
        
        Spacer()
        
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
                Button("OK", role: .cancel) { morse = "" } // clear morse
                }, message: {
                    Text("\"\(text)\" is \"\(morse)\" in morse code.")
                }
            )
        
        if showConverted {
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
                .frame(maxWidth: .infinity, maxHeight: 200)
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
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                if buttonMode == 1 || buttonMode == 2 {
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
                    .frame(maxWidth: .infinity, maxHeight: 50)
                }
                
                if buttonMode == 2 {
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
                    .frame(maxWidth: .infinity, maxHeight: 50)
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


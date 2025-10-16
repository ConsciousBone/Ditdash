//
//  Function.swift
//  Ditdash
//
//  Created by Evan Plant on 16/10/2025.
//

import Foundation

let textChars = [ // i know theres better ways, idrc though
    "a", "b", "c",
    "d", "e", "f",
    "g", "h", "i",
    "j", "k", "l",
    "m", "n", "o",
    "p", "q", "r",
    "s", "t", "u",
    "v", "w", "x",
    "y", "z"
] // TODO: add numbers, symbols, foreign chars, etc etc

let morseChars = [
    ".-", "-...", "-.-.",
    "-..", ".", "..-.",
    "--.", "....", "..",
    ".---", "-.-", ".-..",
    "--", "-.", "---",
    ".--.", "--.-", ".-.",
    "...", "-", "..-",
    "...-", ".--", "-..-",
    "-.--", "--.."
]

func convertMorseToText(morse: String) {
    print("converting '\(morse)' to text...")
}

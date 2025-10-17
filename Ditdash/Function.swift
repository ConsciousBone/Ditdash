//
//  Function.swift
//  Ditdash
//
//  Created by Evan Plant on 16/10/2025.
//

import Foundation

// i know theres better ways to do this, idrc though
let textChars = [
    "a", "b", "c",
    "d", "e", "f",
    "g", "h", "i",
    "j", "k", "l",
    "m", "n", "o",
    "p", "q", "r",
    "s", "t", "u",
    "v", "w", "x",
    "y", "z", // start numbers
    "0", "1", "2",
    "3", "4", "5",
    "6", "7", "8",
    "9", // start symbols
    ",", ".", "?",
    "\"", ":", "'",
    "-", "/", "(",
    ")", "!", "@"
]
let morseChars = [
    ".-", "-...", "-.-.", // a b c
    "-..", ".", "..-.", // d e f
    "--.", "....", "..", // g h i
    ".---", "-.-", ".-..", // j k l
    "--", "-.", "---", // m n o
    ".--.", "--.-", ".-.", // p q r
    "...", "-", "..-", // s t u
    "...-", ".--", "-..-", // v w x
    "-.--", "--..", // y z, start numbers
    "-----", ".----", "..---", // 0, 1, 2
    "...--", "....-", ".....", // 3, 4, 5
    "-....", "--...", "---..", // 6, 7, 8
    "----.", // 9, start symbols
    "--..--", ".-.-.-", "..--..", // , . ?
    ".-..-.", "---...", ".----.", // " : '
    "-....-", "-..-.", "-.--.", // - / (
    "-.--.-", "-.-.--", ".--.-." // ) !
]

func convertMorseToText(morse: String) -> String {
    // morse input will be formatted like:
    // -... .- - / --- .- -.
    // meaning "bat man", so each morse char has a space
    // separating them, and each word has a / separating them.
    print("converting '\(morse)' to text...")
    
    // get individual words in morse
    let morseSplit = morse.split(separator: " ", omittingEmptySubsequences: true).map { String($0) }
    let morseWords = morseSplit.map { $0 == "/" ? " " : $0 }
    print(morseWords)
    
    // convert morse to chars
    var output = ""
    for morse in morseWords {
        if morse == " " {
            output.append(" ")
        } else if let index = morseChars.firstIndex(of: morse) {
            output.append(textChars[index])
        } else { // safely error
            output.append("?")
        }
    }
    
    // converted, return the output
    print("converted, output: \(output)")
    return output
}

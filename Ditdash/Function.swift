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

func convertMorseToText(morse: String) {
    print("converting '\(morse)' to text...")
}

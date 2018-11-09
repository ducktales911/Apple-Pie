//
//  Game.swift
//  Apple Pie
//
//  Created by Thomas Hamburger on 09/11/2018.
//  Copyright © 2018 Thomas Hamburger. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        for letter in word.characters{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
                
            } else {
                guessedWord += "_ "
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.characters.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}


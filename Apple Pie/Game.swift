//
//  Game.swift
//  Apple Pie
//
//  Created by Thomas Hamburger on 09/11/2018.
//  Copyright © 2018 Thomas Hamburger. All rights reserved.
//

import Foundation

// Representeert de huidige toestand van het spel.
struct Game {

    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]

    // Computed property die wordt gegenereerd in de updateUI() en updateGameState() van ViewController.swift. Geef de goedgekozen letters weer met underscores als onontdekte letters.
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_ "
            }
        }
        return guessedWord
    }

    // Wordt na elke tap op letter button aangeroepen. Update de guessedLetters array.
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}

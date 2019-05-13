//
//  ViewController.swift
//  Apple Pie
//
//  Created by Thomas Hamburger on 09/11/2018.
//  Copyright © 2018 Thomas Hamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentGame: Game!
    var listOfWords = ["chair", "wheelchair", "applepie", "baseball", "bobcat", "tabletennis"]
    let incorrectMovesAllowed = 7

    // newRound() wordt uitgevoerd wanneer waarden van totalWins of totalLosses aangpast worden.
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!

    // Wordt uitgevoerd als een letter wordt gekozen. Zet knop op disabled en geef de letter door aan playerGuessed() functie.
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    // Kies een nieuw woord uit de woordenlijst, maak een nieuw Game object aan en zet de UI in de initiële status.
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }

    // Zet alle knoppen weer op enabled.
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }

    // Update de labels en afbeelding van de appelboom om de huidige toestand te refelcteren.
    func updateUI() {
        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins \(totalWins), Losses \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    // Wordt na elke tap op letter button aangeroepen. Houdt totalLosses en totalWins bij.
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
}

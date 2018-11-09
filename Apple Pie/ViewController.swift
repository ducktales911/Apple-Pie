//
//  ViewController.swift
//  Apple Pie
//
//  Created by Thomas Hamburger on 09/11/2018.
//  Copyright © 2018 Thomas Hamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["chair", "wheelchair", "applepie", "baseball", "bobcat", "tabletennis"]
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0{
        didSet {
            newRound()
        }
    }

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
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
    
    var currentGame: Game!
    
    func newRound(){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI(){
        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins \(totalWins), Losses \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
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


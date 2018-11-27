//
//  HangmanBrain.swift
//  Hangman
//
//  Created by Genesis Mosquera on 11/26/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class HangmanBrain {

    var hiddeWordArray = [String]()
    func showInWord(input: String) -> String {
        let userInput = input.map { _ in return "-"}
        hiddeWordArray = userInput
        return userInput.reduce("", +)
    }
    
func checkPlayersGuess(word: [String], guess: String) -> String {
    for (index,letter) in word.enumerated() {
        if letter == guess {
            hiddeWordArray[index] = letter
        }
    }
    return hiddeWordArray.reduce("", +)
}
}

//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var hangmanBrain: HangmanBrain = HangmanBrain()
    var guessedWord = [String]()
    var userInput = ""

    @IBOutlet weak var hangTitle: UILabel!
    @IBOutlet weak var userInputLine: UITextField!
    @IBOutlet weak var hangImage: UIImageView!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var guessedLetter: UITextField!
    @IBOutlet weak var correctGuesses: UILabel!
   
    @IBAction func newGame(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInputLine.delegate = self
  guessedLetter.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
        //
        //    func textField(UITextField, shouldChangeCharactersIn: NSRange, replacementString: String) -> Bool
        //    Asks the delegate if the specified text should be changed.
        
        //use UITextField delegate to remove keyboard
        //should conform. set textField delegate to self
    }

//save user 1's input
//user 2, guess one letter at a time
// every time user2 guesses, if wrong, change image, if right, display letter
// user 2 is allowed 7 wrong guesses = keep track somehow
//
    
    extension ViewController: UITextFieldDelegate{
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()//hides keybard after use
//            print ("user entered \(userInput.text ??  "nothing entered")")
//            var guessed = userInput.text
//            guessedWord = textField.text!.map{String($0)}
//            print(guessed!)
//            return true
//        }
    switch textField {
        case userInputLine:
        guessedWord = textField.text!.map{String($0)}
        textField.isHidden = true
        userInput.append(userInputLine.text ?? "")
        print(userInputLine)
        let showInWord = hangmanBrain.showInWord(input: userInputLine.text!).lowercased()
        userInputLine.text = "\(showInWord)"
        
        case guessedLetter:
        guard let count = guessedLetter.text?.count, count == 1 else { return false }
        let usersGuess = hangmanBrain.checkPlayersGuess(word: guessedWord, guess: guessedLetter.text!)
        guessedLetter.text = ""
        userInputLine.text = "\(usersGuess)"
        default:
        break
        }
        textField.resignFirstResponder()
        return true
}

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            print(textField.text ?? "")
            return true
        }
}

//
//extension ViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        guard let isThereText = textField.text else { return false }
//        guard !isThereText.isEmpty else { return false }
//
//        textField.resignFirstResponder()
//
//        if textField == userOneInputText{
//            hangManBrain.userOneInputText = textField.text ?? ""
//            textField.clearButtonMode = .whileEditing
//            print("This is the word: \(hangManBrain.userOneInputText)")
//
//        } else if textField == guessedLetter{
//            hangManBrain.guessedLetter = textField.text ?? ""
//            print("This is the letter: \(hangManBrain.guessedLetter)")
//            textField.clearButtonMode = .whileEditing
//            textField.text = ""
//        }
//
//        if hangManBrain.letsPlay(wordToGuess: hangManBrain.userOneInputText, letterGuess: hangManBrain.guessedLetter) {
//            displayRightChoices.text = "(hangManBrain.arrayToDisplayRigthLetter)"
//
//        } else {
//            hangImage.image = hangManBrain.settingImageToFailedAttempts(attemptNum: hangManBrain.counterFailedAttempts)
//        }
//
//        //    if function to lose is true -> disable all the buttons
//        //update with lose message and word that was supposed to be guessed
//        //
//        //    if function to win is true -> disable all the buttons
//        //    update with win message and guessed word
//        //
//        return true
//    }
//
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let currentWord = userOneInputText.text ?? ""
//        let currentLetter = letterByUser.text ?? ""
//
//        var isWordRightLength = Bool()
//        var isLetterRightLength = Bool()
//
//        if currentLetter.count > 1{
//            isLetterRightLength = false
//        } else if currentLetter.count < 1 {
//            isLetterRightLength = true
//        }
//
//
//        if currentWord.count < 20 {
//            isWordRightLength = true
//        } else {
//            isWordRightLength = false
//        }
//
//        let allowedCharacters = CharacterSet.letters
//        let characterSet = CharacterSet(charactersIn: string)
//
//
//        return allowedCharacters.isSuperset(of: characterSet) && isWordRightLength && isLetterRightLength
//
//    }
//
//}


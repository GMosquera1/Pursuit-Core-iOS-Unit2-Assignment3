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
    var strikes = 0
    let allowedStrikes = 6
    
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

        switch textField {
        case userInputLine:
            guessedWord = textField.text!.map{String($0)}
            //textField.isHidden = true
            //userInput.append(userInputLine.text ?? "")
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
        
        if textField == guessedLetter {
            print("second player enter \(string)")
            if guessedWord.contains(string) {
                print("contains")
            } else {
                print("does not contain")
                strikes += 1
                changeImage()
            }
        }
        return true
    }
    func changeImage () {
        switch strikes{
        case 1:
            hangImage.image = UIImage.init(named: "hang2")
        default:
            print("nope")
    
    }
}


}

//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mysteryInputTextField: UITextField!
    
    @IBOutlet weak var displayWord: UILabel!
    
    
    @IBOutlet weak var guessedLetterTextField: UITextField!
    
    var mysteryWordArray = ""
    var playerIsPlaying = false
    
    override func viewDidLoad() {
    super.viewDidLoad()
        mysteryInputTextField.delegate = self
        guessedLetterTextField.delegate = self
        
        displayWord.text = "Let's Begin!"
        playerIsPlaying = false
  }


}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == mysteryInputTextField {
            
        turnMysteryWordToDashes()
            mysteryInputTextField.text = ""
            
            
        } else if textField == guessedLetterTextField {
//            guessedLetterTextField.text = ""
        solveforMysteryWord()
        
        }
        return true
    }
    
    
    func turnMysteryWordToDashes () {
        mysteryInputTextField.isSecureTextEntry = true
        mysteryWordArray.append(mysteryInputTextField.text ?? "")
              
        displayWord.text = String(repeating: "_  ", count: mysteryWordArray.count)
               print(mysteryWordArray)
               print(displayWord.text ?? "")
        
    }
    
    func solveforMysteryWord () {
        
      var  mysteryWordIndex:Set<Int> = []
        
repeat {
    print(mysteryWordArray)
       for (index,char) in mysteryWordArray.enumerated() {
if guessedLetterTextField.text == String(char) {
            mysteryWordIndex.insert(index)
//            guessedLetterTextField.text = ""
            
            print(mysteryWordIndex)
        }
    }
    guessedLetterTextField.text = ""
} while playerIsPlaying
        
    }
    
}

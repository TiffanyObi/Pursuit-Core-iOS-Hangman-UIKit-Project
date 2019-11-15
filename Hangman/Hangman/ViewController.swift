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
    
    @IBOutlet weak var displayHangPicture: UIImageView!
    
    var mysteryWordArray = ""
    var playerIsPlaying = false
    
    var hiddenWord:[String] = []
    var stringHiddenWord = ""
    var misses:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mysteryInputTextField.delegate = self
        guessedLetterTextField.delegate = self
        mysteryInputTextField.isSecureTextEntry = true
        displayWord.text = "Let's Begin!"
        playerIsPlaying = false
    }
    
    
}


// MARK:- textfeild info

extension ViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == mysteryInputTextField {
            
            turnMysteryWordToDashes()
            
            mysteryInputTextField.text = ""
            
            
        } else if textField == guessedLetterTextField {
            
            solveforMysteryWord()
            
            guessedLetterTextField.text = ""
          
        }
        return true
    }
    
    
    
    // MARK:- dashes function
    func turnMysteryWordToDashes () {
        
        mysteryWordArray.append(mysteryInputTextField.text ?? "")
        
        hiddenWord = Array(repeating:"_  ", count: mysteryWordArray.count)
        
        for string in hiddenWord {
            for char in string {
                
                
                if char == "_" {
                    stringHiddenWord.append("_  ")
                }
            }
        }
        
        displayWord.text = stringHiddenWord
        
        print(mysteryWordArray)
        print(displayWord.text ?? "")
        
    }
    
    
    // MARK:-solve for word func
    
    func solveforMysteryWord () {
        
        var  mysteryWordIndex:Set<Int> = []
        var wrongAnswer:Set<String> = []
        
        
            print(mysteryWordArray)
            
    for (index,char) in mysteryWordArray.enumerated() {
                
            if guessedLetterTextField.text == String(char) {
                    
        mysteryWordIndex.insert(index)
                
        } else if  guessedLetterTextField.text != String(char) {
                wrongAnswer.insert("char")
                print(wrongAnswer)
        }
    }
        if wrongAnswer.count == 1 && mysteryWordIndex.count == 0 {
                       
            playerGetsHanged()
        }
        
    
        
    for (index2,char2) in hiddenWord.enumerated() {
                    
            if mysteryWordIndex.contains(index2) && char2 == "_  " {
                        
                        hiddenWord[index2] = guessedLetterTextField.text ?? " "
                    }
                }
                
//    for element in hiddenWord {
//         for char in element {
//            if stringHiddenWord.contains(char) {
//            continue }
//            else {
//    stringHiddenWord.append(char)
//                    }
//        }
//    }
        displayWord.text = hiddenWord.description
            
            print(mysteryWordIndex)
            print(stringHiddenWord)
        guessedLetterTextField.text = ""
        }
    
    func playerGetsHanged() {
        misses += 1
        
        switch misses {
        case 1:displayHangPicture.image = #imageLiteral(resourceName: "hang1")
        case 2:displayHangPicture.image = #imageLiteral(resourceName: "hang2")
        case 3:displayHangPicture.image = #imageLiteral(resourceName: "hang3")
        case 4:displayHangPicture.image = #imageLiteral(resourceName: "hang4")
        case 5:displayHangPicture.image = #imageLiteral(resourceName: "hang5")
        case 6:displayHangPicture.image = #imageLiteral(resourceName: "hang6")
        case 7:displayHangPicture.image = #imageLiteral(resourceName: "hang7")
            
        default:
            print("error")
        }
    }
    
}





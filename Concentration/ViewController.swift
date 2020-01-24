//
//  ViewController.swift
//  Concentration
//
//  Created by Mittie Adan on 23/01/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//🐭🐷

import UIKit

class ViewController: UIViewController {

    
    var game =  Concentration()
    
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices: [String] = ["🐭", "🐷", "🐭", "🐷"]
    
    @IBOutlet var cardButons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("emojiChoices has not emoji!")
        }
        
    }
    

    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.97170645, blue: 0.124229528, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }


}



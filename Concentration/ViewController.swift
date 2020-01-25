//
//  ViewController.swift
//  Concentration
//
//  Created by Mittie Adan on 23/01/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//🐭🐷🐽🐵🐀🐖👨‍👨‍👦🐺🍗

import UIKit

class ViewController: UIViewController {

    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButons.count + 1) / 2)
    
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices: [String] = ["🐭", "🐽", "🐵", "🐷" , "🐀", "🐖", "👨‍👨‍👦", "🐺", "🍗"]
    
    var emoji = [Int: String]()
    
    @IBOutlet var cardButons: [UIButton]!
    
    //MARK: Handle Card Behaivor
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("emojiChoices has not emoji!")
        }
        
    }
    

    func updateViewFromModel() {
        for index in cardButons.indices {
            let button = cardButons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {

                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)  : #colorLiteral(red: 1, green: 0.97170645, blue: 0.124229528, alpha: 1)
            }
            
        }
        
    }
    
    func emoji(for card: Card)-> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

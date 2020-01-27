//
//  ViewController.swift
//  NewConcentration
//
//  Created by Mittie Adan on 26/01/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮 "", "", "", "",

import UIKit

class ViewController: UIViewController {

    lazy var game = NewConcentration(numberOfPairsCard: cardButtons.count)
    
    var flipCount: Int = 0 {
        didSet {
            flips.text = "Flips: \(flipCount)"
        }
    }
    
    var indexTheme = 0 {
        willSet {
            let emojiKeys = emojiArray.keys
            var keysArray = [String]()
            for keys in emojiKeys { keysArray.append(keys) }
            let themeOne = keysArray[indexTheme]
            keysArray.shuffle()
            if themeOne == keysArray[indexTheme] {
            nameTheme.text = "\(keysArray[indexTheme + 1])"
            emojiChoices = emojiArray[keysArray[indexTheme + 1]] ?? []
            } else {
            nameTheme.text = "\(keysArray[indexTheme + 1])"
            emojiChoices = emojiArray[keysArray[indexTheme + 1]] ?? []
            }
        }
    }
    
    @IBOutlet weak var flips: UILabel!
    @IBOutlet weak var nameTheme: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func newGame(_ sender: UIButton) {
        flipCount = 0
        game.score = 0
        for index in cardButtons.indices {
            game.cards[index].isFaceUp = false
            game.cards[index].isMatched = false
            cardButtons[index].setTitle("", for: UIControlState.normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.9091109633, blue: 0.3568683267, alpha: 1)
        }
        emojiChoices.removeAll()
        indexTheme += 0
       // game.cards.shuffle() ///???
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateFromModel()
            score.text = "Score: \(game.score)"
        } else {
            print("this is Button hasn't touchCard")
        }
    }
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        indexTheme += 0
    }
    
    var emoji = [Int: String]()
    
    var emojiArray: [String: [String]] = [
        "Animals" : ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷"],
        "Fruits" : ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🥝"],
        "Faces" : ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "☺️", "😊", "😇", "🙂", "🙃"],
        "Objects" : ["⌚️", "📱", "💻", "⌨️", "🖥", "🖨", "🖱", "🖲", "🕹", "🗜", "💽", "💾", "📼"],
        "Sports" : ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥅", "🏒", "🏑"],
        "Whater" : ["🌕", "☀️", "🌤", "🌧", "⛈", "❄️", "🌚", "🌞", "🌝", "🌈", "🌓", "🌑", "🌛"]
    ]
    var emojiChoices: [String] = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🙈", "🐒"]
    
    
    func    emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

    func updateFromModel() {
        for index in cardButtons.indices {
            let card = game.cards[index]
            let button = cardButtons[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {

                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.9091109633, blue: 0.3568683267, alpha: 1)
            }
        }
    }
}










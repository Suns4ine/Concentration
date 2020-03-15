//
//  ViewController.swift
//  Concentration
//
//  Created by Mittie Adan on 14/03/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numbersOfPairCards)

    var numbersOfPairCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private func updateviewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? UIColor.blue : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
        flipCount.text = "Flips: \(game.flipCounts)"
    }
    
    private struct Theme {
        var name: String
        var emojis: [String]
        var viewColor: UIColor
        var cardColor: UIColor
    }
    
    private var emojiTheme: [Theme] = [
    Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷"], viewColor: UIColor.black, cardColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
    Theme(name: "Fruits", emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🥝"], viewColor: UIColor.black, cardColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
    Theme(name: "Faces", emojis: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "☺️", "😊", "😇", "🙂", "🙃"], viewColor: UIColor.black, cardColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
    Theme(name: "Objects", emojis: ["⌚️", "📱", "💻", "⌨️", "🖥", "🖨", "🖱", "🖲", "🕹", "🗜", "💽", "💾", "📼"], viewColor: UIColor.black, cardColor:  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
    Theme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥅", "🏒", "🏑"], viewColor: UIColor.black, cardColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
    Theme(name: "Whater", emojis: ["🌕", "☀️", "🌤", "🌧", "⛈", "❄️", "🌚", "🌞", "🌝", "🌈", "🌓", "🌑", "🌛"], viewColor: UIColor.black, cardColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indexTheme = emojiTheme.count.arc4random
        updateviewFromModel()
    }

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateviewFromModel()
        } else {
            print("No card for cardButtons")
        }
    }
    
    private var indexTheme = 0 {
        didSet {
            print(indexTheme, emojiTheme[indexTheme].name)
            emoji = [Int: String]()
            titleLabel.text = emojiTheme[indexTheme].name
            
            emojiChoices = emojiTheme[indexTheme].emojis
            backgroundColor = emojiTheme[indexTheme].viewColor
            cardBackColor = emojiTheme[indexTheme].cardColor
            
            updateAppearance()
        }
    }

    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var flipCount: UILabel! {
        didSet {
            
        }
    }
    
    @IBAction func newGame() {
        game.newGame()
        indexTheme = emojiTheme.count.arc4random
        updateviewFromModel()
    }
    
    private var emoji = [Int: String]()
    private var emojiChoices = [String]()
    private var backgroundColor = UIColor.blue
    private var cardBackColor = UIColor.yellow
    
    private func updateAppearance() {
        view.backgroundColor = backgroundColor
        flipCount.textColor = cardBackColor
        titleLabel.textColor = cardBackColor
        newGameButton.setTitleColor(backgroundColor, for: .normal)
        newGameButton.backgroundColor = cardBackColor
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))}
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

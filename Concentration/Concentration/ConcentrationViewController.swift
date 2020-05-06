//
//  ViewController.swift
//  Concentration
//
//  Created by Mittie Adan on 14/03/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numbersOfPairCards)

    var theme: Int? {
        didSet {
//            emojiChoices = theme?.emojis ?? []
//            emoji = [:]
//            //titleLabel.text = theme?.name ?? "Name Theme"
//            backgroundColor = theme?.viewColor ?? UIColor.blue
//            cardBackColor = theme?.cardColor ?? UIColor.yellow
            indexTheme = theme ?? emojiTheme.count.arc4random
            updateviewFromModel()
        }
    }
    var numbersOfPairCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private func updateviewFromModel() {
        if cardButtons != nil{
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : cardBackColor
                }
            }
            flipCount.text = "Flips: \(game.flipCounts)"
        }
    }
    
    struct Theme {
        var name: String
        var emojis: [String]
        var viewColor: UIColor
        var cardColor: UIColor
    }

    
    private var emojiTheme: [Theme] = [
    Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷"], viewColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), cardColor: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)),
    Theme(name: "Fruits", emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🥝"], viewColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), cardColor: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)),
    Theme(name: "Faces", emojis: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "☺️", "😊", "😇", "🙂", "🙃"], viewColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), cardColor: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)),
    Theme(name: "Objects", emojis: ["⌚️", "📱", "💻", "⌨️", "🖥", "🖨", "🖱", "🖲", "🕹", "🗜", "💽", "💾", "📼"], viewColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cardColor:  #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)),
    Theme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥅", "🏒", "🏑"], viewColor: #colorLiteral(red: 1, green: 0.918415606, blue: 0.2051318884, alpha: 1), cardColor: #colorLiteral(red: 0.3361914456, green: 0.5688338876, blue: 1, alpha: 1)),
    Theme(name: "Whater", emojis: ["🌕", "☀️", "🌤", "🌧", "⛈", "❄️", "🌚", "🌞", "🌝", "🌈", "🌓", "🌑", "🌛"], viewColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), cardColor: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateviewFromModel()
    }

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
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
            emojiChoices = emojiTheme[indexTheme].emojis
            backgroundColor = emojiTheme[indexTheme].viewColor
            cardBackColor = emojiTheme[indexTheme].cardColor

            updateAppearance()
            titleLabel.text = emojiTheme[indexTheme].name
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
//        let newIndexTheme = indexTheme
//        if newIndexTheme == emojiTheme.count.arc4random {
//            print(newIndexTheme)
//            if newIndexTheme == 0 {
//                indexTheme = newIndexTheme + 1
//            } else {
//                indexTheme = newIndexTheme - 1
//            }
//        } else {
//        indexTheme = emojiTheme.count.arc4random
//            print(indexTheme)
//        }
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

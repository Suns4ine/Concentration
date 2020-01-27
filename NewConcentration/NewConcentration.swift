//
//  NewConcentration.swift
//  NewConcentration
//
//  Created by Mittie Adan on 26/01/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import Foundation


class NewConcentration {

    var cards = [Card]()
    
    var score = 0
    
    var indexOfOneAdndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAdndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAdndOnlyFaceUpCard =  nil
            } else {
                for flipdownIndex in cards.indices {
                 cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAdndOnlyFaceUpCard = index
            }
        }
    }
 
    
    init(numberOfPairsCard: Int) {
        
        for _ in 1...numberOfPairsCard {
            let card = Card()
            cards += [card, card]
        }
       // cards.shuffle() ///?????
    }
}

extension Int {
    var arch4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))}
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}



extension Array {
    mutating func shuffle() {
        if count < 2 { return }

        for i in indices.dropLast() {
            let diff = distance(from: i, to: endIndex)
            let j = index(i, offsetBy: diff.arch4random)
            swapAt(i, j)
        }
    }
}




























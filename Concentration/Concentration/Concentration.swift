//
//  Concentration.swift
//  Concentration
//
//  Created by Mittie Adan on 21/11/2019.
//  Copyright © 2019 Mittie Adan. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard (at index: Int)
    {
        if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
           if cards[matchIndex].identifier == cards[index].identifier {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = nil
        } else {
            for flipdownIndex in cards.indices {
                cards[flipdownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
        if !cards[index].isMatched {
            
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in
            1...numberOfPairsOfCards {
                let card = Card()
            cards += [card, card]
        }
    }
}

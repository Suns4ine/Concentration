//
//  Cincentration.swift
//  Concentration
//
//  Created by Mittie Adan on 24/01/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    func chooseCard (at index: Int) {
        if !cards[index].isMatched {
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
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
         
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}

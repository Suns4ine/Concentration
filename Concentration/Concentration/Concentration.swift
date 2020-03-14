//
//  Concentration.swift
//  Concentration
//
//  Created by Mittie Adan on 14/03/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    private(set) var flipCounts = 0
    
    func newGame() {
        flipCounts = 0
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
    }
    
    init(numbersOfPairCards: Int) {
        if numbersOfPairCards > 0 {
            for _ in 1...numbersOfPairCards {
                let card = Card()
                cards += [card, card]
            }
        } else {
            print("not enough cards")
        }
    }
}

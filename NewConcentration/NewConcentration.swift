//
//  NewConcentration.swift
//  NewConcentration
//
//  Created by Mittie Adan on 26/01/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import Foundation


struct NewConcentration {

    private(set) var cards = [Card]()
    
    var score = 0
    
    private var indexOfOneAdndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "NewConcentration.choosesCard(at: \(index)): choosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAdndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAdndOnlyFaceUpCard = index
            }
        }
    }
 
    
    init(numberOfPairsCard: Int) {
        assert(numberOfPairsCard > 0, "NewConcentration.init(\(numberOfPairsCard)): you must have at least one pair of cards")
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




























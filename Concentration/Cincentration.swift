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
    
    func chooseCard (at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
         
            let card = Card()
            cards += [card, card]
        }
    }
}

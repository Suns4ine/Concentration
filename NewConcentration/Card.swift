//
//  Card.swift
//  NewConcentration
//
//  Created by Mittie Adan on 26/01/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIndex() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIndex()
    }
}















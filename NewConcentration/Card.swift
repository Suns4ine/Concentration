//
//  Card.swift
//  NewConcentration
//
//  Created by Mittie Adan on 26/01/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIndex() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIndex()
    }
}















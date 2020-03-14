//
//  Card.swift
//  Concentration
//
//  Created by Mittie Adan on 14/03/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import Foundation

struct Card {
  
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIndex() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIndex()
    }
}

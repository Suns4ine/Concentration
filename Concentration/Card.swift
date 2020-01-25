//
//  Card.swift
//  Concentration
//
//  Created by Mittie Adan on 24/01/2020.
//  Copyright © 2020 Mittie Adan. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierfactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierfactory += 1
        return identifierfactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}





























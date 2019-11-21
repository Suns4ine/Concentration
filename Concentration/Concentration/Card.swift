//
//  Card.swift
//  Concentration
//
//  Created by Mittie Adan on 21/11/2019.
//  Copyright © 2019 Mittie Adan. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int

    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    init(identifier: Int) {
        self.identifier = 0
    }

}

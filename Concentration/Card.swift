//
//  Cards.swift
//  Concentration
//
//  Created by Miguel Centeno on 3/12/17.
//  Copyright © 2017 Lybes. All rights reserved.
//

import Foundation
/*
 Differences structs and classes:
 1)
 No inheritance. You should forget what am I "in inheritance" or not
 
 2)
 structs are "value types" classes are "reference type"
 structs assigned to a variable are COPIES of this object (IMPORTANT: in iOS, arrays are structs, dictionaries are structs, Strings are structs...)
 */
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    //Card is UI independent, so it doesn't need "emoji" or something like that
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

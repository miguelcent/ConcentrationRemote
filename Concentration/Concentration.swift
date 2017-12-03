//
//  Concentration.swift
//  Concentration
//
//  Created by Miguel Centeno on 3/12/17.
//  Copyright © 2017 Lybes. All rights reserved.
//

import Foundation

class Concentration
{
    var cards =  [Card]()
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfParisOfCards: Int) {
        for _ in 1...numberOfParisOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO shuffle the cards
    }
}

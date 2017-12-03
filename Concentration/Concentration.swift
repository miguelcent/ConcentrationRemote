//
//  Concentration.swift
//  Concentration
//
//  Created by Miguel Centeno on 3/12/17.
//  Copyright © 2017 Lybes. All rights reserved.
//

import Foundation
import GameplayKit

class Concentration
{
    var cards =  [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO shuffle the cards (solved??)
        var sorted: NSArray
        sorted = NSArray.init(array: cards)
        sorted.shuffled()
        cards = sorted as! [Card]
    }
}

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
    
    var gameFinished = false
    
    var pairsFound: Int
    
    
    //Why optional (?) -> because, which is the value if TWO cards are faceup??? And if ZERO cards are faceup???
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check is cards is match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    pairsFound += 1
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                if pairsFound == cards.count / 2 {
                    cards[matchIndex].isFaceUp = false
                    cards[index].isFaceUp = false
                    gameFinished = true
                }
            } else {
                //either 2 cards are faceup AND no cards are faceup (same action)
                for flipDownIndex in cards.indices {
                     cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
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
        sorted = sorted.shuffled() as NSArray
        cards = sorted as! [Card]
        pairsFound = 0
    }
}

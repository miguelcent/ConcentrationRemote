//
//  ViewController.swift
//  Concentration
//
//  Created by Miguel Centeno on 25/11/17.
//  Copyright © 2017 Lybes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //TODO solve issue with  initializer
    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    
    var flipCount = 0{
        //didSet: everytime flipCount changes, do the action inside "didSet"
        didSet {
            flipCountLabel.text = ("Flips: \(flipCount)")
        }
    }
    
    @IBOutlet weak var winMessage: UITextField!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            //Here I let the model to manage
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("CardNumber selected is not in the cardButtons Array")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card ), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        if game.gameFinished {
            winMessage.isHidden = false
        }
    }
    
    var emojiChoices = ["👻","🧛🏻‍♀️","🦇","🎃","😰","🧙🏻‍♀️","💀"]
    
    //var emoji =  Dictionary<Int, String>()
    var emoji =  [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

//
//  ViewController.swift
//  Concentration
//
//  Created by Miguel Centeno on 25/11/17.
//  Copyright © 2017 Lybes. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    var emojiChoices = ["👻","🎃","👻","🎃"]
    
    var flipCount = 0{
        //didSet: everytime flipCount changes, do the action inside "didSet"
        didSet {
            flipCountLabel.text = ("Flips: \(flipCount)")
        }
    }  
    //Comentario de prueba
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on:  sender)
        } else {
            print("CardNumber selected is not in the cardButtons Array")
        }
    }
    
    func flipCard(withEmoji emoji: String,  on button: UIButton){
        print("FlipCard(withEmoji: \(emoji))")
        
        if button.currentTitle == emoji  {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        print("TouchesCounter = \(flipCount)")
    }
    
}


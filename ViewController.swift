//
//  ViewController.swift
//  concentration
//
//  Created by Baraa Yusri on 06/12/2018.
//  Copyright © 2018 Baraa Yusri. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
   lazy  var Game = concentration(numberOfCardsOfPairs: (CardButtons.count + 1) / 2)

    var flipCount = 0 {
        didSet{
            flipcounter.text = "Flips: \(flipCount)"
        }
    }
    
    var trail = 0
    @IBOutlet weak var flipcounter: UILabel!
    @IBOutlet var CardButtons: [UIButton]!
     func shuffl() {
        var i = 0
        var indicies = [Int]()
        while(i < 6){
            
            let Ind = Int(arc4random_uniform(UInt32(Int(EmojiChoices.count))))
            var temp = String()
            indicies.append(Ind)
            if(Ind != i && !indicies.contains(Ind)){
            temp = EmojiChoices[i]
            EmojiChoices[i] = EmojiChoices[Ind];
            EmojiChoices[Ind] = temp
            i += 1
            }
            
        }
    }
    
 
    @IBAction func touchsecondcard(_ sender: UIButton) {
     
        flipCount+=1
        if let cardnumber=CardButtons.index(of:sender){
           Game.choosecard(at: cardnumber)
            updateViewFromModel()
        //print("cardnumber:\(cardnumber)")
        }else{
            print("the card choosen is not in the set")
        }
        
            
        }
    func swap(a: Int ,b: Int) -> (Int,Int){
        
        return (b,a)
        
    }
    
    func updateViewFromModel(){
        for index in CardButtons.indices{
        let Button = CardButtons[index]
        let card = Game.cards[index]
            if card.isFaceUp{
                Button.setTitle(emoji(for:card),for: UIControlState.normal)
                Button.backgroundColor = .white
            }else{
                Button.setTitle("", for: UIControlState.normal)
                Button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 1, green: 0.585469064, blue: 0.007283347876, alpha: 1)
            }
        }
    }
    var EmojiChoices = ["🍎","👻","🎃","🦅","🐱","😱","🍭","🍬","🍫"]
    var emoji = [Int:String]()
    func emoji(for card : card) -> String  {
        if emoji[card.identifier] == nil,EmojiChoices.count > 0{
                let randindex = Int(arc4random_uniform(UInt32(EmojiChoices.count)))
                emoji[card.identifier] = EmojiChoices.remove(at: randindex)
            }
        
        return emoji[card.identifier] ?? "?"
    
    }
    
    
    
    
    
    
    

}


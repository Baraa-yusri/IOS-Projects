//
//  concentration.swift
//  concentration
//
//  Created by Baraa Yusri on 26/01/2019.
//  Copyright © 2019 Baraa Yusri. All rights reserved.
//

import Foundation
class concentration{
    var cards = [card]()
    var indexOfOnlyOneCardFaceUp : Int?
    
    func choosecard(at index : Int)  {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOnlyOneCardFaceUp,matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyOneCardFaceUp = nil
            
        }else{
            for flipDownIndex in cards.indices{
                cards[flipDownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfOnlyOneCardFaceUp = index
        }
    }
    }
    init(numberOfCardsOfPairs : Int) {
        for _ in 1...numberOfCardsOfPairs {
            let Card = card()
             cards += [Card,Card]
        }
        
        
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

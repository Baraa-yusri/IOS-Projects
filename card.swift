//
//  card.swift
//  concentration
//
//  Created by Baraa Yusri on 26/01/2019.
//  Copyright © 2019 Baraa Yusri. All rights reserved.
//

import Foundation
struct card {
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    static var identifierFactor = 0
    
    static func getUniqueIdentifier()->Int{
        identifierFactor += 1
        return identifierFactor
    }
    
    init(){
        self.identifier=card.getUniqueIdentifier()
    }
    
   
    
    
}

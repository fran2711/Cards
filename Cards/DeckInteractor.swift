//
//  DeckInteractor.swift
//  Cards
//
//  Created by Fran Lucena on 14/2/17.
//  Copyright © 2017 Fran Lucena. All rights reserved.
//

import Foundation

public class DeckInteractor {
    
    public func execute(completion: (Deck) -> Void) {
        
        // lanzo algo en background
        let deck: Deck = Deck(deckId: "")
        completion(deck)
        
        
    }
    
}

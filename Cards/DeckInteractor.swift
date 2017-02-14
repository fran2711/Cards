//
//  DeckInteractor.swift
//  Cards
//
//  Created by Fran Lucena on 14/2/17.
//  Copyright © 2017 Fran Lucena. All rights reserved.
//

import Foundation

public class DeckInteractor {
    
    public func execute(completion: @escaping (Deck) -> Void) {
        
        DeckOfCardsAPIManager().downloadDeck{ (deck: Deck) in
            assert(Thread.current == Thread.main)
            completion(deck)
        }
    }
}

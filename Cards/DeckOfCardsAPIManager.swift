//
//  DeckOfCardsAPIManager.swift
//  Cards
//
//  Created by Fran Lucena on 14/2/17.
//  Copyright © 2017 Fran Lucena. All rights reserved.
//

import Foundation


public class DeckOfCardsAPIManager {
    
    
    public func downloadDeck(completion: (Deck) -> Void) {
        
        let urlString = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
        
        if let url = URL(string: urlString) {
            do {
                let data = Data(contentsOf: url)
                let cardJson = JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                
                
            } catch {
                
            }
        }
        
        // Lo paso a segundo plano
        DispatchQueue.global().async { 
            
            
            
        }
        
        
    }
    
    
}

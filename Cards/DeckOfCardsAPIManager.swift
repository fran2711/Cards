//
//  DeckOfCardsAPIManager.swift
//  Cards
//
//  Created by Fran Lucena on 14/2/17.
//  Copyright © 2017 Fran Lucena. All rights reserved.
//

import Foundation


public class DeckOfCardsAPIManager {
    
    
    public func downloadDeck(completion: @escaping (Deck) -> Void) {
        
        let urlString = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
        
        
        // Lo paso a segundo plano
        DispatchQueue.global().async {
            
            if let url = URL(string: urlString) {
                do {
                    let data = try Data(contentsOf: url)
                    let cardJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                    
                    let deck = Deck(deckId: cardJson["deck_id"] as! String)
                    completion(deck)
                    
                } catch {
                    print("Error in downloadDeck" + error.localizedDescription)
                }
            }
            
            
            
            
        }
        
        
    }
    
    
}

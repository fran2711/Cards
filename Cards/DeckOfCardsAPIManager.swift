//
//  DeckOfCardsAPIManager.swift
//  Cards
//
//  Created by Fran Lucena on 14/2/17.
//  Copyright © 2017 Fran Lucena. All rights reserved.
//

import Foundation
import UIKit

public class DeckOfCardsAPIManager {
    
    
    public func downloadDeck(completion: @escaping (Deck) -> Void) {
        let urlString = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
        
        // Lo paso a segundo plano
        DispatchQueue.global().async {
            
            if let url = URL(string: urlString) {
                do {
                    let data = try Data(contentsOf: url)
                    let deckJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                    
                    let deck = Deck(deckId: deckJson["deck_id"] as! String)
                    DispatchQueue.main.async {
                        completion(deck)
                    }
                } catch {
                    print("Error in downloadDeck" + error.localizedDescription)
                }
            }
        }
    }
    
    
    public func downloadCard(deck: Deck, completion: @escaping (Card) -> Void) {
        let urlString = "https://deckofcardsapi.com/api/deck/\(deck.deckID)/draw/?count=1"
        
        // Lo paso a segundo plano
        DispatchQueue.global().async {
            
            if let url = URL(string: urlString) {
                do {
                    let data = try Data(contentsOf: url)
                    let cardJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                    
                    let cards = cardJson["cards"] as! [Dictionary<String,Any>]
                    
                    let firstCard = cards[0]
                    
                    let card = Card(code: firstCard["code"] as! String, suit: firstCard["suit"] as! String, image: firstCard["image"] as! String)
                    
                    DispatchQueue.main.async {
                        completion(cards)
                    }
                } catch {
                    print("Error in downloadDeck" + error.localizedDescription)
                }
            }
            
        }
        
        
    }
    
    public func downloadCardImage(card: Card, completion: @escaping (UIImage) -> Void) {
        
        // Lo paso a segundo plano
        DispatchQueue.global().async {
            
            if let url = URL(string: card.image) {
                do {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        completion(image!)
                    }
                } catch {
                    print("Error in downloadDeck" + error.localizedDescription)
                }
            }
        }
    }

    
    

    
    
}

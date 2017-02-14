//
//  ViewController.swift
//  Cards
//
//  Created by Fran Lucena on 14/2/17.
//  Copyright © 2017 Fran Lucena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck: Deck!
    

    @IBOutlet weak var cardImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        paintCardPlaceholder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func deckButtonClicked(_ sender: Any) {
        DeckInteractor().execute{ (deck: Deck) in
            print("DeckId is: " + deck.deckId)
            self.deck = deck
        }
        
    }
    
    @IBAction func cardButtonClicked(_ sender: Any) {
        
        self.paintCardPlaceholder()
        
        GetCardFromDeckInteractor(deck: self.deck) .execute { (card) in
            print("Card is: " + card.image)
            
            GetCardImageInteractor(card: card).execute(completion: { (image: UIImage) in
                self.cardImageView.image = image
            })
            
            
        }
        
    }
    
    func paintCardPlaceholder() {
        assert(Thread.current == Thread.main)
        
        self.cardImageView.image = UIImage(named: "card")
    }
    

}


//
//  ViewController.swift
//  Cards
//
//  Created by Fran Lucena on 14/2/17.
//  Copyright © 2017 Fran Lucena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        paidCardPlaceholder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func deckButtonClicked(_ sender: Any) {
        let di = DeckInteractor()
        di.execute{ (deck: Deck) -> Void in
        
        }
        
    }
    
    @IBAction func cardButtonClicked(_ sender: Any) {
    }
    
    func paidCardPlaceholder() {
        assert(Thread.current == Thread.main)
        
        self.cardImageView.image = UIImage(named: "card")
    }
    

}


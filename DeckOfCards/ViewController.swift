//
//  ViewController.swift
//  DeckOfCards
//
//  Created by Jordan Nelson on 10/28/15.
//  Copyright © 2015 Jordan Nelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        CardController.sharedInstance.searchForCards { (success) -> Void in
            if success == true {
                
                if let card = CardController.sharedInstance.allCards.last {
                  // FORGET OFTEN
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.label.text = "\(card.value) of \(card.suit)"
                        
                    // IN PRACTICE should implement in a helper method
                    self.imageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string:card.imageURLString)!)!)
                   })
                }
            } else {
                print("Failure")
            }
        }
        
    }
}


//
//  CardController.swift
//  DeckOfCards
//
//  Created by Jordan Nelson on 10/28/15.
//  Copyright © 2015 Jordan Nelson. All rights reserved.
//

import Foundation

class CardController {
    
    static let sharedInstance = CardController()
    
    var allCards: [Card] = []
    
    func searchForCards(completion:(success:Bool) -> Void) {
        
        let url = NetworkController.searchURL()
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let data = resultData else {
                print("No Data Returned")
                completion(success: false)
                return
            }
            
            do {
               let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                if let resultsDictionary = resultsAnyObject as? [String:AnyObject] {
                    let cardArray = resultsDictionary["cards"] as? [[String:AnyObject]]
                    
                    for cardDictionary in cardArray! {
                       let card = Card(jsonDictionary: cardDictionary)
                        self.allCards.append(card)
                    }
                    completion(success: true)
                } else {
                    completion(success: false)
                }
            } catch {
                completion(success: false)
            }
        }
    }
}










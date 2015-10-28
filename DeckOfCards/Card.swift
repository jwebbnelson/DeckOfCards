//
//  Card.swift
//  DeckOfCards
//
//  Created by Jordan Nelson on 10/28/15.
//  Copyright © 2015 Jordan Nelson. All rights reserved.
//

import Foundation

class Card {

    static let valueKey = "value"
    static let suitKey = "suit"
    static let imageKey = "image"
    
    var value: String = ""
    var suit: String = ""
    var imageURLString: String = ""
    
    init(jsonDictionary: [String: AnyObject]) {
        
        if let value = jsonDictionary[Card.valueKey] as? String {
            self.value = value
        }
        
        if let suit = jsonDictionary[Card.suitKey] as? String {
            self.suit = suit
        }
        
        if let imageURLString = jsonDictionary[Card.imageKey] as? String {
            self.imageURLString = imageURLString
        }
    }
}

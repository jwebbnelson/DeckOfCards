//
//  NetworkController.swift
//  DeckOfCards
//
//  Created by Jordan Nelson on 10/28/15.
//  Copyright © 2015 Jordan Nelson. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func searchURL() -> NSURL {
      
      return NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/?count=1")!
    }
    
    static func dataAtURL (url: NSURL, completion:(resultData: NSData?) -> Void){
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            if let error = error {
                print(error.localizedDescription)
            }
            completion(resultData: data)
        }
        // DONT FORGET
        dataTask.resume()
    }
   
}












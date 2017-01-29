//
//  DailyQuote.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 29/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class DailyQuote {
    
    var quotes: [String]?
    var quotesAuthors: [String]?
    var _currentQuote: String!
    var _currentQuoteAuthor: String!
    
    var currentQuote: String {
        if _currentQuote == nil {
            _currentQuote = ""
        }
        return _currentQuote
    }
    
    var currentQuoteAuthor: String {
        if _currentQuoteAuthor == nil {
            _currentQuoteAuthor = ""
        }
        return _currentQuoteAuthor
    }
    
    func dailyQuote() {
        do {
            // Retrieve quote from Quotes.txt file
            if let path = Bundle.main.path(forResource: "Quotes", ofType: "txt") {
                let pathAuthor = Bundle.main.path(forResource: "QuotesAuthors", ofType: "txt")
                let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                let dataAuthor = try String(contentsOfFile:pathAuthor!, encoding: String.Encoding.utf8)
                
                quotes = data.components(separatedBy: "\n")
                quotesAuthors = dataAuthor.components(separatedBy: "\n")


                // return the integer value of the date
                
                if quotes != nil {
                    let daysSince1970 = NSDate().timeIntervalSince1970 / 60 / 60 / 24
                    let index = Int(daysSince1970) % quotes!.count
                    _currentQuote = quotes?[index]
                    _currentQuoteAuthor = quotesAuthors?[index]
                }
            }
        } catch let err as NSError {
            // do something with Error
            print(err)
        }
    }
    
}


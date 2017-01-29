//
//  MainVC.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 24/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var quoteLbl: UILabel!
    @IBOutlet weak var quoteAuthorLbl: UILabel!
    
    var dailyQuote: DailyQuote!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dailyQuote = DailyQuote()
        dailyQuote.dailyQuote()
        updateUI()
        
    }
    
    func updateUI() {
        quoteLbl.text = dailyQuote.currentQuote
        quoteAuthorLbl.text = dailyQuote.currentQuoteAuthor
        
    }
    
    //    func dailyQuote() {
    //        do {
    //            // Retrieve quote from Quotes.txt file
    //            if let path = Bundle.main.path(forResource: "Quotes", ofType: "txt") {
    //                let pathAuthor = Bundle.main.path(forResource: "QuotesAuthors", ofType: "txt")
    //                let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
    //                let dataAuthor = try String(contentsOfFile:pathAuthor!, encoding: String.Encoding.utf8)
    //
    //                quotes = data.components(separatedBy: "\n")
    //                quotesAuthors = dataAuthor.components(separatedBy: "\n")
    ////
    ////            }
    ////                // Retrieve quote from Quotes.txt file
    ////                if let path = Bundle.main.path(forResource: "QuotesAuthors", ofType: "txt"){
    ////                    let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
    ////                    quotesAuthors = data.components(separatedBy: "\n")
    ////            }
    ////
    //                // return the integer value of the date
    //
    //                if quotes != nil {
    //                    let daysSince1970 = NSDate().timeIntervalSince1970 / 60 / 60 / 24
    //                    let index = Int(daysSince1970) % quotes!.count
    //                    quoteLbl.text = quotes?[index]
    //                    quoteAuthorLbl.text = quotesAuthors?[index]
    //                }
    //            }
    //        } catch let err as NSError {
    //            // do something with Error
    //            print(err)
    //        }
    //    }
    
}




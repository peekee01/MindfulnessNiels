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
        preLoadWebView()

        dailyQuote = DailyQuote()
        dailyQuote.dailyQuote()
        updateUI()
        
    }
    
    func updateUI() {
        quoteLbl.text = dailyQuote.currentQuote
        quoteAuthorLbl.text = dailyQuote.currentQuoteAuthor
        
    }
    
    func preLoadWebView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let webViewController = storyboard.instantiateViewController(withIdentifier: "WeekIntro") as? WeekIntro {
            webViewController.view.setNeedsLayout()
        }
        
        if let webViewController2 = storyboard.instantiateViewController(withIdentifier: "WeekAdditional") as? WeekAdditional {
            webViewController2.view.setNeedsLayout()
        }
    }

}




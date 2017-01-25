//
//  WeekVC.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 25/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class WeekVC: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.isOpaque = false
        self.webView.backgroundColor = UIColor.clear
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Week1", ofType: "html")!)
        webView.loadRequest(URLRequest(url: url))
 //       webView.loadHTMLString("<  asdad </body></html>", baseURL: nil)
    
    }


    
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    

}

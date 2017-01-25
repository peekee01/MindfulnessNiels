//
//  WeekVC.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 25/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class WeekVC: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var webView: UIWebView!
    var weekNum = "week 1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = weekNum
            
        webView.delegate = self
        self.webView.isOpaque = false
        self.webView.backgroundColor = UIColor.clear
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: weekNum, ofType: "html")!)
        webView.loadRequest(URLRequest(url: url))
        
        
    
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.linkClicked {
      //  OUD    UIApplication.shared.openURL(request.url!)
            UIApplication.shared.open(request.url!, options: [:], completionHandler: nil)
            return false
        }
        return true
    }

    
    
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    

}

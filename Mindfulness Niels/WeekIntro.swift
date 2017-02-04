//
//  WeekIntro.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 25/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class WeekIntro: UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var imageIntro: UIImageView!
    var imageName = "bg_\(SharedVars.sharedInstance.weekNum)"
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageIntro.image = UIImage(named: imageName)
        
        webView.delegate = self
        self.webView.isOpaque = false
        self.webView.backgroundColor = UIColor.clear
        let URLweek = SharedVars.sharedInstance.weekNum
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: URLweek, ofType: "html")!)
        webView.loadRequest(URLRequest(url: url))
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.linkClicked {
            UIApplication.shared.open(request.url!, options: [:], completionHandler: nil)
            return false
        }
        return true
    }
    
    
    
}

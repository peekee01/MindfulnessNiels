//
//  WeekVideos.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 28/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class WeekAdditional1: UIViewController {

    @IBOutlet weak var videoView: UIWebView!
    
    @IBOutlet weak var videoView2: UIWebView!
    
    let videoOne = "https://www.youtube.com/embed/GLjelIPg3ys"
    let videoTwo = "https://www.youtube.com/embed/9YRjX3A_8cM"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoView.scrollView.isScrollEnabled = false
        videoView.scrollView.bounces = false
        videoView2.scrollView.isScrollEnabled = false
        videoView2.scrollView.bounces = false

        
        videoView.allowsInlineMediaPlayback = true
       videoView.loadHTMLString("<iframe width=\"\(videoView.frame.width)\" height=\"\(videoView.frame.height)\" src=\"\(videoOne)?&modestbranding=1&playsinline=1&showinfo=0&show_suggested_video=0&show_logo=0\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        videoView2.allowsInlineMediaPlayback = true
        videoView2.loadHTMLString("<iframe width=\"\(videoView.frame.width)\" height=\"\(videoView.frame.height)\" src=\"\(videoTwo)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
    
        
        // Do any additional setup after loading the view.
    }


    
}

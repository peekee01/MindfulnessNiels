//
//  WeekVideos.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 28/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class WeekAdditional: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let videoCellIdentifier = "VideoCell"
    let code = "?&modestbranding=1&playsinline=1&controls=1&showinfo=0&rel=0\" frameborder=\"0\" allowfullscreen></iframe>"
    
 //   var textVideo = ["Dit is filmpje 1", "Dit is filmpje 2", "en nog filmpje 3"]
  //  var videoArray = ["https://www.youtube.com/embed/GLjelIPg3ys", "https://www.youtube.com/embed/9YRjX3A_8cM", "https://www.youtube.com/embed/BSmToj9VZ4s"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AdditionalContent.sharedInstance.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AdditionalContent.sharedInstance.objectsArray[section].sectionDescriptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: videoCellIdentifier , for: indexPath) as! VideoCell
        let videoURL = AdditionalContent.sharedInstance.objectsArray[indexPath.section].sectionURLS[indexPath.row]
        cell.videoLbl.text = AdditionalContent.sharedInstance.objectsArray[indexPath.section].sectionDescriptions[indexPath.row]
        cell.webView.scrollView.isScrollEnabled = false
        cell.webView.scrollView.bounces = false
        cell.webView.allowsInlineMediaPlayback = true
        cell.webView.loadHTMLString("<iframe width=\"\(cell.webView.frame.width)\" height=\"\(cell.webView.frame.height)\" src=\"\(videoURL)\(code)", baseURL: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AdditionalContent.sharedInstance.objectsArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        header.backgroundView?.backgroundColor = UIColor(red: 0/255, green: 128/255, blue: 128/255, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}


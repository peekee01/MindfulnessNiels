//
//  VideoCell.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 02/02/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

  
    @IBOutlet weak var videoLbl: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
}

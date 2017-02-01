//
//  TextCell.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 01/02/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

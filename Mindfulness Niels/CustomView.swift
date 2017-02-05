
//
//  CustomImage.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 25/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

private var custom = false

extension UIView {
    
    @IBInspectable var customView: Bool {
        get {
            return custom
        }
        set {
            
            custom = newValue
            
            if custom {
                self.layer.masksToBounds = false
                self.layer.cornerRadius = self.layer.frame.size.width / 2
                self.layer.borderWidth = 0.6
                self.layer.borderColor = UIColor.darkGray.cgColor
                self.layer.shadowOpacity = 1.0
                self.layer.shadowRadius = 8.0
                self.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
                self.layer.shadowColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1.0).cgColor
            } else {
                self.layer.masksToBounds = false
                self.layer.shadowOpacity = 0.0
                self.layer.shadowRadius = 0.0
                self.layer.shadowColor = nil
            }
        }
    }
}


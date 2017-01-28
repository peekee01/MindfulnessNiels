
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
    
    @IBInspectable var customQuote: Bool {
        get {
            return custom
        }
        set {
            
            custom = newValue
            
            if custom {
                
                self.layer.masksToBounds = true
                self.layer.cornerRadius = 6.0
                self.layer.shadowOpacity = 1.0
                self.layer.shadowRadius = 6.0
                self.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
                self.layer.shadowColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 0.9).cgColor
            } else {
                
                self.layer.shadowOpacity = 0.0
                self.layer.shadowRadius = 0.0
                self.layer.shadowColor = nil
            }
        }
    }
}

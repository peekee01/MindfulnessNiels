//
//  CustomImage.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 02/02/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

private var custom = false

extension UIView {
    
    @IBInspectable var customImage: Bool {
        get {
            return custom
        }
        set {
            
            custom = newValue
            
            if custom {
                self.layer.masksToBounds = false
                self.layer.shadowOpacity = 1.0
                self.layer.shadowRadius = 4.0
                self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
                self.layer.shadowColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1.0).cgColor
            } else {
                self.layer.shadowOpacity = 0.0
                self.layer.shadowRadius = 0.0
                self.layer.shadowColor = nil
            }
        }
    }
}


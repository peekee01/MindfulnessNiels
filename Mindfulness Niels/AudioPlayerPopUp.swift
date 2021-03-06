//
//  AudioPlayerPopUp.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 05/02/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

import UIKit

private var custom = false

extension UIView {
    
    @IBInspectable var customAudioPlayerPopUp: Bool {
        get {
            return custom
        }
        set {
            
            custom = newValue
            
            if custom {
                
                self.layer.masksToBounds = true
                self.layer.cornerRadius = 10.0
            } else {
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 0.0
            }
        }
    }
}



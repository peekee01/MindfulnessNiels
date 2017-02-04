//
//  SegmentedControl.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 29/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class CustomSegmentedControl: UISegmentedControl {
    
    func initUI(){
        setupBackground()
        setupFonts()
    }	
    
    func setupBackground(){
        let backgroundImage = UIImage(named: "segmented_unselected_bg")
        let dividerImage = UIImage(named: "segmented_separator_bg")
        let backgroundImageSelected = UIImage(named: "segmented_selected_bg")
        
        self.setBackgroundImage(backgroundImage, for: UIControlState(), barMetrics: .default)
        self.setBackgroundImage(backgroundImageSelected, for: .highlighted, barMetrics: .default)
        self.setBackgroundImage(backgroundImageSelected, for: .selected, barMetrics: .default)
        
        self.setDividerImage(dividerImage, forLeftSegmentState: UIControlState(), rightSegmentState: .selected, barMetrics: .default)
        self.setDividerImage(dividerImage, forLeftSegmentState: .selected, rightSegmentState: UIControlState(), barMetrics: .default)
        self.setDividerImage(dividerImage, forLeftSegmentState: UIControlState(), rightSegmentState: UIControlState(), barMetrics: .default)
    }
    
    func setupFonts(){
//        let font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
//        
//        self.setTitleTextAttributes(normalTextAttributes, for: UIControlState())
//        self.setTitleTextAttributes(normalTextAttributes, for: .highlighted)
//        self.setTitleTextAttributes(normalTextAttributes, for: .selected)
//        
//        self.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: UIControlState())
//        self.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .highlighted)
//        self.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .selected)
//        
//        let normalTextAttributes: [NSObject : AnyObject] = [
//            NSForegroundColorAttributeName: UIColor.white,
//            NSFontAttributeName: UIFont.systemFontOfSize(fontSize, weight: UIFontWeightRegular)
//        ]
        
        let boldTextAttributes: [NSObject : AnyObject] = [
            NSForegroundColorAttributeName as NSObject : UIColor.white,
            NSFontAttributeName as NSObject : UIFont(name:"HelveticaNeue-Bold", size: 14.0)!,
            ]
        
        self.setTitleTextAttributes(boldTextAttributes, for: .normal)
        self.setTitleTextAttributes(boldTextAttributes, for: .highlighted)
        self.setTitleTextAttributes(boldTextAttributes, for: .selected)
    }
    
}


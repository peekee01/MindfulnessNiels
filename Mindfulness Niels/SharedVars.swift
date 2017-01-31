//
//  SharedVars.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 28/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import Foundation

class SharedVars {
    var weekNum: String = "Week 1"
    var chosenWeek: Int = 1
    var currentElapsed: TimeInterval = 0
    var audioTitle: String = ""
    var currentSong: String = ""
    static let sharedInstance = SharedVars()    
}

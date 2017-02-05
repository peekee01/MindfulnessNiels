//
//  SharedAudioPlayer.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 31/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SharedAudioPlayer {
    
    var sharedPlayer: AVAudioPlayer = AVAudioPlayer()
    static let sharedInstance = SharedAudioPlayer()
    init() { }
    
    func loadAudioPlayer() {
        let AudioURL = URL(fileURLWithPath: Bundle.main.path(forResource: SharedVars.sharedInstance.audioTitle, ofType: "mp3")!)
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            UIApplication.shared.beginReceivingRemoteControlEvents()
            
            SharedAudioPlayer.sharedInstance.sharedPlayer = try AVAudioPlayer(contentsOf: AudioURL)
       //     SharedAudioPlayer.sharedInstance.sharedPlayer.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
}



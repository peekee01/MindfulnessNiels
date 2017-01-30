//
//  AudioPlayerVC.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 30/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayerVC: UIViewController {
    
    @IBOutlet weak var pausePlay: UIButton!
    
    var AudioURL = URL(fileURLWithPath: Bundle.main.path(forResource: "10. Mindfulness of the Breath", ofType: "mp3")!)
    var AudioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAudioPlayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAudioPlayer() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            AudioPlayer = try AVAudioPlayer(contentsOf: AudioURL)
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
  

    @IBAction func pausePlayBtn(_ sender: UIButton) {
        if AudioPlayer!.isPlaying == true {
            AudioPlayer!.stop()
            pausePlay.setImage(UIImage(named: "Audio_play.png"), for: UIControlState.normal)
        } else {
            AudioPlayer!.play()
            pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
        }
    }
    

    
}

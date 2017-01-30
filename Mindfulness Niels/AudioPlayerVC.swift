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
    @IBOutlet weak var audioSlider: UISlider!
    @IBOutlet weak var timeElapsed: UILabel!
    @IBOutlet weak var timeRemaining: UILabel!
    
    var AudioURL = URL(fileURLWithPath: Bundle.main.path(forResource: "22 De soldaat", ofType: "mp3")!)
    var AudioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAudioPlayer()
        audioSlider.maximumValue = Float(AudioPlayer!.duration)
        print(TimeInterval(AudioPlayer!.duration))
        
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.updateAudioSlider), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AudioPlayerVC.updateTimeLabels), userInfo: nil, repeats: true)
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
    
    @IBAction func changeAudioTime(_ sender: UISlider) {
        AudioPlayer!.stop()
        AudioPlayer!.currentTime = TimeInterval(audioSlider.value)
        AudioPlayer!.play()
        pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
    }
    
    func updateAudioSlider() {
        audioSlider.value = Float(AudioPlayer!.currentTime)
    }
    
    func updateTimeLabels() {
        let elapsedSeconds = Int(AudioPlayer!.currentTime) % 60
        let elapsedMinutes = (Int(AudioPlayer!.currentTime) / 60) % 60
        let remainingSeconds = Int(AudioPlayer!.duration - AudioPlayer!.currentTime) % 60
        let remainingMinutes = (Int(AudioPlayer!.duration - AudioPlayer!.currentTime) / 60) % 60
        
        timeElapsed.text = String(format: "%0.2d:%0.2d",elapsedMinutes,elapsedSeconds)
        timeRemaining.text = String(format: "%0.2d:%0.2d",remainingMinutes,remainingSeconds)
    }
    
    //    func updateRemainingTime() {
    //        var seconds = 0
    //        var minutes = 0
    //        let time = AudioPlayer!.duration - AudioPlayer!.currentTime
    //        seconds = Int(time) % 60
    //        minutes = (Int(time) / 60) % 60
    //
    //
    //        timeRemaining.text = String(format: "%0.2d:%0.2d",minutes,seconds)
    //    }
    
    
    
}

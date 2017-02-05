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
    @IBOutlet weak var audioTitle: UILabel!
    
    //   var AudioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.opacity = 0.8
        self.showAnimate()
        
        //        if !UIAccessibilityIsReduceTransparencyEnabled() {
        //            self.view.backgroundColor = UIColor.clear
        //
        //            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        //            let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //            //always fill the view
        //            blurEffectView.frame = self.view.bounds
        //            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //
        //            self.view.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
        //        } else {
        //            self.view.backgroundColor = UIColor.black
        //        }
        
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.updateAudioSlider), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.updateLabels), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.checkPlaying), userInfo: nil, repeats: true)
        updateLabels()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if SharedAudioPlayer.sharedInstance.sharedPlayer.isPlaying == true {
            pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
        } else {
            pausePlay.setImage(UIImage(named: "Audio_play.png"), for: UIControlState.normal)
            if audioTitle.text == SharedVars.sharedInstance.currentSong && SharedVars.sharedInstance.currentElapsed != 0 {
                SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime = SharedVars.sharedInstance.currentElapsed
            } else {
                SharedAudioPlayer.sharedInstance.loadAudioPlayer()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
        SharedVars.sharedInstance.currentElapsed = SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime
        SharedVars.sharedInstance.currentSong = self.audioTitle.text!
    }
    
    @IBAction func pausePlayBtn(_ sender: UIButton) {
        if SharedAudioPlayer.sharedInstance.sharedPlayer.isPlaying == true {
            SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
            pausePlay.setImage(UIImage(named: "Audio_play.png"), for: UIControlState.normal)
        } else {
            SharedAudioPlayer.sharedInstance.sharedPlayer.play()
            pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
        }
    }
    
    func checkPlaying() {
        if SharedAudioPlayer.sharedInstance.sharedPlayer.isPlaying == true {
            pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
        } else {
            pausePlay.setImage(UIImage(named: "Audio_play.png"), for: UIControlState.normal)
        }
    }
    
    @IBAction func changeAudioTime(_ sender: UISlider) {
        SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
        SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime = TimeInterval(audioSlider.value)
        SharedAudioPlayer.sharedInstance.sharedPlayer.play()
        pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
    }
    
    func updateAudioSlider() {
        audioSlider.maximumValue = Float(SharedAudioPlayer.sharedInstance.sharedPlayer.duration)
        audioSlider.value = Float(SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime)
    }
    
    func updateLabels() {
        let elapsedSeconds = Int(SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime) % 60
        let elapsedMinutes = (Int(SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime) / 60) % 60
        let remainingSeconds = Int(SharedAudioPlayer.sharedInstance.sharedPlayer.duration - SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime) % 60
        let remainingMinutes = (Int(SharedAudioPlayer.sharedInstance.sharedPlayer.duration - SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime) / 60) % 60
        
        timeElapsed.text = String(format: "%0.2d:%0.2d",elapsedMinutes,elapsedSeconds)
        timeRemaining.text = String(format: "%0.2d:%0.2d",remainingMinutes,remainingSeconds)
        audioTitle.text = SharedVars.sharedInstance.audioTitle
    }
    
    
    @IBAction func closeAudioPop(_ sender: Any) {
        self.removeAnimate()
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
                for view in self.view.subviews {
                    print(view)
        }
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showRemoveBlur"), object: nil)
                self.view.removeFromSuperview()
                SharedVars.sharedInstance.currentElapsed = SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime
                SharedVars.sharedInstance.currentSong = self.audioTitle.text!
                SharedAudioPlayer.sharedInstance.sharedPlayer.stop()

            }
        })
    }
    
}

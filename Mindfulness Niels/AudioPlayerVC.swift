//
//  AudioPlayerVC.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 30/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class AudioPlayerVC: UIViewController {
    
    @IBOutlet weak var pausePlay: UIButton!
    @IBOutlet weak var audioSlider: UISlider!
    @IBOutlet weak var timeElapsed: UILabel!
    @IBOutlet weak var timeRemaining: UILabel!
    @IBOutlet weak var audioTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        self.view.layer.opacity = 0.8
        self.showAnimate()
        
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.updateAudioSlider), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.updateLabels), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.checkPlaying), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AudioPlayerVC.updateNowPlayingInfoCenter), userInfo: nil, repeats: true)
        updateLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if SharedAudioPlayer.sharedInstance.sharedPlayer.isPlaying == true {
            pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
        } else {
            pausePlay.setImage(UIImage(named: "Audio_play.png"), for: UIControlState.normal)
            SharedAudioPlayer.sharedInstance.loadAudioPlayer()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
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
    
    override func remoteControlReceived(with event: UIEvent?) {
        if event?.type == UIEventType.remoteControl {
            if event?.subtype == UIEventSubtype.remoteControlTogglePlayPause {
                if SharedAudioPlayer.sharedInstance.sharedPlayer.isPlaying == true {
                    pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
                    SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
                } else {
                    pausePlay.setImage(UIImage(named: "Audio_play.png"), for: UIControlState.normal)
                    SharedAudioPlayer.sharedInstance.sharedPlayer.play()
                }
            }
        } else if event?.subtype == UIEventSubtype.remoteControlNextTrack {
            SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime = SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime + 15
        } else if event?.subtype == UIEventSubtype.remoteControlPause {
            SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
        } else if event?.subtype == UIEventSubtype.remoteControlPlay {
            SharedAudioPlayer.sharedInstance.sharedPlayer.play()
        } else if event?.subtype == UIEventSubtype.remoteControlPreviousTrack {
            SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime = SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime - 15
        }
    }
    
    
    func updateNowPlayingInfoCenter() {
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: SharedVars.sharedInstance.audioTitle,
            MPMediaItemPropertyArtist: "School of Mindfulness",
            MPMediaItemPropertyPlaybackDuration: SharedAudioPlayer.sharedInstance.sharedPlayer.duration,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime
        ]
    }
    
    @IBAction func closeAudioPop(_ sender: Any) {
        self.removeAnimate()
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.3, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showRemoveBlur"), object: nil)
                self.view.removeFromSuperview()
                SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
                
            }
        })
    }
    
}

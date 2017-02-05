//
//  AudioPlayerFull.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 05/02/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class AudioPlayerFull: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pausePlay: UIButton!
    @IBOutlet weak var audioSlider: UISlider!
    @IBOutlet weak var timeElapsed: UILabel!
    @IBOutlet weak var timeRemaining: UILabel!
    @IBOutlet weak var audioTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let audioCellIdentifier = "AudioCell"
    
    struct Objects {
        var sectionName: String!
        var sectionObjects: [String]!
    }
    
    var objectsArray = [Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SharedAudioPlayer.sharedInstance.loadAudioPlayer()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.updateAudioSlider), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.updateLabels), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioPlayerVC.checkPlaying), userInfo: nil, repeats: true)
        updateLabels()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let audioCell = tableView.dequeueReusableCell(withIdentifier: audioCellIdentifier, for: indexPath) as! AudioCell
        audioCell.titleLbl.text = objectsArray[indexPath.section].sectionObjects[indexPath.row]
        audioCell.selectionStyle = UITableViewCellSelectionStyle.none
        return audioCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectsArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        header.backgroundView?.backgroundColor = UIColor(red: 0/255, green: 128/255, blue: 128/255, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SharedVars.sharedInstance.audioTitle = objectsArray[indexPath.section].sectionObjects[indexPath.row]
        audioTitle.text = SharedVars.sharedInstance.audioTitle
        SharedAudioPlayer.sharedInstance.loadAudioPlayer()
        SharedAudioPlayer.sharedInstance.sharedPlayer.play()
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        if SharedAudioPlayer.sharedInstance.sharedPlayer.isPlaying == true {
    //            pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
    //        } else {
    //            pausePlay.setImage(UIImage(named: "Audio_play.png"), for: UIControlState.normal)
    //            if audioTitle.text == SharedVars.sharedInstance.currentSong && SharedVars.sharedInstance.currentElapsed != 0 {
    //                SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime = SharedVars.sharedInstance.currentElapsed
    //            } else {
    //                SharedAudioPlayer.sharedInstance.loadAudioPlayer()
    //            }
    //        }
    //    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
        SharedVars.sharedInstance.audioTitle = ""
    }
    
    @IBAction func pausePlayBtn(_ sender: UIButton) {
        if audioTitle.text == "" {
            print("choose a song first")
            // create the alert
            let alert = UIAlertController(title: "No song selected", message: "Please choose a song first", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        } else {
            if SharedAudioPlayer.sharedInstance.sharedPlayer.isPlaying == true {
                SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
                pausePlay.setImage(UIImage(named: "Audio_play.png"), for: UIControlState.normal)
            } else {
                SharedAudioPlayer.sharedInstance.sharedPlayer.play()
                pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
            }
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
        if audioTitle.text == "" {
        } else {
            SharedAudioPlayer.sharedInstance.sharedPlayer.stop()
            SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime = TimeInterval(audioSlider.value)
            SharedAudioPlayer.sharedInstance.sharedPlayer.play()
            pausePlay.setImage(UIImage(named: "Audio_pause.png"), for: UIControlState.normal)
        }
    }
    
    func updateAudioSlider() {
        if audioTitle.text == "" {
            audioSlider.value = 0
        } else {
            audioSlider.maximumValue = Float(SharedAudioPlayer.sharedInstance.sharedPlayer.duration)
            audioSlider.value = Float(SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime)
        }
    }
    
    func updateLabels() {
        if audioTitle.text == "" {
            timeElapsed.text = ""
            timeRemaining.text = ""
        } else {
            let elapsedSeconds = Int(SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime) % 60
            let elapsedMinutes = (Int(SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime) / 60) % 60
            let remainingSeconds = Int(SharedAudioPlayer.sharedInstance.sharedPlayer.duration - SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime) % 60
            let remainingMinutes = (Int(SharedAudioPlayer.sharedInstance.sharedPlayer.duration - SharedAudioPlayer.sharedInstance.sharedPlayer.currentTime) / 60) % 60
            
            timeElapsed.text = String(format: "%0.2d:%0.2d",elapsedMinutes,elapsedSeconds)
            timeRemaining.text = String(format: "%0.2d:%0.2d",remainingMinutes,remainingSeconds)
            audioTitle.text = SharedVars.sharedInstance.audioTitle
        }
    }
    
}

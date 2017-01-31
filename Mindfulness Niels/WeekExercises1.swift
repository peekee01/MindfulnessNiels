//
//  WeekExercises.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 28/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class WeekExercises1: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playAudio1(_ sender: UIButton) {
     let popOverAudioVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "audioPlayerPopUp") as! AudioPlayerVC
        self.addChildViewController(popOverAudioVC)
        SharedVars.sharedInstance.audioTitle = sender.titleLabel!.text!
        popOverAudioVC.view.frame = CGRect(x: 0, y: self.view.frame.height - 251, width: self.view.frame.width, height: 250)

      //  AudioPlayerVC().stopPlaying()
        
      //  popOverAudioVC.view.removeFromSuperview()
        
        self.view.addSubview(popOverAudioVC.view)
        popOverAudioVC.didMove(toParentViewController: self)
        
//        self.present(popOverAudioVC, animated: true, completion: nil)
        
    }
}

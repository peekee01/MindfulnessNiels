//
//  WeekExercises.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 28/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class WeekExercises: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    let audioCellIdentifier = "AudioCell"
    var isBlurred: Bool = false
    var blurView: UIVisualEffectView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SharedAudioPlayer.sharedInstance.loadAudioPlayer()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 70
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        NotificationCenter.default.addObserver(self, selector: #selector(WeekExercises.showRemoveBlur), name:NSNotification.Name(rawValue: "showRemoveBlur"), object: nil)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ExerciseContent.sharedInstance.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExerciseContent.sharedInstance.objectsArray[section].sectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 3 {
            let audioCell = tableView.dequeueReusableCell(withIdentifier: audioCellIdentifier, for: indexPath) as! AudioCell
            audioCell.titleLbl.text = ExerciseContent.sharedInstance.objectsArray[indexPath.section].sectionObjects[indexPath.row]
            audioCell.selectionStyle = UITableViewCellSelectionStyle.none
            return audioCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! TextCell
            cell.cellLabel.text = ExerciseContent.sharedInstance.objectsArray[indexPath.section].sectionObjects[indexPath.row]
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ExerciseContent.sharedInstance.objectsArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        if section == 3 {
            header.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            header.textLabel?.textColor = UIColor.white
            //(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0) /* #808080 */
            header.backgroundView?.backgroundColor = UIColor(red: 242/255, green: 137/255, blue: 49/255, alpha: 1.0) /* #f28931 */
        } else {
            header.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            header.textLabel?.textColor = UIColor.white
            header.backgroundView?.backgroundColor = UIColor(red: 0/255, green: 128/255, blue: 128/255, alpha: 1.0) //greenish
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            SharedVars.sharedInstance.audioTitle = ExerciseContent.sharedInstance.objectsArray[indexPath.section].sectionObjects[indexPath.row]
            showRemoveBlur()
            openAudioPlayer()
        }
    }
    
    func openAudioPlayer() {
        let popOverAudioVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "audioPlayerPopUp") as! AudioPlayerVC
        if  self.view.viewWithTag(100) != nil {
            SharedAudioPlayer.sharedInstance.loadAudioPlayer()
        } else {
            self.addChildViewController(popOverAudioVC)
            popOverAudioVC.view.frame = CGRect(x: 50, y: (self.view.frame.height/2)-125, width: self.view.frame.width-100, height: 250)
            popOverAudioVC.view.tag = 100
            self.view.addSubview(popOverAudioVC.view)
            SharedAudioPlayer.sharedInstance.loadAudioPlayer()
            //    popOverAudioVC.didMove(toParentViewController: self)
            
        }
    }
    
    func showRemoveBlur() {
        if !isBlurred {
            let blurEffect = UIBlurEffect(style: .dark)
            blurView = UIVisualEffectView(effect: blurEffect)
            blurView?.frame.size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
            blurView?.center = CGPoint(x: self.view.frame.size.width/2, y:  self.view.frame.size.height/2)
            self.view.addSubview(blurView!)
            isBlurred = true
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.blurView?.effect = UIBlurEffect(style: .dark)
                
            }, completion: { (finished: Bool) -> Void in
                self.blurView?.removeFromSuperview()
            } )
            isBlurred = false
        }
    }
    
}

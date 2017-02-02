//
//  WeekExercises.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 28/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class WeekExercises1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    let audioCellIdentifier = "AudioCell"
    
    struct Objects {
        var sectionName: String!
        var sectionObjects: [String]!
    }
    
    var objectsArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SharedAudioPlayer.sharedInstance.loadAudioPlayer()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.tableView.estimatedRowHeight = 70
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        objectsArray = [Objects(sectionName: "Formal practice", sectionObjects: ["Go through the week 1 pages of the Home Practice Handbook", "Do the guided audio practice (Body Scan, 15 to 15 min) six days a week"]), Objects(sectionName: "Informal practice", sectionObjects: ["Eat one meal (or one bite) mindfully", "Attempt to solve the 9 dots exercise, while noticing how you go about solving it"]), Objects(sectionName: "Insight practice", sectionObjects: ["Keeping a daily log of your practice (use the form in your Home Practice Handbook) to record your experience", "Identify your intentions for this course"]), Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 3 {
            let audioCell = tableView.dequeueReusableCell(withIdentifier: audioCellIdentifier, for: indexPath) as! AudioCell
            audioCell.titleLbl.text = objectsArray[indexPath.section].sectionObjects[indexPath.row]
            audioCell.selectionStyle = UITableViewCellSelectionStyle.none
            return audioCell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! TextCell
            cell.cellLabel.text = objectsArray[indexPath.section].sectionObjects[indexPath.row]
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
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
        if indexPath.section == 3 {
            let popOverAudioVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "audioPlayerPopUp") as! AudioPlayerVC
            if  self.view.viewWithTag(100) != nil {
                SharedVars.sharedInstance.audioTitle = objectsArray[indexPath.section].sectionObjects[indexPath.row]
                SharedAudioPlayer.sharedInstance.loadAudioPlayer()
                for view in self.view.subviews {
                    print(view)
                }
            } else {
                self.addChildViewController(popOverAudioVC)
                SharedVars.sharedInstance.audioTitle = objectsArray[indexPath.section].sectionObjects[indexPath.row]
                popOverAudioVC.view.frame = CGRect(x: 0, y: self.view.frame.height - 249, width: self.view.frame.width, height: 250)
                popOverAudioVC.view.tag = 100
                self.view.addSubview(popOverAudioVC.view)
                popOverAudioVC.didMove(toParentViewController: self)
            }
        }
    }
}

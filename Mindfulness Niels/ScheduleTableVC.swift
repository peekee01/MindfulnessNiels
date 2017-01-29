//
//  ScheduleTableVC.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 29/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class ScheduleTableVC: UITableViewController, ENSideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        self.tableView.tableHeaderView = UIView()
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Background_green.jpg")!)
        
    }
    
    
    //disable SideMenu
    func sideMenuShouldOpenSideMenu() -> Bool {
        return false;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let indexPath = tableView.indexPathForSelectedRow
      //  let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell!
        
        print("current indexpath is \(indexPath!.row)")
        let chosenWeek = indexPath!.row + 1
  //      let identifier = "WeekMain\(chosenWeek)"
        SharedVars.sharedInstance.weekNum = "Week \(chosenWeek)"
        SharedVars.sharedInstance.chosenWeek = indexPath!.row + 1
        
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "WeekMain") as! WeekMain

        self.navigationController?.pushViewController(nextViewController, animated: true)
        
        //   SharedVars.sharedInstance.weekNum = (currentCell!.textLabel!.text)!
        
        //  let destinationVC = storyboard.instantiateViewController(withIdentifier: "WeekMain") as! WeekMain
        
        //    sideMenuController()?.setContentViewController(destinationVC)
    }
}

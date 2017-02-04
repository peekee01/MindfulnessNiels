//
//  MenuTableVC.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 25/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class MenuTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.contentInset = UIEdgeInsetsMake( 48, 0, 0, 0)
        tableView.layer.opacity = 0.6
        tableView.tableFooterView = UIView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell!
        
        
        SharedVars.sharedInstance.weekNum = (currentCell!.textLabel!.text)!
        SharedVars.sharedInstance.chosenWeek = indexPath!.row + 1

        let destinationVC = storyboard.instantiateViewController(withIdentifier: "WeekMain") as! WeekMain
     //   self.present(destinationVC, animated: true, completion: nil)

       sideMenuController()?.setContentViewController(destinationVC)
    }
    
}

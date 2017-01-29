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
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //disable SideMenu
    func sideMenuShouldOpenSideMenu() -> Bool {
        return false;
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

   
}

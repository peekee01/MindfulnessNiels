//
//  LeftMenuVC.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 24/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class LeftMenuVC: ENSideMenuNavigationController, ENSideMenuDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: LeftMenuTableVC(), menuPosition:.left)
        sideMenu?.menuWidth = 180.0
        // show the navigation bar over the side menu view
       // view.bringSubview(toFront: ScheduleVC.View)
        self.view.layer.zPosition = 1;
    }
    
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

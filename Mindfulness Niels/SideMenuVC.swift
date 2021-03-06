//
//  SideMenuVC.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 25/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class SideMenuVC: ENSideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background_green.jpg")!)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let menu = storyboard.instantiateViewController(withIdentifier: "MenuTableVC") as! MenuTableVC

        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: menu, menuPosition: ENSideMenuPosition.right)
        sideMenu?.menuWidth = 200
        view.bringSubview(toFront: navigationBar)
        

        
    }

    
}

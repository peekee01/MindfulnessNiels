//
//  WeekMain.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 28/01/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class WeekMain: UIViewController, ENSideMenuDelegate {
    
    enum TabIndex : Int {
        case firstChildTab = 0
        case secondChildTab = 1
        case thirdChildTab = 2
    }
    
    var chosenWeekMain = SharedVars.sharedInstance.chosenWeek

    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var segmentedBtn: CustomSegmentedControl!
    
    var currentViewController: UIViewController?
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "WeekIntro\(SharedVars.sharedInstance.chosenWeek)")
        return firstChildTabVC
    }()
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "WeekExercises\(SharedVars.sharedInstance.chosenWeek)")
        return secondChildTabVC
    }()
    lazy var thirdChildTabVC : UIViewController? = {
        let thirdChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "WeekAdditional\(SharedVars.sharedInstance.chosenWeek)")
        return thirdChildTabVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = SharedVars.sharedInstance.weekNum
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        segmentedBtn.initUI()
        segmentedBtn.selectedSegmentIndex = TabIndex.firstChildTab.rawValue
        displayCurrentTab(TabIndex.firstChildTab.rawValue)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        return true;
    }

    
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
        toggleSideMenuView()
    }

    
    @IBAction func switchTabs(_ sender: UISegmentedControl) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.firstChildTab.rawValue :
            vc = firstChildTabVC
        case TabIndex.secondChildTab.rawValue :
            vc = secondChildTabVC
        case TabIndex.thirdChildTab.rawValue :
            vc = thirdChildTabVC
        default:
            return nil
        }
        
        return vc
    }
    
}

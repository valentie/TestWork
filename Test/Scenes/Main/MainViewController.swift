//
//  MainViewController.swift
//  FinTechTest
//
//  Created by Tana Chaijamorn on 15/8/2563 BE.
//  Copyright © 2563 BE Tana Chaijamorn. All rights reserved.
//

import UIKit

class MainViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

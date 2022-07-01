//
//  MainTabBarController.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-27.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavBar("", true, true)
        let newsListViewController = self.viewControllers![0] as! UINavigationController
        NewsListConfigurator.configureModule(viewController: newsListViewController.viewControllers[0] as! NewsViewController )
        
        let savedNewsViewController = self.viewControllers![1] as! UINavigationController
        SavedNewsConfigurator.configureModule(viewController: savedNewsViewController.viewControllers[0] as! SavedNewsViewController )
        self.navigationController?.navigationBar.isHidden = true
    }

}

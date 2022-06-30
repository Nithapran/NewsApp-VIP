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
        let newsListViewController = self.viewControllers![0] as! UINavigationController
        NewsListConfigurator.configureModule(viewController: newsListViewController.viewControllers[0] as! NewsViewController )
        self.navigationController?.navigationBar.isHidden = true
    }
    
//    override var selectedViewController: UIViewController? {
//        didSet {
//            switch selectedViewController {
//            case is NewsViewController:
//                self.navigationController?.navigationBar.topItem?.title = "News"
//                break
//            case is SavedNewsViewController:
//                self.navigationController?.navigationBar.topItem?.title = "Saved"
//                break
//            case .none:
//                break
//            case .some(_):
//                break
//            }
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

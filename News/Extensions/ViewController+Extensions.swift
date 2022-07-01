//
//  ViewController+Extensions.swift
//  NetworkLayer
//
//  Created by Nithaparan Francis on 2022-06-18.
//

import Foundation
import UIKit

extension UIViewController {
    func setUpNavBar(_ title: String = "",_ isHidden: Bool = false,_ prefersLargeTitles: Bool = true) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        if !prefersLargeTitles {
            navigationItem.largeTitleDisplayMode = .never
        }
        self.navigationController?.navigationBar.isTranslucent = true
        self.title = title
        UINavigationBar.appearance().tintColor = UIColor.red
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .red
            appearance.titleTextAttributes =  [NSAttributedString.Key.foregroundColor : UIColor.white]
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            self.navigationController?.navigationBar.standardAppearance = appearance;
            self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        }
    }
}

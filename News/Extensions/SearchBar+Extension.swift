//
//  SearchBar+Extension.swift
//  News
//
//  Created by Nithaparan Francis on 2022-07-01.
//

import Foundation
import UIKit

extension UISearchBar {
    func changeBackgroundColor(color: UIColor) {
        if let textField = self.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = color
            //textField.font = myFont
            //textField.textColor = myTextColor
            //textField.tintColor = myTintColor
            // And so on...
            
            let backgroundView = textField.subviews.first
            if #available(iOS 11.0, *) { // If `searchController` is in `navigationItem`
                backgroundView?.backgroundColor = UIColor.white.withAlphaComponent(0.3) //Or any transparent color that matches with the `navigationBar color`
                backgroundView?.subviews.forEach({ $0.removeFromSuperview() }) // Fixes an UI bug when searchBar appears or hides when scrolling
            }
            backgroundView?.layer.cornerRadius = 10.5
            backgroundView?.layer.masksToBounds = true
            //Continue changing more properties...
        }
    }
}

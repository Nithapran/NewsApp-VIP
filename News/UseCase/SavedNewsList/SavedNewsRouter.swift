//
//  SavedNewsRouter.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-29.
//

import Foundation
import UIKit

protocol SavedNewsRoutable {
    var navigationController: UINavigationController? { get }
    func navigateToNewsDetails(news: News)
}

class SavedNewsRouter: SavedNewsRoutable {
    func navigateToNewsDetails(news: News) {
        let vc = ViewControllerFactory.viewController(for: .newsDetails) as! NewsDetailsViewController
        vc.news = news
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    var navigationController: UINavigationController?
}

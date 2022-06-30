//
//  ViewControllerFactory.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-19.
//

import Foundation
import UIKit

enum TypeOfViewController {
    case mainTabBar
    case newsList
    case savedNewsList
    case newsDetails
    case filter
    case preference
    
    var id: String {
        switch self {
        case .mainTabBar:
            return "MainTabBarController"
        case .newsList:
            return "NewsViewController"
        case .savedNewsList:
            return "SavedNewsViewController"
        case .newsDetails:
            return "NewsDetailsViewController"
        case .filter:
            return "FilterViewController"
        case .preference:
            return "PreferenceViewController"
        }
    }
}

class ViewControllerFactory: NSObject {
    static func viewController(for typeOfVC: TypeOfViewController) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: typeOfVC.id)
        return vc
    }
}

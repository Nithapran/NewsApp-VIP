//
//  ViewControllerFactory.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-19.
//

import Foundation
import UIKit

enum TypeOfViewController {
    case newsList
    case newsDetails
    case filter
    
    var id: String {
        switch self {
        case .newsList:
            return "NewsViewController"
        case .newsDetails:
            return "NewsDetailsViewController"
        case .filter:
            return "FilterViewController"
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

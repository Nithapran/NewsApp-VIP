//
//  NewsDetailsRouter.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-19.
//

import Foundation
import UIKit

protocol NewsDetailsRoutable {
    var navigationController: UINavigationController? { get }
}

class NewsDetailsRouter: NewsDetailsRoutable {
    var navigationController: UINavigationController?
}

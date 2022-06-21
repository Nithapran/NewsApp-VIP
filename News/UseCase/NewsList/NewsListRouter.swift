//
//  NewsListRouter.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-18.
//

import Foundation
import UIKit

protocol NewsListRoutable {
    var navigationController: UINavigationController? { get }
        
    func presentFilterView(with didSelectFilter: ((_ selectedCountry: Countries) -> Void)?)
    
    func navigateToNewsDetails(news: News)
    
}

class NewsListRouter: NewsListRoutable {
    func navigateToNewsDetails(news: News) {
        let viewController = ViewControllerFactory.viewController(for: .newsDetails) as! NewsDetailsViewController
        NewsDetailsConfigurator.configureModule(viewController: viewController, news: news)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    var navigationController: UINavigationController?
    
    func presentFilterView(with didSelectFilter: ((_ selectedCountry: Countries) -> Void)?) {
        let vc = FilterViewController() //change this to your class name
        let nav = UINavigationController(rootViewController: vc)
        vc.didSelectFilter = didSelectFilter
            
        
         // Present View "Modally"
        navigationController?.present(nav, animated: true, completion: nil)
    }
    
    
}

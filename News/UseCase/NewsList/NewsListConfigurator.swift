//
//  NewsListConfigurator.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-18.
//

import Foundation

class NewsListConfigurator {
    
    static func configureModule( viewController: NewsViewController) {
        
        let interactor = NewsListInteractor()
        
        let presenter = NewsListPresenter()
        
        let router = NewsListRouter()
        
        viewController.interactor = interactor
        
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}

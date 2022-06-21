//
//  NewsDetailsConfigurator.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-19.
//

import Foundation

class NewsDetailsConfigurator {
    static func configureModule(viewController: NewsDetailsViewController,news: News) {
        let interactor = NewsDetailsInteractor()

        let presenter = NewsDetailsPresenter()

        let router = NewsDetailsRouter()
        
        viewController.interactor = interactor
        
        viewController.router = router
        
        viewController.news = news
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}



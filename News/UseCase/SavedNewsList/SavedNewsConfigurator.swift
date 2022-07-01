//
//  SavedNewsConfigurator.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-29.
//

import Foundation

class SavedNewsConfigurator {
    
    static func configureModule( viewController: SavedNewsViewController) {
        
        let interactor = SavedNewsInteractor()
        
        let presenter = SavedNewsPresenter()
        
        let router = SavedNewsRouter()
        
        viewController.interactor = interactor
        
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}

//
//  SavedNewsInteractor.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-29.
//

import Foundation

protocol SavedNewsInteractable {
    func viewDidLoad()
    func didClickOnClearButton()
}

class SavedNewsInteractor: SavedNewsInteractable {
    
    var saveNews: [News]?
    
    var presenter: SavedNewsPresentable?
    
    func viewDidLoad() {
        saveNews = App.persistance.newsStore.getAllNews().map{$0.toModel()}
        DispatchQueue.main.async {
            self.presenter?.didFetchSavedNewsFromLocal(news: self.saveNews)
        }
        
    }
    
    func didClickOnClearButton() {
        let status = App.persistance.newsStore.deleteAllNews()
        if status {
            presenter?.didClearAllNewsFromDatabase()
        }
    }
}

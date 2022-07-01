//
//  SavedNewsPresenter.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-29.
//

import Foundation

import Foundation

protocol SavedNewsPresentable {
    func didFetchSavedNewsFromLocal(news: [News]?)
    func didClearAllNewsFromDatabase()
}

class SavedNewsPresenter: SavedNewsPresentable {
    
    var viewController: SavedNewsView?
    
    func didFetchSavedNewsFromLocal(news: [News]?) {
        viewController?.didFetchNewsFromLocal(news: news)
    }
    
    func didClearAllNewsFromDatabase() {
        viewController?.refreshView()
    }
}

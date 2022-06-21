//
//  NewsListPresenter.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-18.
//

import Foundation

protocol NewsListPresentable {
    func didFetchNews(news: [News])
    func didFilterNews(news: [News])
}

class NewsListPresenter: NewsListPresentable {
    
    
    
    weak var viewController: NewsListView?
    
    func didFetchNews(news: [News]) {
        viewController?.didFetchNews(news: news)
    }
    
    
    func didFilterNews(news: [News]) {
        self.viewController?.didFilterNews(news: news)
    }
    
}

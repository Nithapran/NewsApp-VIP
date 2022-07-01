//
//  NewsListInteractor.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-18.
//

import Foundation

protocol NewsListInteractable {
    func fetchNews(selectedCountry: String)
    func didSearchBarChangeText(text: String?)
    func didSelectCell()
    func didClickSaveButton(news: News?)
}

class NewsListInteractor: NewsListInteractable {
    func didClickSaveButton(news: News?) {
        if let news = news {
            if news.isPersisted {
                let status = App.persistance.newsStore.deleteNews(news: NewsRealm(news: news))
                if status {
                    presenter?.didFinishDeletingFromDatabase()
                }
            } else {
                let status = App.persistance.newsStore.saveNews(news: NewsRealm(news: news))
                if status {
                    presenter?.didFinishSavingToDatabase()
                }
            }
            
        }
    }
    
    
    
    var newsCache: [News]  = []
    
    var news: [News]  = []
    
    func didSelectCell() {
        
    }
    
    
    var presenter: NewsListPresentable?
    
    func fetchNews(selectedCountry: String = "CA") {
        
        let queryParams = [
            "country": selectedCountry,
            "apiKey": "9e9d4bdb2c1d4d9c99488b8f32079b79"
        ]
        App.service.newsService.getTopHeadLines(queryParams: queryParams) {
            newss in
            self.news = newss ?? []
            self.newsCache = newss ?? []
            DispatchQueue.main.async {
                self.presenter?.didFetchNews(news: self.news)
            }
            
        }
    }
    
    func didSearchBarChangeText(text: String?) {
        guard let text = text else {
            self.news = newsCache
            self.presenter?.didFilterNews(news: self.news)
            return
        }
    
        if text == "" {
            self.news = newsCache
            self.presenter?.didFilterNews(news: self.news)
            return
        }
        let aa = self.news.filter {
            $0.title!.lowercased().contains(text.lowercased())
        }
        self.news = aa
        self.presenter?.didFilterNews(news: self.news)
    }
    
}

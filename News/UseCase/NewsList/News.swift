//
//  News.swift
//  NetworkLayer
//
//  Created by Nithaparan Francis on 2022-06-18.
//

import Foundation

struct News: Hashable, Codable {
    var author: String?
    var title: String?
    var description: String?
    var urlToImage: String?
    var publishedAt: String?
    
    var isPersisted: Bool {
        if let title = title {
            let news = App.persistance.newsStore.getNews(for: title)
            
            if news != nil {
                return true
            }
        }
        
        return false
    }
}

//
//  NewsRealm.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-29.
//

import Foundation
import RealmSwift

var author: String?
var title: String?
var description: String?
var urlToImage: String?
var publishedAt: String?

// Define your models like regular Swift classes
class NewsRealm: Object {
    @Persisted var author: String?
    @Persisted var title: String?
    @Persisted var newsDescription: String?
    @Persisted var urlToImage: String?
    @Persisted var publishedAt: String?
    
    override class func primaryKey() -> String? {
        return "title"
    }
    
    func toModel() -> News {
        return News(author: self.author, title: self.title, description: self.newsDescription, urlToImage: self.urlToImage, publishedAt: self.publishedAt)
    }
}

extension NewsRealm {
    convenience init(news: News) {
        self.init()
        author = news.author
        title = news.title
        newsDescription = news.description
        urlToImage = news.urlToImage
        publishedAt = news.publishedAt
        
    }
}

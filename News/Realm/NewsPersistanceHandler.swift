//
//  NewsPersistanceHandler.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-29.
//

import Foundation
import RealmSwift


protocol NewsPersistable {
    func saveNews(news: NewsRealm) -> Bool
    func deleteNews(news: NewsRealm) -> Bool
    func deleteAllNews() -> Bool
    func getNews(for title: String) -> NewsRealm?
    func getAllNews() -> [NewsRealm]
}

class NewsPersistanceHandler: NewsPersistable {
    
    
    let realm = try! Realm()
    
    func getAllNews() -> [NewsRealm]{
        let news = realm.objects(NewsRealm.self)
        return Array(news)
    }
    
    func deleteAllNews() -> Bool {
        let allNews = realm.objects(NewsRealm.self)
            do {
            try realm.write {
                for news in allNews {
                    realm.delete(news)
                }
                
                
            }
            } catch {
                print(error)
                return false
            }
              
        
        return true
    }
    
    func deleteNews(news: NewsRealm) -> Bool {
        guard let title = news.title else {
            return false
        }
        let predicate = NSPredicate(format: "title == %@", title )
        if let newsToDelete = realm.objects(NewsRealm.self).filter(predicate).first {
            do {
            try realm.write {
                realm.delete(newsToDelete)
                
            }
            } catch {
                print(error)
                return false
            }
              
        }
        return true
       
    }
    
    func saveNews(news: NewsRealm) -> Bool {
        do {
            try realm.write {
                
                realm.add(news, update: .all)
           }
        } catch {
            print(error)
            return false
        }
        return true
    }
    
    func getNews(for title: String) -> NewsRealm? {
        let news = realm.objects(NewsRealm.self).filter {
            
            return $0.title == title
        }.first
        return news
    } 
}

//
//  NewsPersistanceHandler.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-29.
//

import Foundation
import RealmSwift


protocol NewsPersistable {
    func saveNews(news: NewsRealm)
    func getNews(for title: String) -> NewsRealm?
}

class NewsPersistanceHandler: NewsPersistable {
    let realm = try! Realm()
    
    func saveNews(news: NewsRealm) {
        do {
            try realm.write {
                realm.delete(realm.objects(NewsRealm.self))
                realm.add(news, update: .all)
           
        }
        } catch {
            print(error)
        }
    }
    
    func getNews(for title: String) -> NewsRealm? {
        return realm.objects(NewsRealm.self).first
    }
    
    
}

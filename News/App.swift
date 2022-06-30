//
//  App.swift
//  NetworkLayer
//
//  Created by Nithaparan Francis on 2022-06-09.
//

import Foundation

let App = AppConfig()

final class AppConfig {
    lazy var storage = Storage()
    lazy var service = Service()
    lazy var persistance = PersistanceHandlers()
    
    struct Service {
        lazy var newsService: NewsService = NewsService()
    }
    
    struct PersistanceHandlers {
        lazy var newsStore: NewsPersistable = NewsPersistanceHandler()
    }
    
    struct Storage {
        lazy var authStore: AuthStorable = AuthStore()
    }
}

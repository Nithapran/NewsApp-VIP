//
//  NewsDetailsViewController.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-19.
//

import Foundation
import UIKit
import SDWebImage

protocol NewsDetailsView {
    
}

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: NewsDetailsInteractable?
    
    var router: NewsDetailsRoutable?
    
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavBar("Details", false, false)
    }
    
    func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension NewsDetailsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsDetailsTableViewCell") as! NewsDetailsTableViewCell
        cell.news = news
        return cell
    }
    
    
}

extension NewsDetailsViewController: NewsDetailsView {
    
}

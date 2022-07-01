//
//  SavedNewsViewController.swift
//  News
//
//  Created by Nithaparan Francis on 2022-06-27.
//

import UIKit

protocol SavedNewsView: AnyObject {
    func didFetchNewsFromLocal(news: [News]?)
    func refreshView()
}

class SavedNewsViewController: UIViewController {
    
    var interactor: SavedNewsInteractable?
    
    var router: SavedNewsRoutable?
    
    private var news: [News] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUpNavBar("Saved News")
        interactor?.viewDidLoad()
    }

    func setUpView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 99
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
        
        //Navigation bar button setup
        let rightNavBarButton = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector (didClickClearButton))
        rightNavBarButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = rightNavBarButton
    }
    
    @objc func didClickClearButton() {
        interactor?.didClickOnClearButton()
    }
}

extension SavedNewsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        cell.state = .summary
        cell.news = self.news[indexPath.row]
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router?.navigateToNewsDetails(news: self.news[indexPath.row])
    }
}

extension SavedNewsViewController: SavedNewsView {
    func didFetchNewsFromLocal(news: [News]?) {
        self.news = news ?? []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func refreshView() {
        
        self.tableView.reloadData()
    }
}

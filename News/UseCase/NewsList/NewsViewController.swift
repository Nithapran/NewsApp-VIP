//
//  NewsViewController.swift
//  NetworkLayer
//
//  Created by Nithaparan Francis on 2022-06-05.
//

import UIKit

protocol NewsListView: AnyObject {
    func didFetchNews(news: [News])
    func didFilterNews(news: [News])
    func refreshView()
}

class NewsViewController: UIViewController {
    private var news: [News] = []
    
    private var selectedFilter: Countries? = .CA {
        didSet {
            SelectedFiltersViewHeightConstraint.constant = 30
            selectedFiltersView.isHidden = false
            self.interactor?.fetchNews(selectedCountry: self.selectedFilter?.rawValue ?? "CA")
            selectedFiltersView.selectedCountry = selectedFilter
        }
    }
    
    var interactor: NewsListInteractable?
    
    var router: NewsListRoutable?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var selectedFiltersView: SelectedFiltersView!
    
    @IBOutlet weak var SelectedFiltersViewHeightConstraint: NSLayoutConstraint!
    
    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-20, height: 10))
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        self.interactor?.fetchNews(selectedCountry: self.selectedFilter?.rawValue ?? "CA")
        
    }
    
    @objc private func didClickFilterButton() {
        self.router?.presentFilterView(with: self.didSelectFilter)
    }
    
    @objc private func didClickPreferenceButton() {
        self.router?.presentPreferenceView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUpNavBar("News")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func setUpView() {
        
        //Table view setup
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 198
        
        //Searchbar view setup
        searchBar.placeholder = "Search titles"
        searchBar.tintColor = .white
        searchBar.changeBackgroundColor(color: .white)
        searchBar.layer.cornerRadius = 10
        searchBar.delegate = self
        
        selectedFiltersView.didClickClearButton = didClearFilter
        
        //Navigation bar button setup
        let rightNavBarButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle.fill"), style: .plain, target: self, action: #selector (didClickFilterButton))
        rightNavBarButton.tintColor = .white
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        
        let leftNavBarButton = UIBarButtonItem(image: UIImage(systemName: "globe"), style: .plain, target: self, action: #selector (didClickPreferenceButton))
        leftNavBarButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }
    
    private func didSelectFilter(_ selectedCountry: Countries) {
        self.selectedFilter = selectedCountry
    }
    
    private func didClearFilter() {
        self.selectedFilter = nil
        SelectedFiltersViewHeightConstraint.constant = 0
        selectedFiltersView.isHidden = true
    }
}

extension NewsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.interactor?.didSearchBarChangeText(text: searchText)
    }
}

extension NewsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        cell.news = self.news[indexPath.row]
        cell.saveClickAction = interactor?.didClickSaveButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router?.navigateToNewsDetails(news: self.news[indexPath.row])
    }
}

extension NewsViewController: NewsListView {
    func refreshView() {
        self.tableView.reloadData()
    }
    
    func didFilterNews(news: [News]) {
        self.news = news
        self.tableView.reloadData()
    }
    
    func didFetchNews(news: [News]) {
        self.news = news
        self.tableView.reloadData()
    }
}

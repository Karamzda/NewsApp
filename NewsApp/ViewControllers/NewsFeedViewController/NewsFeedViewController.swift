//
//  NewsFeedViewController.swift
//  NewsApp
//
//  Created by Taras Zinchenko on 8/3/17.
//  Copyright © 2017 Taras Zinchenko. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var articles: [NewsArticle] = []
    var source: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
        self.navigationItem.title = "News"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView() {
        self.tableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle:nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
    }
    
    func loadData() {
        ArticlesManager.shared.fetchArticles(source: source) { (result, error) in
            if error == nil {
                self.articles = result!
                self.tableView.reloadData()
            } else {
                print("Error : \(String(describing: error))")
            }
        }
    }

}
//MARK: UITableViewDelegate
extension NewsFeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        
        UIApplication.shared.open(article.url, options: [:], completionHandler:nil)
    }
}


//MARK: UITableViewDataSource
extension NewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as! NewsFeedTableViewCell
        cell.setupCell(article: self.articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}

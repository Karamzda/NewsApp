//
//  ChannelListViewController.swift
//  NewsApp
//
//  Created by Taras Zinchenko on 8/3/17.
//  Copyright © 2017 Taras Zinchenko. All rights reserved.
//

import UIKit

class ChannelListViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var sources: [NewsSource] = []
    var sourceToShow: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        self.navigationItem.title = "Sources"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadData() {
        SourceManager.shared.fetchSourses { (result, error) in
            if error == nil {
                self.sources = result!
                self.tableView.reloadData()
            } else {
                print("Error : \(String(describing: error))")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showArticles"{
            if let vc = segue.destination as? NewsFeedViewController{
                vc.source = sourceToShow
            }

        }
    }

}

//MARK: UITableViewDelegate
extension ChannelListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.sourceToShow = sources[indexPath.row].id
        performSegue(withIdentifier: "showArticles", sender: self)
    }
}


//MARK: UITableViewDataSource
extension ChannelListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ChannelListTableViewCell", for: indexPath)
        cell.textLabel?.text = self.sources[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
}



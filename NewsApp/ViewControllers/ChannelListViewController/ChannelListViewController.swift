//
//  ChannelListViewController.swift
//  NewsApp
//
//  Created by Taras Zinchenko on 8/3/17.
//  Copyright © 2017 Taras Zinchenko. All rights reserved.
//

import UIKit

class ChannelListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//MARK: UITableViewDelegate
extension ChannelListViewController: UITableViewDelegate {
    
}


//MARK: UITableViewDataSource
extension ChannelListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ChannelListTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

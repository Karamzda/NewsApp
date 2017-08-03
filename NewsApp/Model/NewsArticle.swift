//
//  NewsArticle.swift
//  NewsApp
//
//  Created by Taras Zinchenko on 8/3/17.
//  Copyright © 2017 Taras Zinchenko. All rights reserved.
//

import UIKit
import SwiftyJSON

class NewsArticle {
    var title: String!
    var articleDiscription: String!
    var url: URL!
    var image: URL?
    
    required init(json: JSON) {
        self.title = json["title"].string
        self.articleDiscription = json["description"].string
        self.url = json["url"].url
        self.image = json["urlToImage"].url
    }
}

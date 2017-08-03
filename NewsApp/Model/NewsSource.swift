//
//  NewsSourse.swift
//  NewsApp
//
//  Created by Taras Zinchenko on 8/3/17.
//  Copyright © 2017 Taras Zinchenko. All rights reserved.
//

import UIKit
import SwiftyJSON

class NewsSource {
    var id: String!
    var name: String!
    
    required init(json: JSON) {
        self.id = json["id"].string
        self.name = json["name"].string
    }
}

//
//  ArticlesManager.swift
//  NewsApp
//
//  Created by Taras Zinchenko on 8/3/17.
//  Copyright © 2017 Taras Zinchenko. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArticlesManager: NSObject {
    
    static let shared = ArticlesManager()
    
    let apiKey = "f6261087a30d4811af431fbc84528335"
    let mainStringUrl: String = "https://newsapi.org/v1/articles"
    
    func fetchArticles(source: String, completion: @escaping ([NewsArticle]?, Error?) -> Void) {
        Alamofire.request(
            URL(string: "\(mainStringUrl)?source=\(source)&apiKey=\(apiKey)")!,
            method: .get,
            parameters: nil)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    completion(nil, response.result.error)
                    return
                }
                
                var articles: [NewsArticle] = []
                
                let jsonResult = JSON(data: response.data!)
                for sourse in (jsonResult["articles"].array)! {
                    articles.append(NewsArticle(json: sourse))
                }
                completion(articles, nil)
        }
    }

}

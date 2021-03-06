//
//  SourceManager.swift
//  NewsApp
//
//  Created by Taras Zinchenko on 8/3/17.
//  Copyright © 2017 Taras Zinchenko. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SourceManager: NSObject {
    
    static let shared = SourceManager()
    
    let mainStringUrl: String = "https://newsapi.org/v1/sources"
    
    func fetchSourses(completion: @escaping ([NewsSource]?, Error?) -> Void) {
        Alamofire.request(
            URL(string: mainStringUrl)!,
            method: .get,
            parameters: nil)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    completion(nil, response.result.error)
                    return
                }
                           
                var sources: [NewsSource] = []
                
                let jsonResult = JSON(data: response.data!)
                for sourse in (jsonResult["sources"].array)! {
                    sources.append(NewsSource(json: sourse))
                }
                completion(sources, nil)
        }
    }
}

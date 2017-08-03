//
//  NewsFeedTableViewCell.swift
//  NewsApp
//
//  Created by Taras Zinchenko on 8/3/17.
//  Copyright © 2017 Taras Zinchenko. All rights reserved.
//

import UIKit
import Kingfisher

class NewsFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(article: NewsArticle) {
        self.mainImageView.kf.setImage(with: article.image)
        self.titleLabel.text = article.title
        self.descriptionLabel.text = article.articleDiscription
    }
    
}

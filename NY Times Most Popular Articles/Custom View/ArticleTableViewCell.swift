//
//  ArticleTableViewCell.swift
//  NY Times Most Popular Articles
//
//  Created by Kassem Itani on 3/30/19.
//  Copyright © 2019 kassem Itani. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    var articleViewModel: ArticleViewModel! {
        didSet {
            titleLabel.text = articleViewModel.title
            bylineLabel.text = articleViewModel.byline
            dateLabel.text = articleViewModel.publishedDate
            thumbnailImageView.load(withImageUrl: articleViewModel.thumbnailUrlString)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

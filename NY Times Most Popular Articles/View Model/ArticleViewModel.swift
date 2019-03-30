//
//  ArticleViewModel.swift
//  NY Times Most Popular Articles
//
//  Created by Kassem Itani on 3/30/19.
//  Copyright © 2019 kassem Itani. All rights reserved.
//

struct ArticleViewModel {

    let title: String
    let byline: String
    let publishedDate: String
    let abstract: String
    let thumbnailUrlString: String?
    let imageUrlString: String?
    
    init(article: Article) {
        
        self.title = article.title
        self.byline = article.byline
        self.publishedDate = article.publishedDate
        self.abstract = article.abstract
        let mediaMetaData = article.media.first?.mediaMetadata
        self.thumbnailUrlString = mediaMetaData?.filter{
            $0.format == "Standard Thumbnail"
            }.first?.url
        self.imageUrlString = mediaMetaData?.filter{
            $0.format == "mediumThreeByTwo440"
            }.first?.url
    }
}

//
//  ArticleModel.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 18..
//  Copyright © 2018년 seungjun. All rights reserved.
//

class ArticleModel {
    var link: String
    var title: String
    var contents: String
    var thumbnailURL: String
    
    init(link: String,
         title: String,
         contents: String,
         thumbnailURL: String) {
        self.link = link
        self.title = title
        self.contents = contents
        self.thumbnailURL = thumbnailURL
    }
}

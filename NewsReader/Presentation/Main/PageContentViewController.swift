//
//  PageContentViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 9..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

/// MainPageViewController에 viewControllers로 추가되는 하위 VC.
/// 각 페이지의 Contents를 담당함.
class PageContentViewController: UIViewController {
    
    @IBOutlet weak var scrollView: ArticlePagingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var articles = [ArticleModel]()
        
        // Make Temp Models
        for _ in 0 ..< 5 {
            let article = ArticleModel(link: "temp", title: "temp", contents: "temp", thumbnailURL: "temp")
            articles.append(article)
        }
        
        // Make Temp Article pages.
        for _ in 0..<5 {
            let articleTableView = ArticlePreviewTableView(frame: scrollView.bounds)
            articleTableView.items.accept(articles)
            articleTableView.type = .multiple
            
            scrollView.addSubview(articleTableView)
        }
    }

}

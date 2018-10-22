//
//  PageContentViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 9..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

enum PageContentType {
    case today
    case star
    case group
}

/// MainPageViewController에 viewControllers로 추가되는 하위 VC.
/// 각 페이지의 Contents를 담당함.
class PageContentViewController: UIViewController {
    
    @IBOutlet weak var scrollView: ArticlePagingView!
    
    fileprivate let searchBarItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(didSearchBarItemTapped))
    fileprivate let addBarItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(didAddBarItemTapped))
    
    // Required
    var page: Int!
    var type: PageContentType! {
        didSet {
            switch self.type! {
            case .today:
                self.useSearchBarItem = true
            case .star:
                self.useSearchBarItem = true
            case .group:
                self.useSearchBarItem = true
                self.useAddBarItem = true
            }
        }
    }
    
    // "Search" Navigation Button 사용 여부.
    var useSearchBarItem: Bool = false {
        didSet {
            if self.useSearchBarItem {
                self.addNavigationItem(self.searchBarItem)
            } else {
                self.removeNavigationItem(self.searchBarItem)
            }
        }
    }
    
    // "Add" Navigation Button 사용 여부.
    var useAddBarItem: Bool = false {
        didSet {
            if self.useAddBarItem {
                self.addNavigationItem(self.addBarItem)
            } else {
                self.removeNavigationItem(self.addBarItem)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
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
        #endif
    }
    
    // MARK: - UIBarButtonItem Actions
    @objc func didSearchBarItemTapped() {
        
    }
    
    @objc func didAddBarItemTapped() {
        
    }
}

// MARK: - Internal
fileprivate extension PageContentViewController {
    
    func addNavigationItem(_ barButtonItem: UIBarButtonItem) {
        if var rightBarButtonItems = self.navigationController?.navigationItem.rightBarButtonItems {
            if rightBarButtonItems.isEmpty {
                rightBarButtonItems = [barButtonItem]
            } else {
                rightBarButtonItems.append(barButtonItem)
            }
        }
    }
    
    func removeNavigationItem(_ barButtonItem: UIBarButtonItem) {
        if var rightBarButtonItems = self.navigationController?.navigationItem.rightBarButtonItems {
            if let removeTarget = (rightBarButtonItems.filter { $0 === barButtonItem }.first) {
                rightBarButtonItems.removeAll { (barButtonItem) -> Bool in
                    return barButtonItem === removeTarget
                }
            }
        }
    }
}

// MARK - ViewControllerInterface
extension PageContentViewController: ViewControllerInterface {
    static func instance() -> Self {
        return instance(storyboardName: "Main", identifier: "\(PageContentViewController.self)")
    }
}

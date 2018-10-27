//
//  PageContentViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 9..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit
import RxSwift

enum PageContentType {
    case today
    case star
    case group
}

/// MainPageViewController에 viewControllers로 추가되는 하위 VC.
/// 각 페이지의 Contents를 담당함.
class PageContentViewController: UIViewController {
    
    @IBOutlet weak var scrollView: ArticlePagingView!
    
    let disposeBag = DisposeBag()
    
    // Required
    var page: Int!
    var type: PageContentType! {
        didSet {
            NotificationCenter.default.post(name: .clearBarItem, object: nil)
            
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
            NotificationCenter.default.post(name: .useSearchBarItem, object: nil, userInfo: ["using": useSearchBarItem])
        }
    }
    
    // "Add" Navigation Button 사용 여부.
    var useAddBarItem: Bool = false {
        didSet {
            NotificationCenter.default.post(name: .useAddBarItem, object: nil, userInfo: ["using": useAddBarItem])
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
            articleTableView.rx.itemSelected
                .subscribe { (indexPath) in
                    if let indexPath = indexPath.element {
                        if let cell = articleTableView.cellForRow(at: indexPath) as? ArticlePreviewMultipleCell {
                            let globalFrame = self.view.convert(cell.thumbnailView.frame, from: cell.thumbnailView.superview!)
                            let detailVC = PageDetailViewController.instance()
                            detailVC.mainImage = cell.thumbnailView.image
                            detailVC.mainImageFrame = globalFrame
                            
                            print(globalFrame)
                            
                            self.navigationController?.pushViewController(detailVC, animated: false)
                        }
                    }
                }
                .disposed(by: disposeBag)
            
            scrollView.addSubview(articleTableView)
        }
        #endif
        
        
    }
}

// MARK: - Internal
fileprivate extension PageContentViewController {
    
    
}

// MARK - ViewControllerInterface
extension PageContentViewController: ViewControllerInterface {
    static func instance() -> Self {
        return instance(storyboardName: "Main", identifier: "\(PageContentViewController.self)")
    }
}

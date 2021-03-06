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
    var type: PageContentType!
    
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
    
    fileprivate var thumbnailWithAnimate: UIImageView?
    
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
                            
                            self.animateThumbnail(thumbnail: cell.thumbnailView, originFrame: globalFrame, targetFrame: detailVC.mainImageFrame) {
                                self.navigationController?.pushViewController(detailVC, animated: false)
                            }
                        }
                    }
                }
                .disposed(by: disposeBag)
            
            scrollView.addSubview(articleTableView)
        }
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.refreshRightBarButtonItems()
    }
}

// MARK: - Internal
fileprivate extension PageContentViewController {
    
    /// type에 맞는 Navigation Bar Item을 로딩함.
    func refreshRightBarButtonItems() {
        NotificationCenter.default.post(name: .clearBarItem, object: nil)
        
        switch self.type! {
        case .today:
            self.useSearchBarItem = true
            self.useAddBarItem = false
        case .star:
            self.useSearchBarItem = true
            self.useAddBarItem = false
        case .group:
            self.useSearchBarItem = true
            self.useAddBarItem = true
        }
    }
    
    func animateThumbnail(thumbnail: UIImageView, originFrame: CGRect, targetFrame: CGRect, completion: @escaping () -> ()) {
        thumbnail.isHidden = true
        
        if let thumbnailWithAnimate = self.thumbnailWithAnimate {
            thumbnailWithAnimate.image = thumbnail.image
            thumbnailWithAnimate.frame = originFrame
            thumbnailWithAnimate.isHidden = false
        } else {
            self.thumbnailWithAnimate = UIImageView(image: thumbnail.image!)
            self.thumbnailWithAnimate!.frame = originFrame
            self.view.addSubview(thumbnailWithAnimate!)
        }
        
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            if let thumbnailWithAnimate = self?.thumbnailWithAnimate {
                thumbnailWithAnimate.frame = targetFrame
            }
        }, completion: { [weak self] (completed) in
            completion()
            
            self?.thumbnailWithAnimate?.isHidden = true
            thumbnail.isHidden = false
        })
    }
}

// MARK - ViewControllerInterface
extension PageContentViewController: ViewControllerInterface {
    static func instance() -> Self {
        return instance(storyboardName: "Main", identifier: "\(PageContentViewController.self)")
    }
}

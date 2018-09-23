//
//  MainPageViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 9..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    var numberOfPages: Int = 5
    var currentPage: Int = 0 {
        didSet {
            NotificationCenter.default.post(name: .pageMoved, object: self, userInfo: ["page": currentPage])
        }
    }
    
    var currentVC: PageContentViewController? {
        return self.viewControllers?.first as? PageContentViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = makePageContentVC(type: .today, page: 0)
        
        self.delegate = self
        self.dataSource = self
        self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - Internal
fileprivate extension MainPageViewController {

    func makePageContentVC(type: PageContentType, page: Int) -> PageContentViewController {
        let pageVC = PageContentViewController.instance()
        pageVC.type = type
        pageVC.page = page
        
        return pageVC
    }
}

// MARK: - UIPageViewControllerDataSource
extension MainPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentVC = self.currentVC else { return nil }
        
        let prevPage = currentVC.page - 1

        if prevPage >= 0 {
            if prevPage == 0 {
                return makePageContentVC(type: .today, page: prevPage)
            } else if prevPage == 1 {
                return makePageContentVC(type: .star, page: prevPage)
            } else {
                return makePageContentVC(type: .group, page: prevPage)
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentVC = self.currentVC else { return nil }
        
        let nextPage = currentVC.page + 1

        if nextPage < self.numberOfPages {
            if nextPage == 1 {
                return makePageContentVC(type: .star, page: nextPage)
            } else {
                return makePageContentVC(type: .group, page: nextPage)
            }
        }
        
        return nil
    }
}

// MARK: - UIPageViewControllerDelegate
extension MainPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }

        if let currentVC = self.currentVC {
            self.currentPage = currentVC.page
        }
    }
}

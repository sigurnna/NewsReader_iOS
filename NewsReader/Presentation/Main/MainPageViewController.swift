//
//  MainPageViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 9..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageContentVC = PageContentViewController.instance()
        pageContentVC.type = .today

        self.dataSource = self
        self.setViewControllers([pageContentVC], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - UIPageViewControllerDataSource
extension MainPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! PageContentViewController
        let prevVC = PageContentViewController.instance()
        
        if contentVC.type == .group {
            prevVC.type = .star
            return prevVC
        } else if contentVC.type == .star {
            prevVC.type = .today
            return prevVC
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! PageContentViewController
        let nextVC = PageContentViewController.instance()
        
        if contentVC.type == .today {
            nextVC.type = .star
            return nextVC
        } else if contentVC.type == .star {
            nextVC.type = .group
            return nextVC
        }
        
        return nil
    }
}

// MARK: - UIPageViewControllerDelegate
//extension MainPageViewController: UIPageViewControllerDelegate {
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return 3
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        let vc = pageViewController.presentedViewController as! PageContentViewController
//
//        if vc.type == .today {
//            return 0
//        } else if vc.type == .star {
//            return 1
//        } else {
//            return 2
//        }
//    }
//}

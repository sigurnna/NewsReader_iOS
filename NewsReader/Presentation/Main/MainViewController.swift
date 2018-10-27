//
//  RootViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 20..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    fileprivate let searchBarItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(didSearchBarItemTapped))
    fileprivate let addBarItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(didAddBarItemTapped))
    
    @IBOutlet weak var pageControl: ArticlePageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didPageMoved(_:)), name: .pageMoved, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(clearBarItem(_:)), name: .clearBarItem, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(useSearchBarItem(_:)), name: .useSearchBarItem, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(useAddBarItem(_:)), name: .useAddBarItem, object: nil)
    }
    
    // MARK: - Notifications
    @objc func didPageMoved(_ notification: Notification) {
        if let page = notification.userInfo?["page"] as? Int {
            self.pageControl.currentPage = page
        }
    }
    
    @objc func clearBarItem(_ notification: Notification) {
        self.navigationItem.rightBarButtonItems?.removeAll()
    }
    
    @objc func useSearchBarItem(_ notification: Notification) {
        if let showSearchBar = notification.userInfo?["using"] as? Bool {
            if showSearchBar {
                self.addNavigationItem(self.searchBarItem)
            } else {
                self.removeNavigationItem(self.searchBarItem)
            }
        }
    }
    
    @objc func useAddBarItem(_ notification: Notification) {
        if let showAddBar = notification.userInfo?["using"] as? Bool {
            if showAddBar {
                self.addNavigationItem(self.addBarItem)
            } else {
                self.removeNavigationItem(self.addBarItem)
            }
        }
    }
    
    // MARK: - UI Actions
    @objc func didSearchBarItemTapped() {
        
    }
    
    @objc func didAddBarItemTapped() {
        
    }
}

// MARK: - Internal
fileprivate extension MainViewController {
    
    func addNavigationItem(_ barButtonItem: UIBarButtonItem) {
        if self.navigationItem.rightBarButtonItems?.isEmpty ?? true {
            self.navigationItem.rightBarButtonItem = barButtonItem
        } else {
            self.navigationItem.rightBarButtonItems?.append(barButtonItem)
        }
    }
    
    func removeNavigationItem(_ barButtonItem: UIBarButtonItem) {
        if var rightBarButtonItems = self.navigationItem.rightBarButtonItems {
            if let removeTarget = (rightBarButtonItems.filter { $0 === barButtonItem }.first) {
                rightBarButtonItems.removeAll { (barButtonItem) -> Bool in
                    return barButtonItem === removeTarget
                }
            }
        }
    }
}

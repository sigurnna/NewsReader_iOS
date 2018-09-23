//
//  RootViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 20..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var pageControl: ArticlePageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didPageMoved(_:)), name: .pageMoved, object: nil)
    }
    
    @objc func didPageMoved(_ notification: Notification) {
        if let page = notification.userInfo?["page"] as? Int {
            self.pageControl.currentPage = page
        }
    }
}

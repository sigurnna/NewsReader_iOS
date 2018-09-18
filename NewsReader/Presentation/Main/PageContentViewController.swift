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
class PageContentViewController: BaseViewController {
    
    @IBOutlet weak var scrollView: ArticlePagingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<5 {
            let label = UILabel()
            label.frame = self.view.bounds
            label.text = String(format: "%@ %D", "Test Label ", i)
            label.textAlignment = .center
            
            if i % 2 == 0 {
                label.backgroundColor = UIColor.gray
            } else {
                label.backgroundColor = UIColor.darkGray
            }
            
            scrollView.addSubview(label)
        }
    }

}

//
//  PageDetailViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 10. 27..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class PageDetailViewController: UIViewController {
    
    var imageViewWithAnimate: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ViewControllerInterface
extension PageDetailViewController: ViewControllerInterface {
    class func instance() -> Self {
        return instance(storyboardName: "Main", identifier: "\(PageDetailViewController.self)")
    }
}

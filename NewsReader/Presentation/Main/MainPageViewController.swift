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

        self.setViewControllers([ViewControllerManager.shared.instance(.pageContentViewController)], direction: .forward, animated: true, completion: nil)
    }
}

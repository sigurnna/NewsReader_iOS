//
//  AddPageViewController.swift
//  NewsReader
//
//  Created by 이승준 on 04/11/2018.
//  Copyright © 2018 seungjun. All rights reserved.
//

import UIKit

class AddPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

// MARK: - ViewControllerInterface
extension AddPageViewController: ViewControllerInterface {
    class func instance() -> Self {
        return instance(storyboardName: "Main", identifier: "\(AddPageViewController.self)")
    }
}

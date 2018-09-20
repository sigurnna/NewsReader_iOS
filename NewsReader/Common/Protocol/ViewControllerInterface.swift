//
//  ViewControllerInterface.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 20..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

protocol ViewControllerInterface where Self: UIViewController {
    static func instance() -> Self
}

extension ViewControllerInterface where Self: UIViewController {
    static func instance(storyboardName: String, identifier: String) -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}

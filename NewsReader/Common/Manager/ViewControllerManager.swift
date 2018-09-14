//
//  ViewControllerManager.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 14..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

enum ViewControllerEnum {
    case pageContentViewController
    
    /// ViewController Identifier.
    var identifier: String {
        switch self {
        case .pageContentViewController:
            return "\(PageContentViewController.self)"
        }
    }
    
    /// ViewContoller가 포함된 storyboard 이름.
    var storyboard: String {
        switch self {
        case .pageContentViewController:
            return "Main"
        }
    }
}

class ViewControllerManager {
    static let shared = ViewControllerManager()
    
    private init() { }
    
    func instance(_ viewControllerEnum: ViewControllerEnum) -> UIViewController {
        let storyboard = UIStoryboard(name: viewControllerEnum.storyboard, bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: viewControllerEnum.identifier)
    }
}

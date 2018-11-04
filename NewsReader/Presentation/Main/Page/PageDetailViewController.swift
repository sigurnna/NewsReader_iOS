//
//  PageDetailViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 10. 27..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class PageDetailViewController: UIViewController {
    let mainImageHeight: CGFloat = 300
    
    @IBOutlet weak fileprivate var scrollView: UIScrollView!
    @IBOutlet weak fileprivate var mainImageView: UIImageView!
    
    var mainImage: UIImage? // set from outside.
    var mainImageFrame: CGRect {
        let screenBounds = UIScreen.main.bounds
        
        return CGRect(x: screenBounds.origin.x,
                           y: screenBounds.origin.y,
                           width: screenBounds.width,
                           height: self.mainImageHeight)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let mainImage = self.mainImage {
            self.mainImageView.image = mainImage
            self.mainImageView.isHidden = false
        }
    }
}

// MARK: - ViewControllerInterface
extension PageDetailViewController: ViewControllerInterface {
    class func instance() -> Self {
        return instance(storyboardName: "Main", identifier: "\(PageDetailViewController.self)")
    }
}

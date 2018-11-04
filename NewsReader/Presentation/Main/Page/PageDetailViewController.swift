//
//  PageDetailViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 10. 27..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class PageDetailViewController: UIViewController {
    
    @IBOutlet weak fileprivate var scrollView: UIScrollView!
    @IBOutlet weak fileprivate var mainImageView: UIImageView!
    
    fileprivate let heightMultiplier: CGFloat = 0.6
    
    // Set from outside.
    var mainImage: UIImage?
    
    var mainImageFrame: CGRect {
        let screenBounds = UIScreen.main.bounds
        
        return CGRect.init(x: screenBounds.origin.x,
                           y: screenBounds.origin.y,
                           width: screenBounds.width,
                           height: screenBounds.height * self.heightMultiplier)
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

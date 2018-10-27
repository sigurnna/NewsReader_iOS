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
    
    // Set from outside.
    var mainImage: UIImage?
    var mainImageFrame: CGRect?
    
    var imageViewWithAnimating: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = self.mainImage, let imageFrame = self.mainImageFrame {
            self.imageViewWithAnimating = UIImageView(image: image)
            self.imageViewWithAnimating!.frame = imageFrame
            
            self.scrollView.addSubview(self.imageViewWithAnimating!)
        }
    }
}

// MARK: - ViewControllerInterface
extension PageDetailViewController: ViewControllerInterface {
    class func instance() -> Self {
        return instance(storyboardName: "Main", identifier: "\(PageDetailViewController.self)")
    }
}

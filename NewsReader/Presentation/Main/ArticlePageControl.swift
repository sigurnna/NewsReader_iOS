//
//  ArticlePageControl.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 20..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class ArticlePageControl: UIPageControl {
    
    let selectColor = UIColor.hexColor(0xF8BC2B)
    let unselectColor = UIColor.hexColor(0xDCDCDC)
    
    override var currentPage: Int {
        didSet {
            layoutSubviews()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.numberOfPages = 5
        self.currentPage = 0
        
        self.pageIndicatorTintColor = UIColor.clear
        self.currentPageIndicatorTintColor = UIColor.clear
        self.clipsToBounds = false
        
        self.isUserInteractionEnabled = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        for (page, subview) in self.subviews.enumerated() {
            if page < 2 {
                let imageView = UIImageView()
                imageView.frame = CGRect(x: -4, y: -4, width: 10, height: 10)
                imageView.image = imageWithPage(page)?.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = (page == self.currentPage) ? selectColor : unselectColor
                
                subview.addSubview(imageView)
            } else {
                let dotView = UIView()
                dotView.frame = CGRect(x: 0, y: 0, width: 3, height: 3)
                dotView.backgroundColor = (page == self.currentPage) ? selectColor : unselectColor
                dotView.layer.masksToBounds = true
                dotView.layer.cornerRadius = dotView.frame.height / 2
                
                subview.addSubview(dotView)
            }
        }
        
        self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
}

// MARK: - Internals
fileprivate extension ArticlePageControl {

    func imageWithPage(_ page: Int) -> UIImage? {
        if page == 0 {
            return UIImage(named: "iconToday")
        } else if page == 1 {
            return UIImage(named: "iconStar")
        }
        return nil
    }
}

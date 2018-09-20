//
//  ArticlePageControl.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 20..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class ArticlePageControl: UIPageControl {
    
    let selectColor = UIColor.hexColor(0xF8BC2B).cgColor
    let unselectColor = UIColor.hexColor(0xDCDCDC).cgColor

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.numberOfPages = 3
        self.currentPage = 0
        
        self.pageIndicatorTintColor = UIColor.clear
        self.currentPageIndicatorTintColor = UIColor.clear
        self.clipsToBounds = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for (page, subview) in self.subviews.enumerated() {
            let width = self.frame.width / CGFloat(self.numberOfPages)
            subview.frame = CGRect(x: width * CGFloat(page), y: 0, width: width, height: self.frame.height)
            
            let pageView = UIView(frame: CGRect(x: width / 2, y: subview.frame.height / 2 - 15, width: 30, height: 30))
            pageView.layer.masksToBounds = true
            pageView.layer.cornerRadius = pageView.frame.height / 2
            pageView.layer.backgroundColor = (self.currentPage == page) ? selectColor : unselectColor
            
            let imageView = UIImageView(frame: CGRect(x: 7.5, y: 7.5, width: 15, height: 15))
            imageView.image = imageWithPage(page)
            
            pageView.addSubview(imageView)
            subview.addSubview(pageView)
        }
    }
}

// MARK: - Internals
fileprivate extension ArticlePageControl {

    func imageWithPage(_ page: Int) -> UIImage? {
        if page == 0 {
            return UIImage(named: "iconToday")
        } else if page == 1 {
            return UIImage(named: "iconStar")
        } else {
            return UIImage(named: "iconStar")
        }
    }
}

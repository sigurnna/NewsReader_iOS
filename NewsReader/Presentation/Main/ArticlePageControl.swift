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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.numberOfPages = 3
        self.currentPage = 0
        
        self.pageIndicatorTintColor = unselectColor
        self.currentPageIndicatorTintColor = selectColor
        self.clipsToBounds = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Scale Dots
        self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
//        for (page, subview) in self.subviews.enumerated() {
//            let pageView = UIView()
//            pageView.frame = CGRect(x: -7, y: -8, width: 22, height: 22)
//            pageView.layer.masksToBounds = true
//            pageView.layer.cornerRadius = pageView.frame.height / 2
//            pageView.layer.backgroundColor = (self.currentPage == page) ? selectColor.cgColor : unselectColor.cgColor
//
//            if page < currentPage {
//                pageView.frame.origin.x -= 5
//            } else if page > currentPage {
//                pageView.frame.origin.x += 5
//            }
//
//            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 12, height: 12))
//            imageView.image = imageWithPage(page)
//
//            pageView.addSubview(imageView)
//            subview.addSubview(pageView)
//
//            if page != self.currentPage {
//                pageView.isHidden = true
//            }
//        }
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

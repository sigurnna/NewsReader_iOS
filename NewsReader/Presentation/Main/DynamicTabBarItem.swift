//
//  DynamicTabBarItem.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 20..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

class DynamicTabBarItem: UITabBarItem {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 20, height: 20), false, 0.0)
        
        let resizeRect = CGRect(x: 0, y:0, width: 20, height: 20)
        
        self.selectedImage?.draw(in: resizeRect)
        self.image?.draw(in: resizeRect)
        
        self.selectedImage = UIGraphicsGetImageFromCurrentImageContext()
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        // TODO: 탭이 선택된 경우 image animating 하기.
        // TODO: 탭이 선택된 경우 터치 효과 애니메이션 추가하기.
    }
}

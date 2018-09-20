//
//  UIColor+Extension.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 20..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

extension UIColor {
    class func hexColor(_ hex: Int) -> UIColor {
        let red = (hex & 0xff0000) >> 16
        let green = (hex & 0x00ff00) >> 8
        let blue = (hex & 0x0000ff)
        
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1.0)
    }
}

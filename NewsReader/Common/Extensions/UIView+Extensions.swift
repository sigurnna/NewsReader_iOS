//
//  UIView+Extensions.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 10. 28..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

extension UIView {
    var width: CGFloat {
        get {
            return self.frame.width
        }
        set {
            self.frame = CGRect(x: self.x, y: self.y, width: newValue, height: self.height)
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.height
        }
        set {
            self.frame = CGRect(x: self.x, y: self.y, width: self.width, height: newValue)
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame = CGRect(x: newValue, y: self.y, width: self.width, height: self.height)
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRect(x: self.x, y: newValue, width: self.width, height: self.height)
        }
    }
}

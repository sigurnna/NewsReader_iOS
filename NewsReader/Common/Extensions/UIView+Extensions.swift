//
//  UIView+Extensions.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 10. 27..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

extension UIView {
    var globalFrame: CGRect? {
        return self.superview?.convert(self.frame, from: self)
    }
}

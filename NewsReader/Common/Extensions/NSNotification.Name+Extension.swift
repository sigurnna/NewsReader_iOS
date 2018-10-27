//
//  Notification+Extension.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 22..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    static let pageMoved = NSNotification.Name(rawValue: "pageMoved")
    
    static let clearBarItem = NSNotification.Name(rawValue: "clearBarItem")
    static let useSearchBarItem = NSNotification.Name(rawValue: "useSearchBarItem")
    static let useAddBarItem = NSNotification.Name(rawValue: "useAddBarItem")
}

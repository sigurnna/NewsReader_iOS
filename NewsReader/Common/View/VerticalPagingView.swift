//
//  VerticalPagingView.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 17..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class VerticalPagingView: UIScrollView {
    
    let disposeBag = DisposeBag()
    
    var offset: CGPoint?
    var currentPage: Int {
        return Int(self.contentOffset.y / self.frame.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.isPagingEnabled = true
        
        self.rx.contentOffset
            .subscribe(onNext: { [weak self] offset in
                self?.offset = offset
                self?.layoutSubviews()
            })
            .disposed(by: disposeBag)
    }
    
    override func layoutSubviews() {
        for (idx, subview) in self.subviews.reversed().enumerated() {
            if currentPage + 1 == idx {
                if let offsetY = self.offset?.y {
                    subview.frame.origin.y = offsetY
                }
            } else {
                subview.frame.origin.y = self.frame.height * CGFloat(idx)
            }
            
            subview.frame.size.width = self.frame.width
            subview.frame.size.height = self.frame.height
        }
        
        self.contentSize = CGSize(width: self.frame.width,
                                  height: self.frame.height * CGFloat(self.subviews.count))
    }
    
    override func addSubview(_ view: UIView) {
        guard view.frame.height > 300 else { return } // TODO: Temp Code.
        
        view.frame.origin.x = 0
        view.frame.origin.y = 0
        
        super.addSubview(view)
        super.sendSubview(toBack: view)
    }
}

// MARI: - Internal
fileprivate extension VerticalPagingView {

}

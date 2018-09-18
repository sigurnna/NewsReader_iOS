//
//  ArticlePreviewView.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 18..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

enum ArticlePreviewCellType {
    case single
    case multiple
    
    var identifier: String {
        switch self {
        case .single:
            return "\(ArticlePreviewSingleCell.self)"
        case .multiple:
            return "\(ArticlePreviewMultipleCell.self)"
        }
    }
    
    var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

class ArticlePreviewTableView: UITableView {
    
    let disposeBag = DisposeBag()
    
    var items = BehaviorRelay<[ArticleModel]>(value: [])
    var type: ArticlePreviewCellType? {
        didSet {
            guard let cellType = self.type else { return }
            
            self.register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
            
            items
                .bind(to: self.rx.items(cellIdentifier: cellType.identifier)) { [weak self] (row, element, cell) in
                    guard let weakSelf = self else { return }
                    
                    if weakSelf.type == .single {
                        
                    } else {
                        
                    }
                }
                .disposed(by: disposeBag)
        }
    }
}

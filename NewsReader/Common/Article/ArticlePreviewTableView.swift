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
            self.separatorStyle = .none
            self.isScrollEnabled = false
            
            // Bind cells
            self.items
                .bind(to: self.rx.items(cellIdentifier: cellType.identifier)) { [weak self] (row, element, cell) in
                    if let weakSelf = self {
                        if weakSelf.type == .single {
                            let singleCell = cell as! ArticlePreviewSingleCell
                        } else {
                            let multipleCell = cell as! ArticlePreviewMultipleCell
                            multipleCell.selectionStyle = .none
                            multipleCell.thumbnailView.image = UIImage(named: "sample1")
                            multipleCell.titleLabel.text = "Google releases Chrome OS 69 with new Material Theme design and Linux support"
                            multipleCell.descLabel.text = "Google's big chrome overhaul that arrived on desktop and mobile earlier this month is comming to CHromebooks today with the release of CHrome OS version 69."
                        }
                    }
                }
                .disposed(by: disposeBag)
            
            // Set Delegate
            self.rx
                .setDelegate(self)
                .disposed(by: disposeBag)
        }
    }
}

// MARK: - UITableViewDelegate
extension ArticlePreviewTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if type! == .single {
            return tableView.frame.height
        } else {
            return tableView.frame.height / 5
        }
    }
}

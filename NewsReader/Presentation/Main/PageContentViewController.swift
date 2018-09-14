//
//  PageContentViewController.swift
//  NewsReader
//
//  Created by 이승준 on 2018. 9. 9..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import UIKit

/// MainPageViewController에 viewControllers로 추가되는 하위 VC.
/// 각 페이지의 Contents를 담당함.
class PageContentViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UITabvleViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.contentSize.height
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "testCellIdentifier", for: indexPath)
    }
}

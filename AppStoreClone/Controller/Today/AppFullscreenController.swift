//
//  AppFullscreenController.swift
//  AppStoreClone
//
//  Created by Аслан on 03.04.2020.
//  Copyright © 2020 Doka.fun. All rights reserved.
//

import UIKit

class AppFullscreenController: UITableViewController {
    
    var dismissHandler: (() -> ())?
    var todayItem: TodayItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let headerCell = AppFullscreenHeaderCell()
            headerCell.todayCell.todayItem = todayItem
            headerCell.closeButton.addTarget(self, action: #selector(handleDissmis), for: .touchUpInside)
            return headerCell
        }
        
        let cell = AppFullscreenDescriptionCell()
        cell.fullDesc = todayItem
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 450
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    @objc func handleDissmis(button: UIButton) {
        button.isHidden = true
        dismissHandler?()
    }
}

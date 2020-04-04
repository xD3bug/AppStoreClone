//
//  AppFullscreenHeaderCell.swift
//  AppStoreClone
//
//  Created by Аслан on 04.04.2020.
//  Copyright © 2020 Doka.fun. All rights reserved.
//

import UIKit

class AppFullscreenHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
        todayCell.fillSuperview()
        
        addSubview(closeButton)
        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 42, left: 0, bottom: 0, right: 16), size: .init(width: 38, height: 38))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

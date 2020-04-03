//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by Аслан on 03.04.2020.
//  Copyright © 2020 Doka.fun. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "assasin"))
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 300, height: 200))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  AppFullscreenDescriptionCell.swift
//  AppStoreClone
//
//  Created by Аслан on 03.04.2020.
//  Copyright © 2020 Doka.fun. All rights reserved.
//

import UIKit

class AppFullscreenDescriptionCell: UITableViewCell {
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.attributedText = makeText(firstPart: "Moscow", secondPart: "is the capital and most populous city of Russia. With over 12.5 million residents living within the city limits of 2,511 square kilometres (970 sq mi) as of 2018, Moscow is among the world's largest cities, being the largest city in Europe, and the largest city (by area) on the European continent")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descLabel)
        descLabel.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    func makeText(firstPart: String, secondPart: String) -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        var grayTextAttributes = [NSAttributedString.Key: AnyObject]()
        grayTextAttributes[.font] = UIFont.systemFont(ofSize: 18, weight: .regular)
        grayTextAttributes[.foregroundColor] = UIColor.lightGray
        
        let text = NSMutableAttributedString(string: "\(firstPart)", attributes: plainTextAttributes)
        text.append(NSMutableAttributedString(string: " \(secondPart)", attributes: grayTextAttributes))
        
        return text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
